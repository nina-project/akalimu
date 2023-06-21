<?php namespace Tests\APIs;

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Tests\ApiTestTrait;
use App\Models\FieldCategory;

class FieldCategoryApiTest extends TestCase
{
    use ApiTestTrait, WithoutMiddleware, DatabaseTransactions;

    /**
     * @test
     */
    public function test_create_field_category()
    {
        $fieldCategory = FieldCategory::factory()->make()->toArray();

        $this->response = $this->json(
            'POST',
            '/api/field_categories', $fieldCategory
        );

        $this->assertApiResponse($fieldCategory);
    }

    /**
     * @test
     */
    public function test_read_field_category()
    {
        $fieldCategory = FieldCategory::factory()->create();

        $this->response = $this->json(
            'GET',
            '/api/field_categories/'.$fieldCategory->id
        );

        $this->assertApiResponse($fieldCategory->toArray());
    }

    /**
     * @test
     */
    public function test_update_field_category()
    {
        $fieldCategory = FieldCategory::factory()->create();
        $editedFieldCategory = FieldCategory::factory()->make()->toArray();

        $this->response = $this->json(
            'PUT',
            '/api/field_categories/'.$fieldCategory->id,
            $editedFieldCategory
        );

        $this->assertApiResponse($editedFieldCategory);
    }

    /**
     * @test
     */
    public function test_delete_field_category()
    {
        $fieldCategory = FieldCategory::factory()->create();

        $this->response = $this->json(
            'DELETE',
             '/api/field_categories/'.$fieldCategory->id
         );

        $this->assertApiSuccess();
        $this->response = $this->json(
            'GET',
            '/api/field_categories/'.$fieldCategory->id
        );

        $this->response->assertStatus(404);
    }
}
