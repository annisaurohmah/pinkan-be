<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Response;
use App\Models\Session;

class ResponseController extends Controller
{
    public function storeResponse(Request $request)
    {
        // Validasi input
        $request->validate([
            'session_id' => 'required|integer|exists:sessions,id',
            'question_id' => 'required|integer|exists:questions,id',
            'user_answer' => 'required|boolean',
        ]);

        // Simpan jawaban ke dalam database
        $response = new Response();
        $response->id_session = $request->input('session_id');
        $response->id_question = $request->input('question_id');
        $response->response = $request->input('user_answer');
        $response->save();

        return response()->json(['message' => 'Jawaban berhasil disimpan'], 200);
    }

    public function checkScore(Request $request)
    {
        // Validasi input
        $request->validate([
            'session_id' => 'required|integer|exists:sessions,id',
        ]);

        $session_id = $request->input('session_id');
        $score = Session::find($session_id)->score;

        return response()->json([
            'session_id' => $session_id,
            'score' => $score
        ]);
    }
}
