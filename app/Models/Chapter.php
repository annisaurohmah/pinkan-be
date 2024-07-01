<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Chapter
 * 
 * @property int $id
 * @property int $id_game
 * @property string $chapter_name
 * 
 * @property Game $game
 * @property Collection|Level[] $levels
 *
 * @package App\Models
 */
class Chapter extends Model
{
	protected $table = 'chapters';
	public $timestamps = false;

	protected $casts = [
		'id_game' => 'int'
	];

	protected $fillable = [
		'id_game',
		'chapter_name'
	];

	public function game()
	{
		return $this->belongsTo(Game::class, 'id_game');
	}

	public function levels()
	{
		return $this->hasMany(Level::class, 'id_chapter');
	}
}
