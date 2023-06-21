<?php namespace Tests\Repositories;

use App\Models\Field;
use App\Repositories\FieldRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Tests\ApiTestTrait;

class FieldRepositoryTest extends TestCase
{
    use ApiTestTrait, DatabaseTransactions;

    /**
     * @var FieldRepository
     */
    protected $fieldRepo;

    public function setUp() : void
    {
        parent::setUp();
        $this->fieldRepo = \App::make(FieldRepository::class);
    }

    /**
     * @test create
     */
    public function test_create_field()
    {
        $field = Field::factory()->make()->toArray();

        $createdField = $this->fieldRepo->create($field);

        $createdField = $createdField->toArray();
        $this->assertArrayHasKey('id', $createdField);
        $this->assertNotNull($createdField['id'], 'Created Field must have id specified');
        $this->assertNotNull(Field::find($createdField['id']), 'Field with given id must be in DB');
        $this->assertModelData($field, $createdField);
    }

    /**
     * @test read
     */
    public function test_read_field()
    {
        $field = Field::factory()->create();

        $dbField = $this->fieldRepo->find($field->id);

        $dbField = $dbField->toArray();
        $this->assertModelData($field->toArray(), $dbField);
    }

    /**
     * @test update
     */
    public function test_update_field()
    {
        $field = Field::factory()->create();
        $fakeField = Field::factory()->make()->toArray();

        $updatedField = $this->fieldRepo->update($fakeField, $field->id);

        $this->assertModelData($fakeField, $updatedField->toArray());
        $dbField = $this->fieldRepo->find($field->id);
        $this->assertModelData($fakeField, $dbField->toArray());
    }

    /**
     * @test delete
     */
    public function test_delete_field()
    {
        $field = Field::factory()->create();

        $resp = $this->fieldRepo->delete($field->id);

        $this->assertTrue($resp);
        $this->assertNull(Field::find($field->id), 'Field should not exist in DB');
    }
}
