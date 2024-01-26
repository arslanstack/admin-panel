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
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8 col-sm-8 col-xs-8">
        <h2> Add Service Provider & Offers </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Dashboard</a>
            </li>
            <li class="breadcrumb-item">
                <a href="{{ url('admin/locations/') }}">Locations</a>
            </li>
            <li class="breadcrumb-item">
                <a href="{{ url('admin/locations/details/' . $ziploc->zip) }}">Location Details</a>
            </li>
            <li class="breadcrumb-item active">
                <strong> Add Service Provider & Offers </strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-4 col-sm-4 col-xs-4 text-right">
        <a class="btn btn-primary text-white t_m_25" href="{{ url('admin/locations/details/' . $ziploc->zip) }}">
            <i class="fa fa-arrow-left" aria-hidden="true"></i> Back to Location Details
        </a>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-content">
                    <form id="add_offer_form" method="post">
                        @csrf
                        <input type="text" name="zip" value="{{$ziploc->zip}}" hidden>
                        <div class="form-group row">
                            <div class="col-6">
                                <h4> <label for="form-label">Location Zip</label></h4>
                                <input type="text" class="form-control" disabled value="{{$ziploc->zip . ($ziploc->city ? ', ' . $ziploc->city : '') . ($ziploc->state ? ', ' . $ziploc->state : '')}}">
                            </div>
                            <div class="col-6">
                                <h4> <label for="form-label">Service Provider</label></h4>
                                <select name="provider_id" id="" required class="form-control">
                                    <option selected disabled></option>
                                    @php
                                    $providers = providers_not_in_location($ziploc->zip);
                                    @endphp
                                    @foreach($providers as $provider)
                                    <option value="{{$provider->id}}">{{$provider->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row" id="three-bundles">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">Internet</th>
                                            <th scope="col">TV</th>
                                            <th scope="col">Bundles</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">Specifications</th>
                                            <td><input type="text" class="form-control text-center" required name="internet_specs" placeholder="e.g. Bandwidth/Channels"></td>
                                            <td><input type="text" class="form-control text-center" required name="tv_specs" placeholder="e.g. Bandwidth/Channels"></td>
                                            <td><input type="text" class="form-control text-center" required name="bundle_specs" placeholder="e.g. Bandwidth/Channels"></td>
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
                        <div class="form-group row">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary float-right" id="save_offer_btn">Save Provider & Offers</button>
                            </div>
                        </div>
                    </form>
                </div>
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
            if ($('.tag-input-basic').val().trim() == '') {
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
            if ($('.tag-input-plus').val().trim() == '') {
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
            if ($('.tag-input-pro').val().trim() == '') {
                return;
            }
            pro_features.push($('.tag-input-pro').val().trim());
            updateProFeatureList();
            $('.tag-input-pro').val('');
        });
    });
    $(document).on("click", "#save_offer_btn", function() {
        // console.log("CLicked")
        var btn = $(this).ladda();
        btn.ladda('start');
        if ($("#add_offer_form")[0].checkValidity() && validateFeatures()) {
            var formData = new FormData($("#add_offer_form")[0]);
            formData.append('basic_features', JSON.stringify(basic_features));
            formData.append('plus_features', JSON.stringify(plus_features));
            formData.append('pro_features', JSON.stringify(pro_features));
            $.ajax({
                url: "{{ url('admin/offers/store') }}",
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
                            window.location.href = "{{url('admin/locations/details/' . $ziploc->zip)}}";
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
            $("#add_offer_form :input[required]").each(function() {
                if (!this.checkValidity()) {
                    $(this).addClass('invalid');
                } else {
                    $(this).removeClass('invalid');
                }
            });
            if (!$("#add_offer_form")[0].checkValidity()) {
                toastr.error("Please fill all the required fields.", "Error");
                return false;
            } else if (basic_features.length == 0 || plus_features.length == 0 || pro_features.length == 0) {
                toastr.error("Please add at least one feature to each offer.", "Error");
                return false;
            } else {
                toastr.error("Please fill all the required fields.", "Error");
                return false;
            }
        }
    });
    // Function to validate features before submission
    function validateFeatures() {
        if (basic_features.length == 0 || plus_features.length == 0 || pro_features.length == 0) {
            return false;
        }
        return true;
    }
</script>
@endpush