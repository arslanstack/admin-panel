<?php

namespace App\Imports;

use App\Models\BulkImport;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\ZipLocation;
use App\Models\Provider;
use App\Models\ProviderPackage;
use App\Models\Offer;
use App\Models\ProviderService;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\WithLimit;
use Maatwebsite\Excel\Row;

class ZipImport implements ToCollection, WithChunkReading, WithLimit
{
    // constructor with providers_array

    public $batch_id;

    public function __construct($batch_id)
    {
        $this->batch_id = $batch_id;
    }
    /**
     * @param Collection $collection
     */
    public function collection(Collection $rows)
    {
        foreach ($rows as $index => $row) {
            // $postalCode = $row[0];
            $postalCode = trim($row[0]);
            if (strcasecmp($postalCode, "Postal Code") === 0) {
                continue;
            }
            $zipLocation = $this->getZip($postalCode);

            foreach ($row as $colIndex => $availability) {
                if ($colIndex === 0) {
                    continue;
                }

                $providerName = $rows[0][$colIndex];
                $providerID = $this->getProvider($providerName);
                if ($providerID == null) {
                    break;
                }
                if ($availability == 1) {
                    // check if  internet offer exists where zip, provider id and offer type is 0
                    $internet_offer = Offer::where('zip', $zipLocation)->where('provider_id', $providerID)->where('offer_type', 0)->first();
                    if (!$internet_offer) {
                        $internet_offer = new Offer();
                        $internet_offer->zip = $zipLocation;
                        $internet_offer->provider_id = $providerID;
                        $internet_offer->batch_id = $this->batch_id;
                        $internet_offer->offer_type = 0;
                        $internet_offer->offer_specs = "High Speed Internet";
                        $internet_offer->offer_points = json_encode(["Limited time $100 cashback on Prepaid Mastercard via rebate", "No Hard Data Limits", "Secure your devices, data and network for a safer web surfing"]);
                        $internet_offer->save();
                    }
                    // check if tv offer exists where zip, provider id and offer type is 1
                    $tv_offer = Offer::where('zip', $zipLocation)->where('provider_id', $providerID)->where('offer_type', 1)->first();
                    if (!$tv_offer) {
                        $tv_offer = new Offer();
                        $tv_offer->zip = $zipLocation;
                        $tv_offer->provider_id = $providerID;
                        $tv_offer->batch_id = $this->batch_id;
                        $tv_offer->offer_type = 1;
                        $tv_offer->offer_specs = "More than 200 Channels";
                        $tv_offer->offer_points = json_encode(["More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more", "Select from a variety of local and regional channels", "Unlimited storage for cloud DVR"]);
                        $tv_offer->save();
                    }

                    // check if bundle offer exists where zip, provider id and offer type is 2
                    $bundle_offer = Offer::where('zip', $zipLocation)->where('provider_id', $providerID)->where('offer_type', 2)->first();
                    if (!$bundle_offer) {
                        $bundle_offer = new Offer();
                        $bundle_offer->zip = $zipLocation;
                        $bundle_offer->provider_id = $providerID;
                        $bundle_offer->batch_id = $this->batch_id;
                        $bundle_offer->offer_type = 2;
                        $bundle_offer->offer_specs = "Unlimited Calls";
                        $bundle_offer->offer_points = json_encode(["Blazing fast speed up to 5Gig", "End-to-End Encrypted Calls.", "Secure Data Connection and streaming Options."]);
                        $bundle_offer->save();
                    }
                }
            }
        }

        return $rows;
    }

    public function getZip($postalCode)
    {
        $existingZip = ZipLocation::where('zip', $postalCode)->first();
        if (!$existingZip) {
            $zipLoc = new ZipLocation();
            $zipLoc->zip = $postalCode;
            $zipLoc->batch_id = $this->batch_id;
            $zipLoc->save();
            return $zipLoc->zip;
        } else {
            return $existingZip->zip;
        }
    }

    public function getProvider($providerName)
    {
        $trimmedproviderName = trim($providerName);
        if (empty($providerName)) {
            return null;
        }
        if (is_numeric($providerName) || (is_string($providerName) && ctype_digit($providerName))) {
            return null;
        }
        $provider = Provider::where('name', $providerName)->first();
        if (!$provider) {
            $providerID = DB::table('providers')->insertGetId(
                ['name' => $providerName, 'batch_id' => $this->batch_id, 'image' => "provider.png", 'short_description' => $providerName . " is a leading internet service provider in the United States, providing high-speed internet, cable television, and digital phone services to residential and business customers."]
            );
            $service = new ProviderService();
            $service->provider_id = $providerID;
            $service->title = "Internet";
            $service->save();
            $basic_package = new ProviderPackage();
            $basic_package->provider_id = $providerID;
            $basic_package->service_id = $service->id;
            $basic_package->pkg_type = 0;
            $basic_package->title = "Starter";
            $basic_package->specs = "High Speed Internet";
            $basic_package->price = "49.99";
            $basic_package->duration = "12 Months";
            $basic_package->features = json_encode(["Limited time $100 cashback on Prepaid Mastercard via rebate", "No Hard Data Limits", "Secure your devices, data and network for a safer web surfing"]);
            $basic_package->save();

            $plus_package = new ProviderPackage();
            $plus_package->provider_id = $providerID;
            $plus_package->service_id = $service->id;
            $plus_package->pkg_type = 1;
            $plus_package->title = "Standard";
            $plus_package->specs = "High Speed Fast Internet";
            $plus_package->price = "69.99";
            $plus_package->duration = "12 Months";
            $plus_package->features = json_encode(["Limited time $100 cashback on Prepaid Mastercard via rebate", "No Hard Data Limits", "Secure your devices, data and network for a safer web surfing"]);
            $plus_package->save();

            $pro_package = new ProviderPackage();
            $pro_package->provider_id = $providerID;
            $pro_package->service_id = $service->id;
            $pro_package->pkg_type = 2;
            $pro_package->title = "Ultra";
            $pro_package->specs = "Blazing Fast Internet";
            $pro_package->price = "99.99";
            $pro_package->duration = "12 Months";
            $pro_package->features = json_encode(["Limited time $100 cashback on Prepaid Mastercard via rebate", "No Hard Data Limits", "Secure your devices, data and network for a safer web surfing"]);
            $pro_package->save();
            return $providerID;
        } else {
            return $provider->id;
        }
    }

    public function chunkSize(): int
    {
        return 100;
    }
    public function limit(): int
    {
        return 100;
    }
}
