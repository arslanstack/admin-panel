<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\OnEachRow;
use Maatwebsite\Excel\Row;

class RowCountImport implements OnEachRow
{
    public $rowCount;

    public function __construct()
    {
        $this->rowCount = 0;
    }

    public function onRow(Row $row)
    {
        $this->rowCount++;
    }
}
