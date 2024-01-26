<?php

use App\Http\Controllers\Admin\AdminLoginController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\ZipController;
use App\Http\Controllers\Admin\ProviderController;
use App\Http\Controllers\Admin\ServicesController;
use App\Http\Controllers\Admin\OffersController;
use App\Http\Controllers\Admin\ImportsController;
use Illuminate\Support\Facades\Route;

Route::group(['prefix'  =>  'admin'], function () {
	Route::get('login', [AdminLoginController::class, 'index'])->name('login');
	Route::post('verify_login', [AdminLoginController::class, 'verify_login']);
	Route::get('logout', [AdminLoginController::class, 'logout']);

	Route::group(['middleware' => ['auth:admin']], function () {

		Route::get('/', [AdminController::class, 'index'])->name('admin.dashboard');
		Route::get('admin', [AdminController::class, 'index']);
		Route::get('change_password', [AdminController::class, 'change_password']);
		Route::post('update_password', [AdminController::class, 'update_password']);

		Route::group(['prefix'  =>  'users'], function () {
			Route::get('/', [UserController::class, 'index']);
			Route::post('update_statuses', [UserController::class, 'update_statuses']);
			Route::get('detail/{id}', [UserController::class, 'user_details']);
		});
		Route::group(['prefix'  =>  'locations'], function () {
			Route::get('/', [ZipController::class, 'index']);
			Route::get('/details/{zip}', [ZipController::class, 'details']);
			Route::get('/add-provider/{zip}', [ZipController::class, 'addProvider']);
			Route::get('/provider-offers/{zip}/{provider_id}', [ZipController::class, 'provider_offers']);
			Route::post('/store', [ZipController::class, 'store']);
			Route::post('/update', [ZipController::class, 'update']);
			Route::post('/update-offers', [ZipController::class, 'updateOffers']);
			Route::post('/remove-provider', [ZipController::class, 'removeProvider']);
			Route::post('/delete-location', [ZipController::class, 'destroy']);
		});

		Route::group(['prefix'  =>  'providers'], function () {
			Route::get('/', [ProviderController::class, 'index']);
			Route::get('/add', [ProviderController::class, 'add']);
			Route::get('/add-services/{provider_id}', [ServicesController::class, 'add']);
			Route::get('/service-details/{service_id}', [ServicesController::class, 'show']);
			Route::post('/store', [ProviderController::class, 'store']);
			Route::post('/update', [ProviderController::class, 'update']);
			Route::get('/details/{id}', [ProviderController::class, 'details'])->name('provider.details');
			Route::post('/delete', [ProviderController::class, 'destroy']);
		});
		Route::group(['prefix'  =>  'services'], function () {
			Route::post('/store', [ServicesController::class, 'store']);
			Route::post('/update', [ServicesController::class, 'update']);
			Route::post('/delete', [ServicesController::class, 'delete']);
		});
		Route::group(['prefix'  =>  'offers'], function () {
			Route::post('/store', [OffersController::class, 'store']);
		});

		Route::group(['prefix'  =>  'imports'], function () {
			Route::get('/', [ImportsController::class, 'index']);
			Route::post('/upload_csv', [ImportsController::class, 'import']);
			Route::get('/download-sample', [ImportsController::class, 'sampleDownload']);
			Route::get('/download_file/{filename}', [ImportsController::class, 'DownloadOldImport']);
			Route::post('/revert', [ImportsController::class, 'revertImport']);
		});
	});
});
