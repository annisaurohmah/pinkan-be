<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Session;

class LevelSessionController extends Controller
{
    /**
     * Tampilkan daftar sesi berdasarkan level untuk user yang sedang login.
     *
     * @param  int  $level_id
     * @return \Illuminate\Http\Response
     */
    public function getSessionsByLevel(Request $request, $level_id)
    {
        $user = $request->user();

        // Dapatkan daftar sesi yang terkait dengan level dan user yang sedang login
        $sessions = Session::where('id_user', $user->id)
            ->whereHas('responses.question.level', function ($query) use ($level_id) {
                $query->where('id', $level_id);
            })->get();

        return response()->json([
            'level_id' => $level_id,
            'sessions' => $sessions
        ]);
    }
}
