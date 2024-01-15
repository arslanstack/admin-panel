@extends('admin.admin_app')
@push('styles')
@endpush
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-8 col-sm-8 col-xs-8">
        <h2> Add New Provider </h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">
                <strong> Add New Provider </strong>
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
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active show" role="tabpanel">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox">
                                    <div class="ibox-content">
                                        <form action="{{url('admin/providers/store')}}" id="add_provider_form" class="m-4" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label class="form-label"><strong>Name</strong></label>
                                                    <input type="text" name="name" id="name" required class="form-control" placeholder="Starlink e.t.c.">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label class="form-label"><strong>Logo Image</strong></label>
                                                    <input type="file" name="image" id="logo" class="form-control" accept="image/*">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label class="form-label"><strong>Phone</strong></label>
                                                    <input type="tel" name="phone" id="phone" class="form-control" placeholder="+12349182826">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label class="form-label"><strong>Email</strong></label>
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="hello@starlink.com">
                                                </div>
                                                <div class="form-group col-md-12">
                                                    <label class="form-label"><strong>Short Description</strong></label>
                                                    <textarea name="short_description" class="form-control" id="short_description"></textarea>
                                                </div>
                                                <div class="form-group justify-content-end col-md-12">
                                                    <button type="submit" class="btn btn-primary float-right float-end">Save & Next</button>
                                                </div>
                                            </div>
                                        </form>
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

@endpush