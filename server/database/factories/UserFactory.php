<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class UserFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = User::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
        'email' => $this->faker->safeEmail(),
        'country' => $this->faker->country,
        'city' => $this->faker->city,
        'email_verified_at' => $this->faker->date('Y-m-d H:i:s'),
        'password' => '$2y$10$qTum7ziZPBLJ4/AfU5FNcescOpuDdfb1pctHpsxjpeUKhAGQD87IS',
        'remember_token' => $this->faker->word,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
