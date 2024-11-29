<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\commadefinit;
class commandefinitController extends Controller
{
    public function get(){
        $a=commadefinit::paginate(10);
        return view('commandefinit',compact('a'));
    }
}
