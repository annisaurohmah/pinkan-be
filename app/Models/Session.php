<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Session
 * 
 * @property int $id
 * @property int $id_user
 * @property int $score
 * @property Carbon $start_time
 * @property Carbon $end_time
 * 
 * @property User $user
 * @property Collection|Response[] $responses
 *
 * @package App\Models
 */
class Session extends Model
{
	protected $table = 'sessions';
	public $timestamps = false;

	protected $casts = [
		'id_user' => 'int',
		'score' => 'int',
		'start_time' => 'datetime',
		'end_time' => 'datetime'
	];

	protected $fillable = [
		'id_user',
		'score',
		'start_time',
		'end_time'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'id_user');
	}

	public function responses()
	{
		return $this->hasMany(Response::class, 'id_session');
	}
}
