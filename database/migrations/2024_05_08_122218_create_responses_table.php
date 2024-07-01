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
        Schema::create('responses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_question');
            $table->unsignedBigInteger('id_session');
            $table->foreign('id_question')->references('id')->on('questions')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('id_session')->references('id')->on('sessions')->onDelete('cascade')->onUpdate('cascade');
            $table->string('response');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('responses');
    }
};
