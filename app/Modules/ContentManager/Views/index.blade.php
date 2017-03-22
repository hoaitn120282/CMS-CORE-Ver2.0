@extends(Admin::theme())

@section('content')
    <div class="row top_tiles">
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
            <div class="tile-stats">
                <div class="icon"><i class="fa fa-file-o"></i></div>
                <div class="count">{{ $sites }}</div>
                <h3>Sites</h3>
                <p>Lorem ipsum psdea itgum rixt.</p>
            </div>
        </div>
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
            <div class="tile-stats">
                <div class="icon"><i class="fa fa-columns"></i></div>
                <div class="count">{{ $templates }}</div>
                <h3>Templates</h3>
                <p>Lorem ipsum psdea itgum rixt.</p>
            </div>
        </div>
        <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
            <div class="tile-stats">
                <div class="icon"><i class="fa fa-sort-amount-desc"></i></div>
                <div class="count">{{ $users->total() }}</div>
                <h3>Active Users</h3>
                <p>Lorem ipsum psdea itgum rixt.</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="x_panel">
            <div class="x_title">
                <h2>Admin activities</h2>
                <div class="box-filter pull-right">
                    <form class="form-horizontal"  method="get">
                        <input type="text" name="q" value="{{$q}}" placeholder="Search by admin name" id="searchContent">
                        <button type="submit" class="btn btn-success btn-search"> <i class="fa  fa-search"></i> Search</button>
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                @if(count($users) > 0)
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>Admin name</th>
                            <th>Time and Date</th>
                            <th>Latest activity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $i = 0; ?>
                        @foreach ($users as $user)
                            <?php $i++;?>
                            @if($user->meta->first()['meta_value'] != "")
                                <tr id="tr-{{ $user->id }}">
                                    <td>
                                        <span>{{$i}}</span>
                                    </td>
                                    <td>
                                        <a href="{{ Admin::route('contentManager.user.log', ['id' => $user->id, 'userName'=>$user->name]) }}">{{ $user->name }}</a>
                                    </td>
                                    <td>
                                        {{$user->meta->first()['created_at'] }}
                                    </td>
                                    <td>
                                        {{ Admin::userLogSerial($user->meta->first()['meta_value'] ,'desc')   }}
                                    </td>
                                </tr>
                            @endif
                        @endforeach
                        </tbody>
                    </table>
                    {{$users->appends(['q' => $q])->links()}}
                @else
                    <h2>No clinic site is available. Please create new one.</h2>
                @endif
            </div>
        </div>
    </div>
@endsection