<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Provider;
use App\Models\ProviderService;
use Illuminate\Support\Facades\Validator;

class ProviderController extends Controller
{
    public function index(Request $request)
    {
        $query = Provider::query();
        $search_query = $request->input('search_query');
        if ($request->has('search_query') && !empty($search_query)) {
            $query->where(function ($query) use ($search_query) {
                $query->where('name', 'like', '%' . $search_query . '%');
            });
        }
        $data['providers'] = $query->orderBy('id', 'DESC')->paginate(50);
        $data['searchParams'] = $request->all();
        return view('admin/providers/manage_providers', $data);
    }
    public function details($id){
        $provider= Provider::find($id);
        if(!$provider){
            return redirect()->back()->with('error', 'Provider not found.');
        }
        $services = ProviderService::where('provider_id', $id)->get();
        return view('admin/providers/provider_details', compact('services', 'provider'));
    }
    public function add(){
        return view('admin/providers/add_provider');
    }
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
        ]);
        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }
        $provider = new Provider();
        $provider->name = $request->name;
        $provider->phone = $request->phone ? $request->phone : null;
        $provider->email = $request->email ? $request->email : null;
        $provider->short_description = $request->short_description ? $request->short_description : null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/providers');
            $image->move($destinationPath, $image_name);
            $provider->image = $image_name;
        }
        $provider->save();
        return redirect()->route('provider.details',  ['id' => $provider->id])->with('success', 'Provider added successfully.');
    }

    public function update(Request $request){
        // return response()->json(['msg' => 'error', 'response' => dd($request->all())]);
        $validate = Validator::make($request->all(), [
            'name' => 'required',
        ]);
        if ($validate->fails()) {
            return response()->json(['msg' => 'error', 'response' => $validate->errors()->first()]);
        }
        $provider = Provider::find($request->id);
        if(!$provider){
            return response()->json(['msg' => 'error', 'response' => 'Provider not found.']);
        }
        $provider->name = $request->name;
        $provider->phone = $request->phone ? $request->phone : null;
        $provider->email = $request->email ? $request->email : null;
        $provider->short_description = $request->short_description ? $request->short_description : null;
        if ($request->hasFile('image')) {
            // unlink previous image if not provider.png
            if ($provider->image != 'provider.png') {
                $image_path = public_path('/uploads/providers/' . $provider->image);
                if (file_exists($image_path)) {
                    unlink($image_path);
                }
            }
            $image = $request->file('image');
            $image_name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/providers');
            $image->move($destinationPath, $image_name);
            $provider->image = $image_name;
        }
        $query = $provider->save();
        if($query){
            return response()->json(['msg' => 'success', 'response' => 'Provider updated successfully.']);
        }else{
            return response()->json(['msg' => 'error', 'response' => 'Something went wrong.']);
        }
    }
    public function destroy(Request $request)
    {
        $provider = Provider::find($request->id);
        if ($provider) {
            // delete provider->image if not equal to provider.png
            if ($provider->image != 'provider.png') {
                $image_path = public_path('/uploads/providers/' . $provider->image);
                if (file_exists($image_path)) {
                    unlink($image_path);
                }
            }
            $provider->delete();
            return response()->json(['msg' => 'success', 'response' => 'Provider deleted successfully.']);
        } else {
            return response()->json(['msg' => 'error', 'response' => 'Provider not found.']);
        }
    }
}
