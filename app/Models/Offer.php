<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    use HasFactory;
    protected $table = 'offers';

    protected $fillable = [
        'zip',
        'offer_type',
        'provider_id',
        'offer_specs',
        'offer_points',
    ];

    public function provider()
    {
        return $this->belongsTo(Provider::class, 'provider_id');
    }

    public function location()
    {
        return $this->belongsTo(ZipLocation::class, 'zip');
    }
}
