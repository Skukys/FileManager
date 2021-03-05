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

Route::post('/users', 'App\Http\Controllers\UserController@register');
Route::post('/authorization', 'App\Http\Controllers\UserController@auth');
Route::delete('/logout', 'App\Http\Controllers\UserController@logout');

Route::middleware('checkAuth')->group(function (){

    Route::get('/devises', 'App\Http\Controllers\DeviceController@devises');
    Route::post('/folder/{id}', 'App\Http\Controllers\FolderController@create');
    Route::post('/folder/{id}/files', 'App\Http\Controllers\FileController@upload');
    Route::get('/folder/{id}', 'App\Http\Controllers\FileController@getFiles');
    Route::get('/folder/show/{id}', 'App\Http\Controllers\FolderController@showFolderTree');

});

