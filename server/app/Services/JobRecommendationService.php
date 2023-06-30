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
        foreach (User::all() as $user) {
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
                $jobLocation = [$job->country, $job->city];
                $jobVector = $this->jobToVector($jobTitle, $jobDescription, $jobLocation);

                // Calculate similarity scores
                $interestsScore = $this->cosineSimilarity($userInterestsVector, $jobVector['interests']);
                $locationScore = $this->cosineSimilarity($userLocation, $jobVector['location']);

                // Calculate overall similarity score
                $overallScore = ($interestsScore + $locationScore) / 2;

                // Save recommendation to database if score is greater than 0.5
                if ($overallScore > 0.5) {
                    $recommendation = new JobRecommendation();
                    $recommendation->user_id = $user->id;
                    $recommendation->job_id = $job->id;
                    $recommendation->score = $overallScore;
                    $recommendation->save();

                    // Add job to recommended jobs array
                    $job->score = $overallScore;
                    $recommendedJobs[] = $job;
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
