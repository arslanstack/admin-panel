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
<div class="modal inmodal show fade" id="edit_modalbox" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content" id="edit_modalbox_body">
        </div>
    </div>
</div>
<div class="modal inmodal show fade" id="add_modalbox" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title">Add Service & Packages</h5>
            </div>
            <div class="modal-body">
                <form id="add_service_form" method="post">
                    @csrf
                    <input type="text" hidden name="provider_id" value="{{$provider->id}}">
                    <div class="form-group row">
                        <div class="col-6">
                            <h4> <label for="form-label">Service Provider</label></h4>
                            <input type="text" class="form-control" disabled value="{{$provider->name}}">
                        </div>
                        <div class="col-6">
                            <h4> <label for="form-label">Service Title</label></h4>
                            <input type="text" name="title" class="form-control" required placeholder="Internet, TV, Bundle etc.">
                        </div>
                    </div>
                    <div class="form-group row" id="three-bundles">
                        <div class="table-responsive">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Basic</th>
                                        <th scope="col">Plus</th>
                                        <th scope="col">Pro</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Package Title</th>
                                        <td><input type="text" class="form-control text-center" required name="basic_title" placeholder="Starter etc."></td>
                                        <td><input type="text" class="form-control text-center" required name="plus_title" placeholder="Plus etc."></td>
                                        <td><input type="text" class="form-control text-center" required name="pro_title" placeholder="Fusion etc."></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Specifications</th>
                                        <td><input type="text" class="form-control text-center" required name="basic_specs" placeholder="Bandwidth/Channels"></td>
                                        <td><input type="text" class="form-control text-center" required name="plus_specs" placeholder="Bandwidth/Channels"></td>
                                        <td><input type="text" class="form-control text-center" required name="pro_specs" placeholder="Bandwidth/Channels"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Price per Month (USD)</th>
                                        <td><input type="text" class="form-control text-center" required name="basic_price" placeholder="149"></td>
                                        <td><input type="text" class="form-control text-center" required name="plus_price" placeholder="249"></td>
                                        <td><input type="text" class="form-control text-center" required name="pro_price" placeholder="359"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Minimum Pkg Duration</th>
                                        <td><input type="text" class="form-control text-center" required name="basic_duration" placeholder="1 year"></td>
                                        <td><input type="text" class="form-control text-center" required name="plus_duration" placeholder="6 months"></td>
                                        <td><input type="text" class="form-control text-center" required name="pro_duration" placeholder="1 year"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Features</th>
                                        <td>
                                            <div class="features-container">
                                                <ul class="basic-feature-list text-start text-left"></ul>
                                                <div class="input-group mb-3">
                                                    <input type="text" class="form-control text-center tag-input-basic" name="basic_features[]" placeholder="Press Enter to add a feature.">
                                                    <span class="input-group-text"><button class="add-basic-feature-btn" style="border: none; cursor: pointer;" type="button"><i class="fa fa-arrow-right"></i></button></span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="features-container">
                                                <ul class="plus-feature-list text-start text-left"></ul>
                                                <div class="input-group mb-3">
                                                    <input type="text" class="form-control text-center tag-input-plus" name="plus_features[]" placeholder="Press Enter to add a feature.">
                                                    <span class="input-group-text"><button class="add-plus-feature-btn" style="border: none; cursor: pointer;" type="button"><i class="fa fa-arrow-right"></i></button></span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="features-container">
                                                <ul class="pro-feature-list text-start text-left"></ul>
                                                <div class="input-group mb-3">
                                                    <input type="text" class="form-control text-center tag-input-pro" name="pro_features[]" placeholder="Press Enter to add a feature.">
                                                    <span class="input-group-text"><button class="add-pro-feature-btn" style="border: none; cursor: pointer;" type="button"><i class="fa fa-arrow-right"></i></button></span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="save_service_btn"> Submit </button>
            </div>
        </div>
    </div>
</div>

@endsection
@push('scripts')
<script>
    var basic_features = [];
    var plus_features = [];
    var pro_features = [];
    $(document).ready(function() {
        $('.tag-input-basic').on('keyup', function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                // check if the input is empty
                if ($(this).val().trim() == '') {
                    return;
                }
                basic_features.push($(this).val().trim());
                updateBasicFeatureList();
                $(this).val('');
                console.log(basic_features);
            }
        });

        function updateBasicFeatureList() {
            $('.basic-feature-list').empty();
            $.each(basic_features, function(key, value) {
                $('.basic-feature-list').append('<li>' + value + ' <button type="button" class="btn btn-xs remove-basic-feature-btn"><i class="fa fa-trash text-danger"></i></button></li>');
            });
        }

        function removeBasicFeature(index) {
            basic_features.splice(index, 1);
            updateBasicFeatureList();
        }
        $(document).on('click', '.remove-basic-feature-btn', function() {
            removeBasicFeature($(this).closest('li').index());
        });
        $('.add-basic-feature-btn').on('click', function() {
            // check if the input is empty
            if ($(this).val().trim() == '') {
                return;
            }
            basic_features.push($('.tag-input-basic').val().trim());
            updateBasicFeatureList();
            $('.tag-input-basic').val('');
        });
        $('.tag-input-plus').on('keyup', function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                // check if the input is empty
                if ($(this).val().trim() == '') {
                    return;
                }
                plus_features.push($(this).val().trim());
                updatePlusFeatureList();
                $(this).val('');
                console.log(plus_features);
            }
        });

        function updatePlusFeatureList() {
            $('.plus-feature-list').empty();
            $.each(plus_features, function(key, value) {
                $('.plus-feature-list').append('<li>' + value + ' <button type="button" class="btn btn-xs remove-plus-feature-btn"><i class="fa fa-trash text-danger"></i></button></li>');
            });
        }

        function removePlusFeature(index) {
            plus_features.splice(index, 1);
            updatePlusFeatureList();
        }
        $(document).on('click', '.remove-plus-feature-btn', function() {
            removePlusFeature($(this).closest('li').index());
        });
        $('.add-plus-feature-btn').on('click', function() {
            // check if the input is empty
            if ($(this).val().trim() == '') {
                return;
            }
            plus_features.push($('.tag-input-plus').val().trim());
            updatePlusFeatureList();
            $('.tag-input-plus').val('');
        });
        $('.tag-input-pro').on('keyup', function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                // check if the input is empty
                if ($(this).val().trim() == '') {
                    return;
                }
                pro_features.push($(this).val().trim());
                updateProFeatureList();
                $(this).val('');
                console.log(pro_features);
            }
        });

        function updateProFeatureList() {
            $('.pro-feature-list').empty();
            $.each(pro_features, function(key, value) {
                $('.pro-feature-list').append('<li>' + value + ' <button type="button" class="btn btn-xs remove-pro-feature-btn"><i class="fa fa-trash text-danger"></i></button></li>');
            });
        }

        function removeProFeature(index) {
            pro_features.splice(index, 1);
            updateProFeatureList();
        }
        $(document).on('click', '.remove-pro-feature-btn', function() {
            removeProFeature($(this).closest('li').index());
        });
        $('.add-pro-feature-btn').on('click', function() {
            // check if the input is empty
            if ($(this).val().trim() == '') {
                return;
            }
            pro_features.push($('.tag-input-pro').val().trim());
            updateProFeatureList();
            $('.tag-input-pro').val('');
        });
    });


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
    $(document).on("click", "#save_service_btn", function() {
        // console.log("CLicked")
        var btn = $(this).ladda();
        btn.ladda('start');
        if ($("#add_service_form")[0].checkValidity() && validateFeatures()) {
            var formData = new FormData($("#add_service_form")[0]);
            // add features to formData
            formData.append('basic_features', JSON.stringify(basic_features));
            formData.append('plus_features', JSON.stringify(plus_features));
            formData.append('pro_features', JSON.stringify(pro_features));
            $.ajax({
                url: "{{ url('admin/services/store') }}",
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
                            window.location.href = "{{url('admin/providers/details/' . $provider->id)}}?tab=services";
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
        } else {
            btn.ladda('stop');
            $("#add_service_form :input[required]").each(function() {
                if (!this.checkValidity()) {
                    $(this).addClass('invalid');
                } else {
                    $(this).removeClass('invalid');
                }
            });
        }
    });

    $(document).on("click", "#update_service_button", function() {
        var btn = $(this).ladda();
        btn.ladda('start');
        if ($("#update_service_form")[0].checkValidity() && validateUpdateFeatures()) {
            var formData = new FormData($("#update_service_form")[0]);
            // add update_features to formData
            formData.append('basic_update_features', JSON.stringify(basic_update_features));
            formData.append('plus_update_features', JSON.stringify(plus_update_features));
            formData.append('pro_update_features', JSON.stringify(pro_update_features));
            $.ajax({
                url: "{{ url('admin/services/update') }}",
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
                            window.location.href = "{{url('admin/providers/details/' . $provider->id)}}?tab=services";
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
        } else {
            btn.ladda('stop');
            $("#update_service_form :input[required]").each(function() {
                if (!this.checkValidity()) {
                    $(this).addClass('invalid');
                } else {
                    $(this).removeClass('invalid');
                }
            });
            if (basic_update_features.length == 0 || plus_update_features.length == 0 || pro_update_features.length == 0) {
                toastr.error("Please add at least one feature to each package.", "Error");
                return false;
            }
            if(!$("#update_service_form")[0].checkValidity()){
                toastr.error("Please fill all the required fields.", "Error");
                return false;
            }
        }

    });
    $(document).on("click", "#btn_service_edit", function() {
        var id = $(this).attr('data-id');
        $.ajax({
            url: "{{ url('admin/services/show') }}",
            type: 'POST',
            dataType: 'json',
            data: {
                "_token": "{{ csrf_token() }}",
                'service_id': id
            },
            success: function(status) {
                $("#edit_modalbox_body").html(status.response);
                $("#edit_modalbox").modal('show');
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

    // Function to validate features before submission
    function validateFeatures() {
        if (basic_features.length == 0 || plus_features.length == 0 || pro_features.length == 0) {
            toastr.error("Please add at least one feature to each package.", "Error");
            return false;
        }
        return true;
    }

    function validateUpdateFeatures() {
        if (basic_update_features.length == 0 || plus_update_features.length == 0 || pro_update_features.length == 0) {
            return false;
        }
        return true;
    }
</script>

@endpush