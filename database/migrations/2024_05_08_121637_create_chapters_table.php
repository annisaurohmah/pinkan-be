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
        Schema::create('chapters', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_game'); // Gunakan unsignedBigInteger() untuk menghindari masalah dengan AUTO_INCREMENT
            $table->foreign('id_game')->references('id')->on('games')->onDelete('cascade')->onUpdate('cascade');
            $table->string('chapter_name');
        });
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('chapters');
    }
};
