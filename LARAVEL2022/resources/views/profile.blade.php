@extends('app')
@section('title', 'My profile')
@section('content')

@include('components.header-other')

<form action="edit-profile" method="POST" enctype="multipart/form-data">
    @csrf 
<div class="row">
    <div class="col-md-4 text-center">
        <div class="row">
            <div class="col-md-12">
            <img src="{{$userInfo[0]->image == null ? 
            'https://www.kindpng.com/picc/m/22-223863_no-avatar-png-circle-transparent-png.png' : $userInfo[0]->image}}" alt=""
            style="height: 260px; border-radius: 5%">
            </div>
            <div class="col-md-8 text-center mx-auto">
            <div class="mt-3">
                    <label for="image" class="form-label">Display name</label>
                    <input type="file" class="form-control" id="image" name="image">
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8">

    @include('components.success')

        <div class="card">
            <div class="card-body">
                <div class="mt-3">
                    <label for="name" class="form-label">Display name</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{$userInfo[0]->name}}">
                </div>

                <div class="mt-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" value="{{$userInfo[0]->email}}" >
                </div>

                <div class="mt-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password">
                </div>

                <div class="mt-3">
                    <button class="btn btn-primary" type="submit">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

@endsection