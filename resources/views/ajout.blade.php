@extends('layouts.template')
@section('titre','ajout')
@section('content')
<div class="container my-5">
<div class=" d-flex justify-content-center">
    @if(session('sucess'))
     <div class="alert alert-success w-50">{{session('sucess')}}</div>
     @endif
</div>

    <div class="d-flex justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <h1>ajouter</h1>
            </div>
            <div class="card-body">
                <form action="ajout" method="post">
                    @csrf
                    <div class="form-group">
                        <label for="" class="form-label">Nom</label>
                        <input type="text" name="nom" class="form-control">
                    </div>
                    @error('nom')
                    <p class="text-red-500">حقل الاسم مطلوب</p>
                    @enderror
                    <div class="form-group">
                        <label for="" class="form-label">Numero Telephone</label>
                        <input type="text" name="tel" class="form-control">
                    </div>
                    @error('tel')
                    @if ($message=='The tel has already been taken.')
                     <p class="text-red-500">لقد تم بالفعل أخذ الهاتف</p>
                    @endif
                    @enderror
                    <div class="form-group">
                        <label for="" class="form-label">Prix</label>
                        <input type="text" name="prix" class="form-control">
                    </div>
                    @error('prix')
                    <p class="text-red-500">حقل السعر مطلوب </p>
                    @enderror
                    <div class="d-grid my-2">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div> 
</div>    
    

@endsection