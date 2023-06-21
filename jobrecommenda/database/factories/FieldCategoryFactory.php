<?php

namespace Database\Factories;

use App\Models\FieldCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class FieldCategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = FieldCategory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->word,
        'slug' => $this->faker->word,
        'description' => $this->faker->text,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
