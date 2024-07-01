<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Chapter;
use App\Models\Level;

class GameController extends Controller
{
    public function getChapters($id_game)
    {
        $chapters = Chapter::where('id_game', $id_game)->get();
        return response()->json([
            'chapters' => $chapters
        ]);
    }

    public function getLevels($id_game, $id_chapter)
    {
    

        // Dapatkan levels berdasarkan id_chapter dan id_game
        $levels = Level::where('id_chapter', $id_chapter)
            ->whereHas('chapter', function ($query) use ($id_game) {
                $query->where('id_game', $id_game);
            })->get();
        return response()->json([
            'levels' => $levels
        ]);
    }
}
