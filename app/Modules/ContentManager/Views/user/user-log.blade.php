@extends('layouts.admin')

@section('content')
    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>{{ $userName }} log history</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                @if(count($userLog) > 0)
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>Time and Date</th>
                            <th>Log history</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $i = 0; ?>
                        @foreach ($userLog as $log)
                            {{--{{dd($log)}}--}}
                            <?php $i++;?>
                            <tr id="tr-{{ $log->id }}">
                                <td>
                                    <span>{{ (($userLog->currentPage() - 1) * ($userLog->perPage())) + $i }}</span>
                                </td>
                                <td>
                                    {{$log->created_at }}
                                </td>
                                <td>
                                    {{ Admin::userLogSerial($log->meta_value ,'desc')   }}
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{$userLog->links()}}
                @else
                    <h2>No log.</h2>
                @endif
            </div>
        </div>
    </div>
@endsection