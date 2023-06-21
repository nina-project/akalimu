<div class="table-responsive">
    <table class="table" id="jobs-table">
        <thead>
        <tr>
            <th>Title</th>
        <th>Category Id</th>
        <th>Description</th>
        <th>Location</th>
        <th>Wage</th>
        <th>Posted By</th>
            <th colspan="3">Action</th>
        </tr>
        </thead>
        <tbody>
        @foreach($jobs as $job)
            <tr>
                <td>{{ $job->title }}</td>
            <td>{{ $job->category_id }}</td>
            <td>{{ $job->description }}</td>
            <td>{{ $job->location }}</td>
            <td>{{ $job->wage }}</td>
            <td>{{ $job->posted_by }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['jobs.destroy', $job->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('jobs.show', [$job->id]) }}"
                           class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('jobs.edit', [$job->id]) }}"
                           class='btn btn-default btn-xs'>
                            <i class="far fa-edit"></i>
                        </a>
                        {!! Form::button('<i class="far fa-trash-alt"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
