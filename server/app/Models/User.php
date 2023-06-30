<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;

/**
 * Class User
 * @package App\Models
 * @version April 13, 2023, 12:29 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection $fieldUsers
 * @property \Illuminate\Database\Eloquent\Collection $jobrecommendations
 * @property \Illuminate\Database\Eloquent\Collection $jobs
 * @property string $name
 * @property string $email
 * @property string|\Carbon\Carbon $email_verified_at
 * @property string $password
 * @property string $remember_token
 */
class User extends Authenticatable implements JWTSubject
{

    use HasApiTokens, HasFactory, Notifiable;

    public $table = 'users';

    public $fillable = [
        'name',
        'email',
        'password',
        'country',
        'city',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];


    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

   /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function interests() {
        return $this->belongsToMany(Category::class);
    }

    public function jobrecommendations()
    {
        return $this->belongsToMany(\App\Models\Job::class)->withPivot("score");
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function jobs()
    {
        return $this->hasMany(\App\Models\Job::class, 'posted_by');
    }
}
