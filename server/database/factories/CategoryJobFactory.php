<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class CategoryJobFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'job_id' => $this->faker->numberBetween(1,200),
            'category_id' => $this->faker->numberBetween(1,140),
            'created_at' => now()->modify('-5 hour')->format('Y-m-d H:i:s'),
            'updated_at' => now()->modify('-5 hour')->format('Y-m-d H:i:s'),
        ];
    }
}
