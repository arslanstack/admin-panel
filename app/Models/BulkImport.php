<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BulkImport extends Model
{
    use HasFactory;

    protected $table = 'bulk_imports';

    protected $fillable = [
        'file_name',
        'total_records',
    ];

    
}
