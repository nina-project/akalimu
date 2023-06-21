<div class="table-responsive">
    <table class="table" id="fields-table">
        <thead>
        <tr>
            <th>Name</th>
        <th>Description</th>
        <th>Field Category Id</th>
            <th colspan="3">Action</th>
        </tr>
        </thead>
        <tbody>
        @foreach($fields as $field)
            <tr>
                <td>{{ $field->name }}</td>
            <td>{{ $field->description }}</td>
            <td>{{ $field->field_category_id }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['fields.destroy', $field->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('fields.show', [$field->id]) }}"
                           class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('fields.edit', [$field->id]) }}"
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
