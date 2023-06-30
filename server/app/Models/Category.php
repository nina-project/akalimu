<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Category
 * @package App\Models
 * @version June 10, 2023, 5:51 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection $categoryUsers
 * @property \Illuminate\Database\Eloquent\Collection $jobs
 * @property string $name
 */
class Category extends Model
{

    use HasFactory;

    public $table = 'categories';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';




    public $fillable = [
        'name'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];

    public function users()
    {
        return $this->belongsToMany(\App\Models\User::class);
    }

    public function jobs()
    {
        return $this->belongsToMany(\App\Models\Job::class, 'category_job');
    }
}
