<?php

namespace Database\Factories;

use App\Models\Job;
use Illuminate\Database\Eloquent\Factories\Factory;

class JobFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Job::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $date = $this->faker->dateTimeBetween($startDate = '-1 years', $endDate = 'now', $timezone = null);
        return [
            'title' => $this->faker->jobTitle,
        'description' => $this->faker->text,
        'location' => $this->faker->country . ',' . $this->faker->city,
        'wage' => $this->faker->numberBetween(5000, 1000000),
        'posted_by' => $this->faker->numberBetween(1, 60),
        'created_at' => $date->modify('+1 month')->format('Y-m-d H:i:s'),
        'updated_at' => now()->modify('-5 hour')->format('Y-m-d H:i:s'),
        ];
    }
}
