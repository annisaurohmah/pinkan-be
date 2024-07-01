<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Session;

class UserController extends Controller
{
    public function getUserData(Request $request)
    {
        $user = Auth::user();

        // Fetch user sessions with related responses, questions, chapters, levels, and games
        $sessions = Session::with(['responses.question.chapter.levels', 'responses.question.chapter.game'])
                            ->where('user_id', $user->id)
                            ->get();

        return response()->json([
            'user' => $user,
            'sessions' => $sessions,
        ]);
    }
}
