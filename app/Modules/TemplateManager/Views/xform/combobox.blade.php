<label for="{{ $group.'['.$input['name'].']' }}">{{ $input['label'] }}</label>

<select class="form-control" id="{{ $group.'['.$input['name'].']' }}" name="{{ $group.'['.$input['name'].']' }}">
    @foreach($input['options'] as $key => $value)
        <option {{ (!empty($input['value']) && ($input['value'] == $key)) ? "selected='selected'" : "" }} value="{{ $key }}">{{ $value }}</option>
    @endforeach
</select>