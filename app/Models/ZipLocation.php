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
    ];

    
}
