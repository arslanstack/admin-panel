<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BulkImport;
use App\Models\Offer;
use App\Models\Provider;
use App\Models\ZipLocation;
use App\Imports\ZipImport;
use App\Imports\RowCountImport;
use App\Models\ProviderPackage;
use App\Models\ProviderService;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;

class ImportsController extends Controller
{
    public function index()
    {
        $imports = BulkImport::orderBy('id', 'desc')->get();
        return view('admin.imports.manage_imports', compact('imports'));
    }
    public function import(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'csv_file' => 'required|mimes:xlsx,xls',
        ]);

        if ($validate->fails()) {
            return redirect()->back()->withErrors($validate->errors());
        }

        $rowCountImport = new RowCountImport();
        Excel::import($rowCountImport, $request->file('csv_file'));
        $rowCount = $rowCountImport->rowCount;
        if ($rowCount > 100) {
            return response()->json(['msg' => 'error', 'message' => 'File should not contain more than 100 rows']);
        }
        $file = $request->file('csv_file');
        $file_name = time() . '.' . $file->getClientOriginalExtension();
        $file->move(public_path('uploads/imports'), $file_name);

        $import = new BulkImport();
        $import->file_name = $file_name;
        $import->save();
        try {
            Excel::import(new ZipImport($import->id), public_path('uploads/imports/' . $file_name));
            return response()->json(['msg' => 'success', 'message' => 'File imported successfully']);
            // return redirect()->back()->with('success', 'File imported successfully');
        } catch (\Exception $e) {
            if($import->file_name){
                $file = public_path() . "/uploads/imports/" . $import->file_name;
                if (file_exists($file)) {
                    unlink($file);
                }
            }
            $offers = Offer::where('batch_id', $import->id)->delete();
            $providers = Provider::where('batch_id', $import->id)->delete();
            $zipLocations = ZipLocation::where('batch_id', $import->id)->delete();
            $import->delete();
            return response()->json(['msg' => 'error', 'message' => $e->getMessage()]);
            // return redirect()->back()->with('error', $e->getMessage());
            // dd($e->getMessage());
        }
    }
    public function sampleDownload()
    {
        $file = public_path() . "/uploads/imports/sample.xlsx";
        $headers = array(
            'Content-Type: application/xlsx',
        );
        return response()->download($file, 'sample.xlsx', $headers);
    }
    public function DownloadOldImport($filename)
    {
        // dd($filename);
        $file = public_path() . "/uploads/imports/" . $filename;
        if (file_exists($file)) {
            $headers = array(
                'Content-Type: application/xlsx',
            );
            return response()->download($file, $filename, $headers);
        } else {
            return redirect()->back()->with('flash_error', 'File not found');
        }
    }
    public function revertImport(Request $request){
        $import = BulkImport::find($request->id);
        // dd($import);
        if($import){
            $offers = Offer::where('batch_id', $import->id)->delete();
            $providers = Provider::where('batch_id', $import->id)->delete();
            $zipLocations = ZipLocation::where('batch_id', $import->id)->delete();
            if($import->file_name){
                $file = public_path() . "/uploads/imports/" . $import->file_name;
                if (file_exists($file)) {
                    unlink($file);
                }
            }
            $import->delete();
            return response()->json(['msg' => 'success', 'message' => 'Import reverted successfully']);
        }else{
            return response()->json(['msg' => 'error', 'message' => 'Import not found']);
        }
    }
}
