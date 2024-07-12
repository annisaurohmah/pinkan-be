<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\LevelSessionController;
use App\Http\Controllers\SessionSummaryController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\ResponseController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\UserController;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::put('/update-profile', [UserController::class, 'update']);

    Route::get('/chapters/{id_game}', [GameController::class, 'getChapters']);
    Route::get('/chapters/{id_game}/levels/{id_chapter}', [GameController::class, 'getLevels']);

    // Route::get('/levels', [LevelController::class, 'index']);
    Route::get('/levels/{level_id}/sessions', [LevelSessionController::class, 'getSessionsByLevel']);
    Route::get('/levels/{level_id}/sessions/{session_id}/summary', [SessionSummaryController::class, 'sessionSummaryByLevelAndSession']);

    Route::post('/save-response', [ResponseController::class, 'storeResponse']);
    Route::get('/responses', [ResponseController::class, 'checkScore']);

    Route::get('/start-session', [SessionController::class, 'startSession']);
    Route::post('/end-session', [SessionController::class, 'endSession']);
    
    Route::get('/dashboard', [DashboardController::class, 'index']);

});
