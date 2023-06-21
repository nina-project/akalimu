<!-- Title Field -->
<div class="col-sm-12">
    {!! Form::label('title', 'Title:') !!}
    <p>{{ $job->title }}</p>
</div>

<!-- Category Id Field -->
<div class="col-sm-12">
    {!! Form::label('category_id', 'Category Id:') !!}
    <p>{{ $job->category_id }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $job->description }}</p>
</div>

<!-- Location Field -->
<div class="col-sm-12">
    {!! Form::label('location', 'Location:') !!}
    <p>{{ $job->location }}</p>
</div>

<!-- Wage Field -->
<div class="col-sm-12">
    {!! Form::label('wage', 'Wage:') !!}
    <p>{{ $job->wage }}</p>
</div>

<!-- Posted By Field -->
<div class="col-sm-12">
    {!! Form::label('posted_by', 'Posted By:') !!}
    <p>{{ $job->posted_by }}</p>
</div>

