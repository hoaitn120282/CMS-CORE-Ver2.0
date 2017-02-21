<label for="{{ $group.'['.$input['name'].']' }}">{{ $input['label'] }}</label>
<div class="wrap-color-picker">
    <a class="color-picker" style="background-color: {{$input['value'] or "#fff"}}"></a>
    <input type="text" class="form-control input-color-picker" name="{{ $group.'['.$input['name'].']' }}"
           value="{{$input['value'] or "#fff"}}">
</div>