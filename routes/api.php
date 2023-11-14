<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController; 

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// }); -k
// 
 
Route::middleware('api')->prefix('v1')->group(function () {
    Route::get('products/filters', [ProductController::class, 'getFilter']);
    Route::get('products/similar-items', [ProductController::class, 'similarItems']);   
    Route::resource('products', ProductController::class);   
    Route::post('review/submit-review', [ProductController::class, 'submitReview']);

});