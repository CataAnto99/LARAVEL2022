<?php

use Illuminate\Support\Facades\Route;

Route::get('/',              [App\Http\Controllers\UserController::class, 'index']);
Route::get('/contact',       [App\Http\Controllers\UserController::class, 'contact']);
Route::get('/shop',          [App\Http\Controllers\UserController::class, 'shop']);
Route::get('/shop/{id}',     [App\Http\Controllers\UserController::class, 'shopFindId']);
Route::get('/about',         [App\Http\Controllers\UserController::class, 'about']);
//Route::get('/home',          [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/add-cart/{id}',            [App\Http\Controllers\UserController::class, 'addProductCart']);
Route::get('/cart',                     [App\Http\Controllers\UserController::class, 'cart']);
Route::get('/add-wishlist/{id}',        [App\Http\Controllers\UserController::class, 'addProductWishList']);
Route::get('/remove-wishlist/{id}',     [App\Http\Controllers\UserController::class, 'removeProductWishList']);
Route::get('/remove-cart/{id}',     [App\Http\Controllers\UserController::class, 'removeProductCart']);
Route::get('/removeAllItemsFromCart',          [App\Http\Controllers\UserController::class, 'removeAllItemsFromCart']);
Route::get('/product/{id}',                    [App\Http\Controllers\UserController::class, 'productInfo']);
Route::get('/user/{id}',                       [App\Http\Controllers\UserController::class, 'userBooks']);
Route::get('/profile',                [App\Http\Controllers\UserController::class, 'profile']);
Route::get('/my-products',            [App\Http\Controllers\UserController::class, 'myProducts'])->name('myProducts');
Route::post('/edit-profile',            [App\Http\Controllers\UserController::class, 'editProfile']);
Route::delete('/deleteMyProduct/{id}',  [App\Http\Controllers\UserController::class, 'deleteMyProduct'])->name('deleteMyProduct');
Route::get('/add-book',          [App\Http\Controllers\UserController::class, 'addNewBookCreate']);
Route::post('/add-book-post',    [App\Http\Controllers\UserController::class, 'addNewBook']);
Route::get('/home', function ()  { return redirect()->route('myProducts'); });
Auth::routes();

