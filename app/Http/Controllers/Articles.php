<?php

namespace App\Http\Controllers;
use App\Models\Article;
use App\Models\commadefinit;

use Illuminate\Http\Request;

class Articles extends Controller
{
    public function ajouter(){
        return view('ajout');
    }


    public function ajout(Request $req){
        $v=$req->validate([
            'nom' => ['required'],
            'tel' => ['required','unique:App\Models\Article,tel'],
            'prix' => ['required']
        ]
        );
       $x=Article::create($v);
       return redirect()->route('ajouter')->with('sucess','insertion avec succed');
    }

    public function afficher(){
        $ar= new Article();
        $a= $ar->paginate(10);
        return view('afficher',compact('a'));
    }
    public function delete($id){
        $a = new Article();
        $ar=$a->find($id);
        commadefinit::create(['nom'=>$ar->nom,'tel'=>$ar->tel,'prix'=>$ar->prix]);
        $ar->delete();
        return redirect()->route('afficher');
    }
    public function edit($id){
        $a= new Article();
        $ar= $a::find($id);
        return view('edit',compact('ar'));
    }
    public function update(){
        $ar=new Article();
        $a= $ar->find(request()->id);
        $a->update(request()->all());
        return redirect()->route('afficher');
    }
    public function recherche(){
        $x=request()->input('ch');
        $a=Article::where('nom','like',"%$x%")->orWhere('tel','like',"%$x%")->paginate(10);
        return view('afficher',compact('a'));
    }
}
