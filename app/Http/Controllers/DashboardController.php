<?php

namespace App\Http\Controllers;

use App\Models\Level;
use App\Models\Question;
use App\Models\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $id_user = Auth::user()->id;

        $id_last_played = Session::where('id_user', $id_user)->orderBy('end_time', 'desc')->first();

        if (!$id_last_played) {
            $last_played = null;
        }

        $last_played = Level::select('levels.level_name', 'chapters.chapter_name')
            ->join('chapters', 'chapters.id', '=', 'levels.id_chapter')
            ->join('questions', 'questions.id_level', '=', 'levels.id')
            ->join('responses', 'responses.id_question', '=', 'questions.id')
            ->where('responses.id_session', $id_last_played->id)
            ->orderBy('responses.created_at', 'desc')
            ->first();

        $high_score_baca = Session::where('id_user', $id_user)
            ->join('responses', 'responses.id_session', '=', 'sessions.id')
            ->join('questions', 'responses.id_question', '=', 'questions.id')
            ->join('levels', 'questions.id_level', '=', 'levels.id')
            ->join('chapters', 'levels.id_chapter', '=', 'chapters.id')
            ->where('chapters.id', '1')
            ->max('score');
        if (!$high_score_baca) {
            $high_score_baca = 0;
        }
        $high_score_hitung = Session::where('id_user', $id_user)
            ->join('responses', 'responses.id_session', '=', 'sessions.id')
            ->join('questions', 'responses.id_question', '=', 'questions.id')
            ->join('levels', 'questions.id_level', '=', 'levels.id')
            ->join('chapters', 'levels.id_chapter', '=', 'chapters.id')
            ->where('chapters.id', '2')
            ->max('score');
        if (!$high_score_hitung) {
            $high_score_hitung = 0;
        }

        return response()->json([
            'last_played' => $last_played,
            'high_score_baca' => $high_score_baca,
            'high_score_hitung' => $high_score_hitung
        ], 200);
    }
}
