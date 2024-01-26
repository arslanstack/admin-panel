@extends('admin.admin_app')
@push('styles')
@endpush
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8 col-sm-8 col-xs-8">
        <h2>Locations </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">
                <strong>Locations </strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-4 col-sm-4 col-xs-4 text-right">
        <a class="btn btn-primary text-white t_m_25" data-toggle="modal" data-target="#add_modalbox">
            <i class="fa fa-plus" aria-hidden="true"></i> Add New Location
        </a>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-content">
                    <form id="search_form" action="{{url('admin/locations')}}" method="GET" enctype="multipart/form-data">
                        <div class="form-group row justify-content-end">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="search_query" placeholder="Search by Zip, City, or State" value="{{ old('search_query', $searchParams['search_query'] ?? '') }}">
                                    <span class="input-group-append">
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table id="manage_tbl" class="table table-striped table-bordered dt-responsive" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Sr #</th>
                                    <th>Zip Code</th>
                                    <th>City</th>
                                    <th>State</th>
                                    <th>Creation Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php($i = 1)
                                @foreach($zips as $item)
                                <tr class="gradeX">
                                    <td>{{ $i++ }}</td>
                                    <td>{{$item->zip}}</td>
                                    <td>{{$item->city ? $item->city : 'N/A'}}</td>
                                    <td>{{ $item->state ?  $item->state : 'N/A'}}</td>
                                    <td>{{ date_formated($item->created_at)}}</td>
                                    <td>
                                        <a href="{{url('admin/locations/details/' . $item->zip)}}" class="btn btn-primary btn-sm" data-placement="top" title="Details">Details </a>
                                        <button class="btn btn-danger btn-sm btn_location_delete" data-id="{{$item->id}}" data-text="This action will remove this location as well as all offers and service provider records in it." type="button" data-placement="top" title="Delete">Delete</button>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p>Showing {{ $zips->firstItem() }} to {{ $zips->lastItem() }} of {{ $zips->total() }} entries</p>
                        </div>
                        <div class="col-md-4 text-right float-right float-end">
                            {{ $zips->links('pagination::bootstrap-4') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal show fade" id="add_modalbox" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content animated flipInY">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">Add Zip Location</h5>
            </div>
            <div class="modal-body">
                <form id="add_zip_form" method="post">
                    @csrf
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><strong>Zip Code</strong></label>
                        <div class="col-sm-8">
                            <input type="text" name="zip" class="form-control" placeholder="Zip">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><strong>City</strong></label>
                        <div class="col-sm-8">
                            <input type="text" name="city" class="form-control" placeholder="Optional">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><strong>State</strong></label>
                        <div class="col-sm-8">
                            <input type="text" name="state" class="form-control" placeholder="Optional">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="save_zip_button"> Submit </button>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    $('#manage_tbl').dataTable({
        "paging": false,
        "searching": false,
        "bInfo": false,
        "responsive": true,
        "columnDefs": [{
                "responsivePriority": 1,
                "targets": 0
            },
            {
                "responsivePriority": 2,
                "targets": -1
            },
        ]
    });
    $(document).on("click", "#save_zip_button", function() {
        var btn = $(this).ladda();
        btn.ladda('start');
        var formData = new FormData($("#add_zip_form")[0]);
        $.ajax({
            url: "{{ url('admin/locations/store') }}",
            type: 'POST',
            data: formData,
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            success: function(status) {
                if (status.msg == 'success') {
                    toastr.success(status.response, "Success");
                    btn.ladda('stop');
                    $("#add_zip_form")[0].reset();
                    $('#add_modalbox').modal('hide');
                    setTimeout(function() {
                        
                        window.location.href = "{{ url('admin/locations/details/') }}/" + status.zip;
                    }, 500);
                } else if (status.msg == 'error') {
                    btn.ladda('stop');
                    toastr.error(status.response, "Error");
                } else if (status.msg == 'lvl_error') {
                    btn.ladda('stop');
                    var message = "";
                    $.each(status.response, function(key, value) {
                        message += value + "<br>";
                    });
                    toastr.error(message, "Error");
                }
            }
        });
    });
    $(document).on("click", ".btn_location_delete", function() {
        var id = $(this).attr('data-id');
        swal({
                title: "Are you sure?",
                text: "You want to remove this location as well as all offers associated with it!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, please!",
                cancelButtonText: "No, cancel please!",
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function(isConfirm) {
                if (isConfirm) {
                    $(".confirm").prop("disabled", true);
                    $.ajax({
                        url: "{{ url('admin/locations/delete-location') }}",
                        type: 'post',
                        data: {
                            "_token": "{{ csrf_token() }}",
                            'id': id,
                        },
                        dataType: 'json',
                        success: function(status) {
                            $(".confirm").prop("disabled", false);
                            if (status.msg == 'success') {
                                swal({
                                        title: "Success!",
                                        text: status.response,
                                        type: "success"
                                    },
                                    function(data) {
                                        location.reload();
                                    });
                            } else if (status.msg == 'error') {
                                swal("Error", status.response, "error");
                            }
                        }
                    });
                } else {
                    swal("Cancelled", "", "error");
                }
            });
    });
</script>
@endpush