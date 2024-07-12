<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Response;
use App\Models\Question;
use App\Models\Level;
use App\Models\Chapter;

class SessionSummaryController extends Controller
{
    /**
     * Tampilkan ringkasan sesi permainan berdasarkan level dan sesi untuk user yang sedang login.
     *
     * @param  int  $level_id
     * @param  int  $session_id
     * @return \Illuminate\Http\Response
     */
    public function sessionSummaryByLevelAndSession(Request $request, $level_id, $session_id)
    {
        $user = $request->user();

        // Validasi input
        // Dapatkan semua responses untuk sesi dan level tersebut yang terkait dengan user yang sedang login
        $responses = Response::where('id_session', $session_id)
                             ->whereHas('session', function ($query) use ($user) {
                                 $query->where('id_user', $user->id);
                             })
                             ->whereHas('question.level', function ($query) use ($level_id) {
                                 $query->where('id', $level_id);
                             })
                             ->with(['question.level.chapter', 'question'])
                             ->get();


        // Grupkan responses berdasarkan level
        $summary = [];
        foreach ($responses as $response) {
            $level = $response->question->level;
            $chapter = $level->chapter;
            $chapter_name = $chapter->chapter_name;
            $level_name = $level->level_name;

            $summary[] = [
                'question_id' => $response->id_question,
                'question' => $response->question->question,
                'user_answer' => $response->response,
                'correct_answer' => $response->question->correct_answer
            ];
        }

        return response()->json([
            'level_id' => $level_id,
            'session_id' => $session_id,
            'chapter' => $chapter_name,
            'level' => $level_name,
            'summary' => $summary
        ]);
    }
}
