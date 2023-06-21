<?php namespace Tests\APIs;

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Tests\ApiTestTrait;
use App\Models\Field;

class FieldApiTest extends TestCase
{
    use ApiTestTrait, WithoutMiddleware, DatabaseTransactions;

    /**
     * @test
     */
    public function test_create_field()
    {
        $field = Field::factory()->make()->toArray();

        $this->response = $this->json(
            'POST',
            '/api/fields', $field
        );

        $this->assertApiResponse($field);
    }

    /**
     * @test
     */
    public function test_read_field()
    {
        $field = Field::factory()->create();

        $this->response = $this->json(
            'GET',
            '/api/fields/'.$field->id
        );

        $this->assertApiResponse($field->toArray());
    }

    /**
     * @test
     */
    public function test_update_field()
    {
        $field = Field::factory()->create();
        $editedField = Field::factory()->make()->toArray();

        $this->response = $this->json(
            'PUT',
            '/api/fields/'.$field->id,
            $editedField
        );

        $this->assertApiResponse($editedField);
    }

    /**
     * @test
     */
    public function test_delete_field()
    {
        $field = Field::factory()->create();

        $this->response = $this->json(
            'DELETE',
             '/api/fields/'.$field->id
         );

        $this->assertApiSuccess();
        $this->response = $this->json(
            'GET',
            '/api/fields/'.$field->id
        );

        $this->response->assertStatus(404);
    }
}
