<?php

namespace Database\Seeders;

use App\Models\Field;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\FieldCategory::factory(10)->create();
        \App\Models\Field::factory(100)->create();
        \App\Models\User::factory(60)->create();
        \App\Models\Job::factory(200)->create();

        $users = User::all();
        $fields = Field::all();

        $users->each(function ($user) use ($fields) {
            $user->interests()->attach(
                $fields->random(rand(1,12))->pluck('id')->toArray()
            );
        });
    }
}
