<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ZipLocation;
use Illuminate\Http\Request;
use App\Models\Provider;
use App\Models\Offer;
use Illuminate\Support\Facades\Validator;

class ZipController extends Controller
{
    public function index(Request $request)
    {
        $query = ZipLocation::query();
        $search_query = $request->input('search_query');
        if ($request->has('search_query') && !empty($search_query)) {
            $query->where(function ($query) use ($search_query) {
                $query->where('zip', 'like', '%' . $search_query . '%')
                    ->orWhere('state', 'like', '%' . $search_query . '%')
                    ->orWhere('city', 'like', '%' . $search_query . '%');
            });
        }
        $data['zips'] = $query->orderBy('id', 'DESC')->paginate(50);
        $data['searchParams'] = $request->all();
        return view('admin/zips/manage_zips', $data);
    }
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'zip' => 'required|unique:zip_locations',
        ]);
        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }
        $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . $request->zip . "&key=" . env('GOOGLE_API_KEY');
        $response = file_get_contents($url);
        $response = json_decode($response);
        if ($response->status == 'OK') {
            $data = $response->results[0];
            $zip = new ZipLocation();
            $zip->zip = $request->zip;
            foreach ($data->address_components as $component) {
                foreach ($component->types as $type) {
                    if ($type == "administrative_area_level_1") {
                        $zip->state = $component->long_name;
                    } elseif ($type == "locality") {
                        $zip->city = $component->long_name;
                    }
                }
            }
            $zip->save();

            return response()->json(['msg' => 'success', 'response' => 'Zip added successfully.']);
        } else {
            return response()->json(['msg' => 'error', 'response' => 'Something Went Wrong.']);
        }
    }
    
    public function details($zip)
    {
        $data['ziploc'] = ZipLocation::where('zip', $zip)->first();
        // get unique (on the basis of offers table where zip = zip) records of providers from Provider table
        $data['providers'] = Provider::whereHas('offers', function ($query) use ($zip) {
            $query->where('zip', $zip);
        })->get()->unique();
        // dd($data['providers']);
        return view('admin/zips/zip_details', $data);
    }
    public function removeProvider(Request $request){
        $offers = Offer::where('zip', $request->zip)->where('provider_id', $request->provider_id)->get();
        foreach ($offers as $offer) {
            $offer->delete();
        }
        return response()->json(['msg' => 'success', 'response' => 'Provider removed successfully.']);
    }
    public function destroy(Request $request)
    {
        $zip = ZipLocation::find($request->id);
        if ($zip) {
            $zip->delete();
            return response()->json(['msg' => 'success', 'response' => 'Zip deleted successfully alongwith all associated offers.']);
        } else {
            return response()->json(['msg' => 'error', 'response' => 'Zip not found.']);
        }
    }

    // public function update(Request $request){
    //     $validate = Validator::make($request->all(), [
    //         'zip' => 'required|unique:zip_locations,zip,'.$request->id,
    //     ]);
    //     if ($validate->fails()) {
    //         return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
    //     }
    //     $zip = ZipLocation::find($request->id);
    //     if ($zip) {
    //         $zip->zip = $request->zip;
    //         $zip->save();
    //         return response()->json(['msg' => 'success', 'response' => 'Zip updated successfully.']);
    //     } else {
    //         return response()->json(['msg' => 'error', 'response' => 'Zip not found.']);
    //     }
    // }
}
