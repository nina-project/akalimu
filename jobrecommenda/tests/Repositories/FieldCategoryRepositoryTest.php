<?php namespace Tests\Repositories;

use App\Models\FieldCategory;
use App\Repositories\FieldCategoryRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Tests\ApiTestTrait;

class FieldCategoryRepositoryTest extends TestCase
{
    use ApiTestTrait, DatabaseTransactions;

    /**
     * @var FieldCategoryRepository
     */
    protected $fieldCategoryRepo;

    public function setUp() : void
    {
        parent::setUp();
        $this->fieldCategoryRepo = \App::make(FieldCategoryRepository::class);
    }

    /**
     * @test create
     */
    public function test_create_field_category()
    {
        $fieldCategory = FieldCategory::factory()->make()->toArray();

        $createdFieldCategory = $this->fieldCategoryRepo->create($fieldCategory);

        $createdFieldCategory = $createdFieldCategory->toArray();
        $this->assertArrayHasKey('id', $createdFieldCategory);
        $this->assertNotNull($createdFieldCategory['id'], 'Created FieldCategory must have id specified');
        $this->assertNotNull(FieldCategory::find($createdFieldCategory['id']), 'FieldCategory with given id must be in DB');
        $this->assertModelData($fieldCategory, $createdFieldCategory);
    }

    /**
     * @test read
     */
    public function test_read_field_category()
    {
        $fieldCategory = FieldCategory::factory()->create();

        $dbFieldCategory = $this->fieldCategoryRepo->find($fieldCategory->id);

        $dbFieldCategory = $dbFieldCategory->toArray();
        $this->assertModelData($fieldCategory->toArray(), $dbFieldCategory);
    }

    /**
     * @test update
     */
    public function test_update_field_category()
    {
        $fieldCategory = FieldCategory::factory()->create();
        $fakeFieldCategory = FieldCategory::factory()->make()->toArray();

        $updatedFieldCategory = $this->fieldCategoryRepo->update($fakeFieldCategory, $fieldCategory->id);

        $this->assertModelData($fakeFieldCategory, $updatedFieldCategory->toArray());
        $dbFieldCategory = $this->fieldCategoryRepo->find($fieldCategory->id);
        $this->assertModelData($fakeFieldCategory, $dbFieldCategory->toArray());
    }

    /**
     * @test delete
     */
    public function test_delete_field_category()
    {
        $fieldCategory = FieldCategory::factory()->create();

        $resp = $this->fieldCategoryRepo->delete($fieldCategory->id);

        $this->assertTrue($resp);
        $this->assertNull(FieldCategory::find($fieldCategory->id), 'FieldCategory should not exist in DB');
    }
}
