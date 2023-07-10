<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\CategoryJob;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Category::factory(140)->create();
        \App\Models\User::factory(60)->create();
        \App\Models\Job::factory(200)->create();

        $users = User::all();
        $categories = Category::all();

        $users->each(function ($user) use ($categories) {
            $user->interests()->attach(
                $categories->random(rand(1,140))->pluck('id')->toArray()
            );
        });
        \App\Models\JobRecommendation::factory(400)->create();
        \App\Models\CategoryJob::factory(800)->create();


        
    }
}
