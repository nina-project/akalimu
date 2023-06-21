<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::group(['middleware' => 'auth',],
    function () {
        Route::get('/', function() {
            return redirect(route('home'));
        });

        Route::view('/', 'dashboards.home');


        Route::resource('fieldCategories', App\Http\Controllers\FieldCategoryController::class);
        
        
        Route::resource('fields', App\Http\Controllers\FieldController::class);
        
        
        Route::resource('jobs', App\Http\Controllers\JobController::class);
        
        
        Route::resource('users', App\Http\Controllers\UserController::class);
        
        
        Route::resource('jobRecommendations', App\Http\Controllers\JobRecommendationController::class);
        
        
        Route::resource('fieldCategories', App\Http\Controllers\FieldCategoryController::class);
        
        
        Route::resource('jobRecommendations', App\Http\Controllers\JobRecommendationController::class);
    }
);



Route::resource('categories', App\Http\Controllers\CategoryController::class);
