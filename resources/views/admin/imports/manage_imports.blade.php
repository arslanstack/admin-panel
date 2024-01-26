@extends('admin.admin_app')
@push('styles')
@endpush
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8 col-sm-8 col-xs-8">
        <h2>Upload Bulk Data</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">
                <strong>Upload Bulk Data</strong>
            </li>
        </ol>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <strong><span class="text-danger">The max limit of record count is 100 rows due to server constraints.</span></strong><br>
                            <strong><span class="text-danger">Importing more than 100 rows would result in failure.</span></strong>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <form id="upload_csv_form" action="{{url('admin/imports/upload_csv')}}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="input-group pull-right">
                                    <input type="file" name="csv_file" id="csv_file" class="form-control" accept=".xlsx">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" id="upload_csv_file">Import File</button>
                                        <a href="{{ url('admin/imports/download-sample') }}" class="btn btn-success text-nowrap" style="display: flex !important; align-items: center;">Download Sample File</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <hr>
                    <div class="table-responsive">
                        <table id="manage_tbl" class="table table-striped table-bordered dt-responsive" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Sr #</th>
                                    <th>File Name</th>
                                    <th>Upload Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php($i = 1)
                                @foreach($imports as $item)
                                <tr class="gradeX">
                                    <td>{{ $i++ }}</td>
                                    <td>{{$item->file_name}}</td>
                                    <td>{{ time_elapsed_string($item->created_at) }}</td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" href="{{url('admin/imports/download_file')}}/{{$item->file_name}}">Download File</a>
                                        <button class="btn btn-danger btn-sm btn_delete" data-id="{{$item->id}}" type="button" data-placement="top" title="Delete"> Revert & Delete </button>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    $('#manage_tbl').dataTable({
        "paging": true,
        "searching": true,
        "bInfo": true,
        "responsive": true,
        "lengthMenu": [
            [50, 100, 150, -1],
            [50, 100, 150, "All"]
        ],
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

    $(document).on("click", ".btn_delete", function() {
        var id = $(this).attr('data-id');
        swal({
                title: "Are you sure?",
                text: "You want to revert this import and delete all relevant records!",
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
                        url: "{{ url('admin/imports/revert') }}",
                        type: 'post',
                        data: {
                            "_token": "{{ csrf_token() }}",
                            'id': id
                        },
                        dataType: 'json',
                        success: function(status) {
                            console.log(status);
                            $(".confirm").prop("disabled", false);
                            if (status.msg == 'success') {
                                swal({
                                        title: "Success!",
                                        text: status.message,
                                        type: "success"
                                    },
                                    function(data) {
                                        location.reload();
                                    });
                            } else if (status.msg == 'error') {
                                swal("Error", status.message, "error");
                            }
                        }
                    });
                } else {
                    swal("Cancelled", "", "error");
                }
            });
    });

    $(document).on("click", "#upload_csv_file", function() {
        var btn = $(this).ladda();
        btn.ladda('start');
        var csv_file = $('#csv_file').val();
        if (csv_file == "") {
            toastr.error("File is required");
            btn.ladda('stop');
            return false;
        }
        var formData = new FormData($("#upload_csv_form")[0]);
        $.ajax({
            url: "{{url('admin/imports/upload_csv')}}",
            type: 'POST',
            data: formData,
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            success: function(status) {
                console.log(status);
                if (status.msg == 'success') {
                    toastr.success(status.message, "success");
                    setTimeout(function() {
                        document.location.reload(true);
                    }, 1000);
                } else if (status.msg == 'error') {
                    btn.ladda('stop');
                    toastr.error(status.message, "error");
                }
            }
        });
    });
</script>
@endpush