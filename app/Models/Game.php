<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Game
 * 
 * @property int $id
 * @property string $game_name
 * 
 * @property Collection|Chapter[] $chapters
 *
 * @package App\Models
 */
class Game extends Model
{
	protected $table = 'games';
	public $timestamps = false;

	protected $fillable = [
		'game_name'
	];

	public function chapters()
	{
		return $this->hasMany(Chapter::class, 'id_game');
	}
}
