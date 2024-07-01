<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Question
 * 
 * @property int $id
 * @property int $id_level
 * @property string $question
 * @property string $correct_answer
 * 
 * @property Level $level
 * @property Collection|Response[] $responses
 *
 * @package App\Models
 */
class Question extends Model
{
	protected $table = 'questions';
	public $timestamps = false;

	protected $casts = [
		'id_level' => 'int'
	];

	protected $fillable = [
		'id_level',
		'question',
		'correct_answer'
	];

	public function level()
	{
		return $this->belongsTo(Level::class, 'id_level');
	}

	public function responses()
	{
		return $this->hasMany(Response::class, 'id_question');
	}
}
