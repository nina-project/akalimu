<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Job
 * @package App\Models
 * @version June 7, 2023, 8:27 am UTC
 *
 * @property \App\Models\Category $category
 * @property \App\Models\User $postedBy
 * @property \Illuminate\Database\Eloquent\Collection $jobrecommendations
 * @property string $title
 * @property integer $category_id
 * @property string $description
 * @property string $location
 * @property number $wage
 * @property integer $posted_by
 */
class Job extends Model
{

    use HasFactory;

    public $table = 'jobs';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';




    public $fillable = [
        'title',
        'category_id',
        'description',
        'location',
        'wage',
        'posted_by'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'title' => 'string',
        'description' => 'string',
        'location' => 'string',
        'wage' => 'float',
        'posted_by' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'title' => 'required|string|max:255',
        'description' => 'nullable|string',
        'location' => 'nullable|string|max:255',
        'wage' => 'required|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];


    public function categories()
    {
        return $this->belongsToMany(\App\Models\Category::class, 'category_job');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function postedBy()
    {
        return $this->belongsTo(\App\Models\User::class, 'posted_by');
    }

  
    public function jobrecommendations()
    {
        return $this->belongsToMany(\App\Models\User::class, 'jobrecommendations')->withPivot('score');
    }
}
