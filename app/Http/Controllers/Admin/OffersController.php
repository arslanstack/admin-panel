<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Provider;
use App\Models\Offer;
use App\Models\ZipLocation;
use Illuminate\Support\Facades\Validator;

class OffersController extends Controller
{
    public function store(Request $request){
        $validate = Validator::make($request->all(), [
            'zip' => 'required',
            'provider_id' => 'required',
            'internet_specs' => 'required',
            'tv_specs' => 'required',
            'bundle_specs' => 'required',
        ]);
        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }

        $internet_offer = new Offer();
        $internet_offer->zip = $request->zip;
        $internet_offer->offer_type = 0;
        $internet_offer->provider_id = $request->provider_id;
        $internet_offer->offer_specs = $request->internet_specs;
        $internet_offer->offer_points = $request->basic_features;
        $internet_offer->save();

        $tv_offer = new Offer();
        $tv_offer->zip = $request->zip;
        $tv_offer->offer_type = 1;
        $tv_offer->provider_id = $request->provider_id;
        $tv_offer->offer_specs = $request->tv_specs;
        $tv_offer->offer_points = $request->plus_features;
        $tv_offer->save();

        $bundle_offer = new Offer();
        $bundle_offer->zip = $request->zip;
        $bundle_offer->offer_type = 2;
        $bundle_offer->provider_id = $request->provider_id;
        $bundle_offer->offer_specs = $request->bundle_specs;
        $bundle_offer->offer_points = $request->pro_features;
        $bundle_offer->save();

        return response()->json(['msg' => 'success', 'response' => 'Provider & Offers added successfully']);
    }
}
