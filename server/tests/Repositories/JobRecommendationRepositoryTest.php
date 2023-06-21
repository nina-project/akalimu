<?php namespace Tests\Repositories;

use App\Models\JobRecommendation;
use App\Repositories\JobRecommendationRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Tests\ApiTestTrait;

class JobRecommendationRepositoryTest extends TestCase
{
    use ApiTestTrait, DatabaseTransactions;

    /**
     * @var JobRecommendationRepository
     */
    protected $jobRecommendationRepo;

    public function setUp() : void
    {
        parent::setUp();
        $this->jobRecommendationRepo = \App::make(JobRecommendationRepository::class);
    }

    /**
     * @test create
     */
    public function test_create_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->make()->toArray();

        $createdJobRecommendation = $this->jobRecommendationRepo->create($jobRecommendation);

        $createdJobRecommendation = $createdJobRecommendation->toArray();
        $this->assertArrayHasKey('id', $createdJobRecommendation);
        $this->assertNotNull($createdJobRecommendation['id'], 'Created JobRecommendation must have id specified');
        $this->assertNotNull(JobRecommendation::find($createdJobRecommendation['id']), 'JobRecommendation with given id must be in DB');
        $this->assertModelData($jobRecommendation, $createdJobRecommendation);
    }

    /**
     * @test read
     */
    public function test_read_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->create();

        $dbJobRecommendation = $this->jobRecommendationRepo->find($jobRecommendation->id);

        $dbJobRecommendation = $dbJobRecommendation->toArray();
        $this->assertModelData($jobRecommendation->toArray(), $dbJobRecommendation);
    }

    /**
     * @test update
     */
    public function test_update_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->create();
        $fakeJobRecommendation = JobRecommendation::factory()->make()->toArray();

        $updatedJobRecommendation = $this->jobRecommendationRepo->update($fakeJobRecommendation, $jobRecommendation->id);

        $this->assertModelData($fakeJobRecommendation, $updatedJobRecommendation->toArray());
        $dbJobRecommendation = $this->jobRecommendationRepo->find($jobRecommendation->id);
        $this->assertModelData($fakeJobRecommendation, $dbJobRecommendation->toArray());
    }

    /**
     * @test delete
     */
    public function test_delete_job_recommendation()
    {
        $jobRecommendation = JobRecommendation::factory()->create();

        $resp = $this->jobRecommendationRepo->delete($jobRecommendation->id);

        $this->assertTrue($resp);
        $this->assertNull(JobRecommendation::find($jobRecommendation->id), 'JobRecommendation should not exist in DB');
    }
}
