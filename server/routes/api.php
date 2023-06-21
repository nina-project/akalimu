<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', 'AuthController@login');
Route::post('register', 'AuthController@register');

Route::group(['middleware' => 'jwt.auth'], function () {
    Route::resource('jobs', JobController::class);
    Route::resource('categories', CategoryAPIController::class);
    Route::get('jobs/recommended', 'JobController@recommended');
    Route::get('jobs/{job}/recommendations', 'JobController@recommendations');
});


// Route::group([
//     'middleware' => 'api',
//     'prefix' => 'auth'
// ], function ($router) {
//     Route::post('login', 'AuthController@login');
//     Route::post('logout', 'AuthController@logout');
//     Route::post('refresh', 'AuthController@refresh');
//     Route::post('me', 'AuthController@me');

//     Route::resource('field_categories', App\Http\Controllers\API\FieldCategoryAPIController::class);


//     Route::resource('fields', App\Http\Controllers\API\FieldAPIController::class);


//     Route::resource('jobs', App\Http\Controllers\API\JobAPIController::class);


//     Route::resource('users', App\Http\Controllers\API\UserAPIController::class);


//     Route::resource('job_recommendations', App\Http\Controllers\API\JobRecommendationAPIController::class);

// });
