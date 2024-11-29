@extends('layouts.template')
@section('titre','commandefinit')
@section('content')
<div class="container my-5">
        
    <div class="container mt-4  d-flex justify-content-center">
    <table class="table">
    <header>
    <tr>
        <th>Nom</th>
        <th>Telephone</th>
        <th>Prix</th>
        <th>Date</th>
        
    </tr>
    </header>
    <tbody>
            @foreach ($a as $i)
            <tr>
                <td>{{ $i->nom }}</td>
                <td>{{ $i->tel }}</td>
                <td>{{ $i->prix }}</td>
                <td>{{$i->created_at}}</td>
                
            </tr>
            @endforeach
            
            
    </tbody>
    
</table>
    </div>
    {{$a->links()}}
</div>


@endsection