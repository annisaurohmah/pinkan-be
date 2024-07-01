<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Level;

class LevelController extends Controller
{
    /**
     * Tampilkan daftar level untuk user yang sedang login.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = $request->user();

        // Dapatkan daftar level yang pernah dimainkan oleh user
        $levels = Level::whereHas('questions.responses.session', function ($query) use ($user) {
            $query->where('id_user', $user->id);
        })->get();

        return response()->json([
            'levels' => $levels
        ]);
    }
}
