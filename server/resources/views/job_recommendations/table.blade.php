<div class="table-responsive">
    <table class="table" id="jobRecommendations-table">
        <thead>
        <tr>
            <th>Job</th>
        <th>User</th>
            <th colspan="3">Action</th>
        </tr>
        </thead>
        <tbody>
        @foreach($jobRecommendations as $jobRecommendation)
            <tr>
                <td>{{ $jobRecommendation->job->title }}</td>
            <td>{{ $jobRecommendation->user->name }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['jobRecommendations.destroy', $jobRecommendation->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('jobRecommendations.show', [$jobRecommendation->id]) }}"
                           class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('jobRecommendations.edit', [$jobRecommendation->id]) }}"
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
    <div class="p-3 float-right">
        {{ $jobRecommendations->links() }}
    </div>
</div>
