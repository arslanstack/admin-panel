@extends('admin.admin_app')
@section('content')
<div class="wrapper wrapper-content animated fadeIn">
	<div class="row">
		<div class="col-lg-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<span class="label label-success pull-right">Total</span>
					<h5>Locations</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">{{count_total_records('zip_locations')}}</h1>
					<div class="stat-percent font-bold text-primary"><a href="{{ url('admin/locations') }}"><span class="label label-primary">View</span></a></div>
					<small>Locations</small>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<span class="label label-success pull-right">Total</span>
					<h5>Service Providers</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">{{count_total_records('providers')}}</h1>
					<div class="stat-percent font-bold text-primary"><a href="{{ url('admin/providers') }}"><span class="label label-primary">View</span></a></div>
					<small>Service Providers</small>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<span class="label label-success pull-right">Total</span>
					<h5>Clientele</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">{{count_total_records('users')}}</h1>
					<div class="stat-percent font-bold text-primary"><a href="{{ url('admin/users') }}"><span class="label label-primary">View</span></a></div>
					<small>Clients</small>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection