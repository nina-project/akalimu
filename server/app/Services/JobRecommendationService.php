<?php

namespace App\Services;

use App\Models\Job;
use App\Models\JobRecommendation;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use PhpParser\Node\Stmt\Catch_;
use Throwable;

class JobRecommendationService
{
    public function recommendJobs()
    {
        //check if there are users created in less than 24 hrs from now
        $users = User::where('updated_at', '>=', now()->subHours(24))->get();
        $jobs = Job::where('updated_at', '>=', now()->subHours(24))->get();

        // dd($users, $jobs);

        if ($users->isEmpty() && $jobs->isEmpty()) {
            return;
        }

        if($users->isNotEmpty()) {
            foreach ($users as $user) {
                // Get all jobs
                $jobs = Job::all();
    
                // Create user's interests vector
                $userInterests = $user->interests()->pluck('name')->toArray();
                $userInterestsVector = $this->interestsToVector($userInterests);
    
                // Create user's location vector
                $userLocation = [$user->country, $user->city];
    
    
                $recommendedJobs = [];
    
                foreach ($jobs as $job) {
                    // Create job vector
                    $jobCategories = $job->categories()->pluck('name')->join(' ');
                    $jobTitle = $job->title . ' ' . $jobCategories;
                    $jobDescription = $job->description;
                    $jobLocation = [$job->location];
                    $jobVector = $this->jobToVector($jobTitle, $jobDescription, $jobLocation);
    
                    // Calculate similarity scores
                    $interestsScore = $this->cosineSimilarity($userInterestsVector, $jobVector['interests']);
                    $locationScore = $this->cosineSimilarity($userLocation, $jobVector['location']);
    
                    // Calculate overall similarity score
                    $overallScore = ($interestsScore + $locationScore) / 2;
    
                    // Save recommendation to database if score is greater than 0.5
                    if ($overallScore > 0.5) {
                        $recommendation = JobRecommendation::updateOrCreate(
                            ['user_id' => $user->id, 'job_id' => $job->id],
                            ['score' => $overallScore]
                        );    
                    }
                }
            }
        } else if ($jobs->isNotEmpty()) {
            foreach ($jobs as $job) {
                // Get all jobs
                $users = User::all();
    
                // Create user's interests vector
                $jobCategories = $job->categories()->pluck('name')->toArray();
                $jobCategoriesVector = $this->interestsToVector($jobCategories);
    
                // Create user's location vector
                $jobLocation = [$job->location];
    
                foreach ($users as $user) {
                    // Create job vector
                    $userInterests = $user->interests()->pluck('name')->join(' ');
                    $userTitle = $user->title . ' ' . $userInterests;
                    $userDescription = $user->description;
                    $userLocation = [$user->country, $user->city];
                    $userVector = $this->jobToVector($userTitle, $userDescription, $userLocation);
    
                    // Calculate similarity scores
                    $interestsScore = $this->cosineSimilarity($jobCategoriesVector, $userVector['interests']);
                    $locationScore = $this->cosineSimilarity($jobLocation, $userVector['location']);
    
                    // Calculate overall similarity score
                    $overallScore = ($interestsScore + $locationScore) / 2;
    
                    // Save recommendation to database if score is greater than 0.5
                    if ($overallScore > 0.5) {
                        $recommendation = JobRecommendation::updateOrCreate(
                            ['user_id' => $user->id, 'job_id' => $job->id],
                            ['score' => $overallScore]
                        );
                    }
                }
            }
        }
        
 
    }

    private function interestsToVector($interestsArray)
    {
        // Get all unique interests
        $uniqueInterests = array_unique($interestsArray);

        // Create a vector with all zeros
        $vector = array_fill_keys($uniqueInterests, 0);

        // Loop through the interests and set the corresponding vector value to 1
        foreach ($interestsArray as $interest) {
            $vector[$interest] = 1;
        }

        return $vector;
    }

    private function jobToVector($title, $description, $location)
    {
        // Concatenate the job's title and description into a single string
        $text = $title . ' ' . $description . ' ' . $location[0] . ' ' . $location[1];

        // Remove special characters and convert to lowercase
        $text = preg_replace('/[^a-zA-Z0-9\s]/', '', $text);
        $text = strtolower($text);

        // Split the text into words
        $words = explode(' ', $text);

        // Get all unique words
        $uniqueWords = array_unique($words);

        // Create a vector
        $vector = [
            'interests' => array_fill_keys($uniqueWords, 0),
            'location' => $location
        ];

        // Loop through the words and set the corresponding vector value to 1
        foreach ($words as $word) {
            $vector['interests'][$word] = 1;
        }

        return $vector;
    }

    private function cosineSimilarity($vectorA, $vectorB)
    {
        $dotProduct = 0;
        $magnitudeA = 0;
        $magnitudeB = 0;

        // Calculate the dot product and magnitude of vectors A and B
        foreach ($vectorA as $key => $value) {
            try {
                $dotProduct += ($vectorA[$key] * $vectorB[$key]);
                $magnitudeA += pow($vectorA[$key], 2);
                $magnitudeB += pow($vectorB[$key], 2);
            } catch (Throwable $t) {
                error_log("Key no found");
            }
        }

        // Calculate the cosine similarity
        if ($magnitudeA == 0 || $magnitudeB == 0) {
            return 0;
        } else {
            return $dotProduct / (sqrt($magnitudeA) * sqrt($magnitudeB));
        }
    }
}
