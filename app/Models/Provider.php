<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    use HasFactory;

    protected $table = 'providers';

    protected $fillable = [
        'name',
        'image',
        'short_description',
        'phone',
        'email',
        'website',
        'batch_id',
    ];

    public function services()
    {
        return $this->hasMany(ProviderService::class, 'provider_id');
    }

    public function offers()
    {
        return $this->hasMany(Offer::class, 'provider_id');
    }

    public function batch()
    {
        return $this->belongsTo(BulkImport::class, 'batch_id');
    }
}
