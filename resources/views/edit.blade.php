@extends('layouts.template')

@section('titre','edit')

@section('content')
<div class="container mt-5">
    <div class="d-flex justify-content-center">
        <div class="card w-50 ">
            <div class="card-header text-center">
                <h1>ajouter</h1>
            </div>
            <div class="card-body">
                <form action="{{route('update')}}" method="post">
                    @csrf
                    <input type="hidden" name="id" value="{{$ar->id}}">
                    <div class="form-group">
                        <label for="" class="form-label">Nom</label>
                        <input type="text" name="nom" class="form-control" value="{{ $ar->nom }}">
                    </div>
                    <div class="form-group">
                        <label for="" class="form-label">Numero Telephone</label>
                        <input type="text" class="form-control" value="{{$ar->tel}}">
                    </div>
                    <div class="form-group">
                        <label for="" class="form-label">Prix</label>
                        <input type="text" name="prix" class="form-control" value="{{ $ar->prix }}">
                    </div>
                    <div class="d-grid my-2">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection