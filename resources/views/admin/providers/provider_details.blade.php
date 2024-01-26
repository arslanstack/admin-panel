@extends('admin.admin_app')
@push('styles')
<style>
    td {
        background-color: #FFFFFF !important;
    }

    .invalid {
        border: 1px solid red !important;
    }
</style>
@endpush
@section('content')
@php
url()->previous() == url('admin/providers/add') ? $activeTab = '#tab-2' : $activeTab = '#tab-1';
@endphp
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8 col-sm-8 col-xs-8">
        <h2> Provider Details </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Dashboard</a>
            </li>
            <li class="breadcrumb-item">
                <a href="{{ url('admin/providers/') }}">Service Providers</a>
            </li>
            <li class="breadcrumb-item active">
                <strong> Provider Details </strong>
            </li>
        </ol>
    </div>

    <div class="col-lg-4 col-sm-4 col-xs-4 text-right">
        <a class="btn btn-primary text-white t_m_25" href="{{url('admin/providers')}}">
            <i class="fa fa-arrow-left" aria-hidden="true"></i> Back to Service Providers
        </a>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="tabs-container">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="provider_details"><a class="nav-link active show" data-toggle="tab" href="#tab-1">Provider Details</a></li>
                    <li class="services_details"><a class="nav-link" data-toggle="tab" href="#tab-2">Services & Packages</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active show" role="tabpanel">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox">
                                    <div class="ibox-content">

                                        <form action="{{url('admin/providers/update')}}" id="update_provider_form" class="m-4" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <input type="text" name="id" value="{{$provider->id}}" hidden>
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="form-label"><strong>Name</strong></label>
                                                            <input type="text" name="name" id="name" class="form-control" required value="{{$provider->name}}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="form-label"><strong>Phone</strong></label>
                                                            <input type="tel" name="phone" id="phone" class="form-control" value="{{$provider->phone}}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="form-label"><strong>Email</strong></label>
                                                            <input type="email" name="email" id="email" class="form-control" value="{{$provider->email}}">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="form-label"><strong>Logo Image</strong></label>
                                                            <input type="file" name="image" id="logo" class="form-control" accept="image/*">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 d-flex align-items-center justify-content-end">
                                                    <div class="row">
                                                        <img src="{{asset('uploads/providers/' . $provider->image)}}" style="width: 300px; height:auto; object-fit:contain;" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label class="form-label"><strong>Short Description</strong></label>
                                                    <textarea name="short_description" class="form-control" id="short_description" rows="4">{{$provider->short_description}}</textarea>
                                                </div>
                                                <div class="form-group justify-content-end col-md-12">
                                                    <button type="submit" id="update_provider_btn" class="btn btn-primary float-right float-end">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane" role="tabpanel">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox">
                                    <div class="ibox-content">
                                        <span style="display: flex; justify-content: space-between; align-items: center;">
                                            <h4>Services & Packages <small><strong> ({{$provider->name}})</strong></small></h4>
                                            <a class="btn btn-primary text-white" href="{{url('admin/providers/add-services/' . $provider->id)}}" ><i class="fa fa-plus" aria-hidden="true"></i> Add New Service</a>
                                        </span>
                                        <div class="table-responsive">
                                            <table id="manage_tbl" class="table table-striped table-bordered dt-responsive" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th>Sr #</th>
                                                        <th>Title</th>
                                                        <th>Creation Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @php($i = 1)
                                                    @foreach($services as $item)
                                                    <tr class="gradeX">
                                                        <td>{{ $i++ }}</td>
                                                        <td>{{$item->title}}</td>
                                                        <td>{{ date_formated($item->created_at)}}</td>
                                                        <td>
                                                            <a class="btn btn-primary btn-sm" href="{{url('admin/providers/service-details/' . $item->id)}}" id="btn_service_edit" data-placement="top" title="Details">Details</a>
                                                            <button class="btn btn-danger btn-sm btn_service_delete" data-id="{{$item->id}}" data-text="This action will delete this Service Provider." type="button" data-placement="top" title="Delete">Delete</button>
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
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    
    $('a[href="{{$activeTab}}"]').tab('show');
    if (window.location.href.indexOf("tab=services") > -1) {
        $('a[href="#tab-2"]').tab('show');
    }
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
    $(document).on("click", ".services_details", function() {
        window.history.pushState("", "", '?tab=services');
    });
    $(document).on("click", ".provider_details", function() {
        window.history.pushState("", "", window.location.href.split('?')[0]);
    });
    $(document).on("click", "#update_provider_btn", function() {
        var btn = $(this).ladda();
        btn.ladda('start');
        var formData = new FormData($("#update_provider_form")[0]);
        $.ajax({
            url: "{{ url('admin/providers/update') }}",
            type: 'POST',
            data: formData,
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            success: function(status) {
                if (status.msg == 'success') {
                    toastr.success(status.response, "Success");
                    setTimeout(function() {
                        location.reload();
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
    $(document).on("click", ".btn_service_delete", function() {
        var id = $(this).attr('data-id');
        swal({
                title: "Are you sure?",
                text: "You want to delete this service!",
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
                        url: "{{ url('admin/services/delete') }}",
                        type: 'post',
                        data: {
                            "_token": "{{ csrf_token() }}",
                            'service_id': id,
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
                                        window.location.href = "{{url('admin/providers/details/' . $provider->id)}}?tab=services";
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