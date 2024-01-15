<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Provider;
use App\Models\ProviderService;
use App\Models\ProviderPackage;
use Illuminate\Support\Facades\Validator;

class ServicesController extends Controller
{
    public function add($provider_id){
        $provider = Provider::find($provider_id);
        if(!$provider){
            return redirect('admin/providers')->with('error', 'Provider not found.');
        }
        return view('admin/providers/add_service', compact('provider'));
    }
    public function store(Request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'provider_id' => 'required',
            'title' => 'required',
            'basic_title' => 'required',
            'plus_title' => 'required',
            'pro_title' => 'required',
            'basic_specs' => 'required',
            'plus_specs' => 'required',
            'pro_specs' => 'required',
            'basic_price' => 'required',
            'plus_price' => 'required',
            'pro_price' => 'required',
            'basic_duration' => 'required',
            'plus_duration' => 'required',
            'pro_duration' => 'required',
            'basic_features' => 'required',
            'plus_features' => 'required',
            'pro_features' => 'required',
        ]);

        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }

        $provider = Provider::find($request->provider_id);
        if (!$provider) {
            return response()->json(['msg' => 'error', 'response' => 'Provider not found.']);
        }
        $provider_service = new ProviderService();
        $provider_service->provider_id = $request->provider_id;
        $provider_service->title = $request->title;
        $provider_service->save();
        // create a ProviderPackage for all basic fields
        $provider_package = new ProviderPackage();
        $provider_package->provider_id = $request->provider_id;
        $provider_package->service_id = $provider_service->id;
        $provider_package->pkg_type = 0;
        $provider_package->title = $request->basic_title;
        $provider_package->specs = $request->basic_specs;
        $provider_package->price = $request->basic_price;
        $provider_package->duration = $request->basic_duration;
        // $provider_package->features = $request->basic_features;
        $provider_package->features = $request->basic_features;
        $provider_package->save();
        // create a ProviderPackage for all plus fields
        $provider_package = new ProviderPackage();
        $provider_package->provider_id = $request->provider_id;
        $provider_package->service_id = $provider_service->id;
        $provider_package->pkg_type = 1;
        $provider_package->title = $request->plus_title;
        $provider_package->specs = $request->plus_specs;
        $provider_package->price = $request->plus_price;
        $provider_package->duration = $request->plus_duration;
        $provider_package->features = $request->plus_features;

        $provider_package->save();
        // create a ProviderPackage for all pro fields
        $provider_package = new ProviderPackage();
        $provider_package->provider_id = $request->provider_id;
        $provider_package->service_id = $provider_service->id;
        $provider_package->pkg_type = 2;
        $provider_package->title = $request->pro_title;
        $provider_package->specs = $request->pro_specs;
        $provider_package->price = $request->pro_price;
        $provider_package->duration = $request->pro_duration;
        // $provider_package->features = $request->pro_features;
        $provider_package->features = $request->pro_features;

        $provider_package->save();

        return response()->json(['msg' => 'success', 'response' => 'Service added successfully.']);
    }
    public function update(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'provider_id' => 'required',
            'service_id' => 'required',
            'title' => 'required',
            'basic_title' => 'required',
            'plus_title' => 'required',
            'pro_title' => 'required',
            'basic_specs' => 'required',
            'plus_specs' => 'required',
            'pro_specs' => 'required',
            'basic_price' => 'required',
            'plus_price' => 'required',
            'pro_price' => 'required',
            'basic_duration' => 'required',
            'plus_duration' => 'required',
            'pro_duration' => 'required',
            'basic_features' => 'required',
            'plus_features' => 'required',
            'pro_features' => 'required',
        ]);

        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }
        $service = ProviderService::find($request->service_id);
        if (!$service) {
            return response()->json(['msg' => 'error', 'response' => 'Service not found.']);
        }
        $service->title = $request->title;
        $service->save();

        $basic = ProviderPackage::where('service_id', $request->service_id)->where('pkg_type', 0)->first();
        $basic->title = $request->basic_title;
        $basic->specs = $request->basic_specs;
        $basic->price = $request->basic_price;
        $basic->duration = $request->basic_duration;
        $basic->features = $request->basic_features;
        $basic->save();

        $plus = ProviderPackage::where('service_id', $request->service_id)->where('pkg_type', 1)->first();
        $plus->title = $request->plus_title;
        $plus->specs = $request->plus_specs;
        $plus->price = $request->plus_price;
        $plus->duration = $request->plus_duration;
        $plus->features = $request->plus_features;
        $plus->save();

        $pro = ProviderPackage::where('service_id', $request->service_id)->where('pkg_type', 2)->first();
        $pro->title = $request->pro_title;
        $pro->specs = $request->pro_specs;
        $pro->price = $request->pro_price;
        $pro->duration = $request->pro_duration;
        $pro->features = $request->pro_features;
        $pro->save();
        
        return response()->json(['msg' => 'success', 'response' => 'Service updated successfully.']);
    }
    public function show($service_id)
    {
        // dd($request->all());
        $service = ProviderService::find($service_id);
        if (!$service) {
            return response()->json(['msg' => 'error', 'response' => 'Service not found.']);
        }
        $basic = ProviderPackage::where('service_id', $service_id)->where('pkg_type', 0)->first();
        $plus = ProviderPackage::where('service_id', $service_id)->where('pkg_type', 1)->first();
        $pro = ProviderPackage::where('service_id', $service_id)->where('pkg_type', 2)->first();
        $provider = Provider::find($service->provider_id);

        return view('admin/providers/service_details', compact('service', 'basic', 'plus', 'pro', 'provider'));
        
    }
    public function delete(Request $request)
    {
        $service = ProviderService::find($request->service_id);
        if (!$service) {
            return response()->json(['msg' => 'error', 'response' => 'Service not found.']);
        }
        $query = $service->delete();
        if ($query) {
            return response()->json(['msg' => 'success', 'response' => 'Service deleted successfully.']);
        } else {
            return response()->json(['msg' => 'error', 'response' => 'Something went wrong.']);
        }
    }
}
