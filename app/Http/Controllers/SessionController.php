<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Session;
use Illuminate\Support\Facades\Auth;
use App\Models\Response;

class SessionController extends Controller
{
    public function startSession(Request $request)
    {
        $user = $request->user();
        $user_id = $user->id;

        // Buat sesi game baru
        $session = new Session();
        $session->id_user = $user_id;
        $session->start_time = now();
        $session->save();

        return response()->json(['session_id' => $session->id, 'message' => 'Sesi game berhasil dimulai'], 201);
    }

    public function endSession(Request $request){
        $user = Auth::user();
        $session_id = $request->input('session_id');

        // Dapatkan semua responses untuk sesi tersebut
        $responses = Response::where('id_session', $session_id)->get();

        $correct_answers = 0;
        $total_questions = $responses->count();

        // Hitung jawaban yang benar
        foreach ($responses as $response) {
            if ($response->response == '1') {
                $correct_answers++;
            }
        }

        // Hitung score
        $score = ($total_questions > 0) ? ($correct_answers / $total_questions) * 100 : 0;
        $session = Session::where('id_user', $user->id)->where('end_time', null)->first();
        $session->score = $score;
        $session->end_time = now();
        $session->save();

        return response()->json(['message' => 'Sesi game berhasil diakhiri'], 200);
    }
        
}
