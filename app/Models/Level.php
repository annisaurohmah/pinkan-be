<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Level
 * 
 * @property int $id
 * @property int $id_chapter
 * @property string $level_name
 * 
 * @property Chapter $chapter
 * @property Collection|Question[] $questions
 *
 * @package App\Models
 */
class Level extends Model
{
	protected $table = 'levels';
	public $timestamps = false;

	protected $casts = [
		'id_chapter' => 'int'
	];

	protected $fillable = [
		'id_chapter',
		'level_name'
	];

	public function chapter()
	{
		return $this->belongsTo(Chapter::class, 'id_chapter');
	}

	public function questions()
	{
		return $this->hasMany(Question::class, 'id_level');
	}
}
