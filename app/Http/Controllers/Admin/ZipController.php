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
        if ($request->city && $request->state) {
            $zip = new ZipLocation();
            $zip->zip = $request->zip;
            $zip->city = $request->city;
            $zip->state = $request->state;
            $zip->save();
            return response()->json(['msg' => 'success', 'response' => 'Zip added successfully.', 'zip' => $zip->zip]);
        }
        $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . $request->zip . "&key=" . env('GOOGLE_API_KEY');
        $response = $this->curl_get_file_contents($url);
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

            return response()->json(['msg' => 'success', 'response' => 'Zip added successfully.', 'zip' => $zip->zip]);
        } else {
            return response()->json(['msg' => 'error', 'response' => 'Something Went Wrong.']);
        }
    }
    function curl_get_file_contents($URL)
    {
        $c = curl_init();
        curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c, CURLOPT_URL, $URL);
        $contents = curl_exec($c);
        curl_close($c);

        if ($contents) return $contents;
        else return FALSE;
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
    public function addProvider($zip)
    {
        $data['ziploc'] = ZipLocation::where('zip', $zip)->first();
        return view('admin/zips/add_provider', $data);
    }
    public function provider_offers($zip, $provider_id)
    {
        $data['ziploc'] = ZipLocation::where('zip', $zip)->first();
        if ($data['ziploc']) {
            $data['provider'] = Provider::find($provider_id);
            if ($data['provider']) {
                $data['internet_offer'] = Offer::where('zip', $zip)->where('provider_id', $provider_id)->where('offer_type', 0)->first();
                $data['tv_offer'] = Offer::where('zip', $zip)->where('provider_id', $provider_id)->where('offer_type', 1)->first();
                $data['bundle_offer'] = Offer::where('zip', $zip)->where('provider_id', $provider_id)->where('offer_type', 2)->first();
                return view('admin/zips/provider_offers', $data);
            } else {
                return redirect()->back()->with('error', 'Provider not found.');
            }
        } else {
            return redirect()->back()->with('error', 'Zip not found.');
        }
        return redirect()->back()->with('error', 'Something Went Wrong.');
    }
    public function updateOffers(Request $request)
    {
        // dd($request->all());
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

        $internet_offer = Offer::where('zip', $request->zip)->where('provider_id', $request->provider_id)->where('offer_type', 0)->first();
        $internet_offer->offer_specs = $request->internet_specs;
        $internet_offer->offer_points = $request->basic_features;
        $internet_offer->save();

        $tv_offer = Offer::where('zip', $request->zip)->where('provider_id', $request->provider_id)->where('offer_type', 1)->first();
        $tv_offer->offer_specs = $request->tv_specs;
        $tv_offer->offer_points = $request->plus_features;
        $tv_offer->save();

        $bundle_offer = Offer::where('zip', $request->zip)->where('provider_id', $request->provider_id)->where('offer_type', 2)->first();
        $bundle_offer->offer_specs = $request->bundle_specs;
        $bundle_offer->offer_points = $request->pro_features;
        $bundle_offer->save();


        return response()->json(['msg' => 'success', 'response' => 'Offers updated successfully']);
    }
    public function removeProvider(Request $request)
    {
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
    public function update(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'id' => 'required',
        ]);
        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }
        $zip = ZipLocation::find($request->id);
        $zip->city = $request->city ? $request->city : $zip->city;
        $zip->state = $request->state ? $request->state : $zip->state;
        $zip->save();
        return response()->json(['msg' => 'success', 'response' => 'Location Details updated successfully.']);
        // $current_record = ZipLocation::find($request->id);
        // $loc = ZipLocation::where('zip', $request->zip)->first();
        // if ($loc) {
        //     if ($loc->id != $request->id) {
        //         return response()->json(['msg' => 'error', 'response' => 'Zip already exists.']);
        //     }
        // }
        // return response()->json(['msg' => 'success', 'response' => 'Zip updated successfully.']);
        // as $current_record->zip is a foreign key so we can't update it directly so we have to change the zip in all tables to $request->zip and then update the zip in zip_locations table
        // $zip = ZipLocation::find($request->id);
        // if($zip){
        //     $zip->zip = $request->zip;
        //     $zip->city = $request->city;
        //     $zip->state = $request->state;
        //     $zip->save();
        //     return response()->json(['msg' => 'success', 'response' => 'Zip updated successfully.']);
        // }else{
        //     return response()->json(['msg' => 'error', 'response' => 'Zip not found.']);
        // }
    }
}
