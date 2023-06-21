<?php namespace Tests\APIs;

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Tests\ApiTestTrait;
use App\Models\JobRecommendation;

class JobRecommendationApiTest extends TestCase
{
    use ApiTestTrait, WithoutMiddleware, DatabaseTransactions;

    /**
     * @test
     */
    public function test_create_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->make()->toArray();

        $this->response = $this->json(
            'POST',
            '/api/job_recommendations', $jobRecommendation
        );

        $this->assertApiResponse($jobRecommendation);
    }

    /**
     * @test
     */
    public function test_read_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->create();

        $this->response = $this->json(
            'GET',
            '/api/job_recommendations/'.$jobRecommendation->id
        );

        $this->assertApiResponse($jobRecommendation->toArray());
    }

    /**
     * @test
     */
    public function test_update_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->create();
        $editedJobRecommendation = JobRecommendation::factory()->make()->toArray();

        $this->response = $this->json(
            'PUT',
            '/api/job_recommendations/'.$jobRecommendation->id,
            $editedJobRecommendation
        );

        $this->assertApiResponse($editedJobRecommendation);
    }

    /**
     * @test
     */
    public function test_delete_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->create();

        $this->response = $this->json(
            'DELETE',
             '/api/job_recommendations/'.$jobRecommendation->id
         );

        $this->assertApiSuccess();
        $this->response = $this->json(
            'GET',
            '/api/job_recommendations/'.$jobRecommendation->id
        );

        $this->response->assertStatus(404);
    }
}
