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
        Schema::create('levels', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->unsignedBigInteger('id_chapter');
            $table->foreign('id_chapter')->references('id')->on('chapters')->onDelete('cascade')->onUpdate('cascade');
            $table->string('level_name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('levels');
    }
};
