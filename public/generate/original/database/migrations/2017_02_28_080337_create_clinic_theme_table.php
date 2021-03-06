<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClinicThemeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clinic_theme', function (Blueprint $table) {
            $table->bigIncrements('clinic_theme_id');

            $table->bigInteger('clinic_id')->default(0)->unsigned();
            $table->bigInteger('theme_id')->default(0)->unsigned();

            $table->foreign('clinic_id')->references('clinic_id')->on('clinic')->onDelete('cascade');
            $table->foreign('theme_id')->references('id')->on('themes')->onDelete('cascade');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('clinic_theme');
    }
}
