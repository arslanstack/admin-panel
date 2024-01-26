<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProviderPackage extends Model
{
    use HasFactory;

    protected $table = 'provider_packages';

    protected $fillable = [
        'provider_id',
        'service_id',
        'title',
        'pkg_type',
        'specs',
        'price',
        'duration',
        'features',
    ];

    public function provider()
    {
        return $this->belongsTo(Provider::class, 'provider_id');
    }

    public function service()
    {
        return $this->belongsTo(ProviderService::class, 'service_id');
    }
}
