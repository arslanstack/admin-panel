<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ZipLocation extends Model
{
    use HasFactory;

    protected $table = 'zip_locations';

    protected $fillable = [
        'zip',
        'city',
        'state',
        'batch_id',
    ];

    public function batch()
    {
        return $this->belongsTo(BulkImport::class, 'batch_id');
    }

    
}
