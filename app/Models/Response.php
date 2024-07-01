<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Response
 * 
 * @property int $id
 * @property int $id_question
 * @property int $id_session
 * @property string $response
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Question $question
 * @property Session $session
 *
 * @package App\Models
 */
class Response extends Model
{
	protected $table = 'responses';

	protected $casts = [
		'id_question' => 'int',
		'id_session' => 'int'
	];

	protected $fillable = [
		'id_question',
		'id_session',
		'response'
	];

	public function question()
	{
		return $this->belongsTo(Question::class, 'id_question');
	}

	public function session()
	{
		return $this->belongsTo(Session::class, 'id_session');
	}
}
