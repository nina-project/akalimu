<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

class CategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Category::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $date = $this->faker->dateTimeBetween($startDate = '-1 years', $endDate = 'now', $timezone = null);
        return [
            'name' => $this->faker->jobTitle,
        'created_at' => $date->format('Y-m-d H:i:s'),
        'updated_at' => $date->modify('+1 day')->format('Y-m-d H:i:s'),
        ];
    }
}
