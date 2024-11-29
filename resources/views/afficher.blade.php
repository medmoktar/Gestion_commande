@extends('layouts.template')
@section('titre','afficher')
@section('content')
<div class="container my-5">
        <form action="recherche" class="mx-5">
            <div class="input-group">
                <input type="text" name="ch" class="form-control" placeholder="Recherche Commande">
                <button class="btn btn-primary">Rechercher</button>
            </div>
        </form>
    <div class="container mt-4  d-flex justify-content-center">
    <table class="table">
    <header>
    <tr>
        <th>Nom</th>
        <th>Telephone</th>
        <th>Prix</th>
        <th>Date</th>
        <th>Action</th>
    </tr>
    </header>
    <tbody>
            @foreach ($a as $i)
            <tr>
                <td>{{ $i->nom }}</td>
                <td>{{ $i->tel }}</td>
                <td>{{ $i->prix }}</td>
                <td>{{$i->created_at}}</td>
                <td>
                    <a href="{{ route('modiffier',['id'=>$i->id])}}" class="btn btn-success"><i class="bi bi-pencil-square"></i></a>
                    <a  onclick="sup({{$i->id}})" class="btn btn-danger"><i class="bi bi-check-lg"></i></a>
                </td>
            </tr>
            @endforeach
            
            
    </tbody>
    
</table>
    </div>
    {{$a->links()}}
</div>


@endsection