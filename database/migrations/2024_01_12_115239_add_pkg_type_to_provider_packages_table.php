<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('provider_packages', function (Blueprint $table) {
            $table->tinyInteger('pkg_type')->default(1)->after('service_id')->comment('0=>Basic,1=>Plus,2=>Pro');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('provider_packages', function (Blueprint $table) {
            $table->dropColumn('pkg_type');
        });
    }
};
