<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Articles;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';

Route::get('ajouter',[Articles::class,'ajouter'])->name('ajouter');
Route::post('ajout',[Articles::class,'ajout']);
Route::get('afficher',[Articles::class,'afficher'])->name('afficher');
Route::get('delete/{id}',[Articles::class,'delete'])->name('supprimer');
Route::get('edit/{id}',[Articles::class,'edit'])->name('modiffier');
Route::post('update',[Articles::class,'update'])->name('update');
Route::get('commandefinit',[App\Http\Controllers\commandefinitController::class,'get']);
Route::get('recherche',[Articles::class,'recherche']);