<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $field->name }}</p>
</div>

<!-- Slug Field -->
<div class="col-sm-12">
    {!! Form::label('slug', 'Slug:') !!}
    <p>{{ $field->slug }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $field->description }}</p>
</div>

<!-- Field Category Id Field -->
<div class="col-sm-12">
    {!! Form::label('field_category_id', 'Field Category Id:') !!}
    <p>{{ $field->field_category_id }}</p>
</div>

