@extends('app')
@section('title',       $productInfo[0]->name)
@section('categoryId',  $productType[0]->id)
@section('categoryName', $productType[0]->name)
@section('productName', $productInfo[0]->name)

@section('content')

@include('components.header-products')

<div class="row">
    <div class="col-md-4">
        <div class="card mb-3">
            <div class="card-body text-center">
                <img src="/{{$productInfo[0]->image}}" alt="" style="object-fit: cover; width: 100%">
            </div>
        </div>
        <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <b>Seller:</b></h5>
                            </div>
                         
                            <div class="col-md-12 mt-2">
                                
                                <div class="row">
                                    <div class="col-md-3">
                                        <img src="/{{$productInfo[0]->seller->image}}" alt="" style="border-radius: 5%; height: 100px">
                                    </div>
                                    <div class="col-md-9">
                                        <a href="/user/{{$productInfo[0]->user_id}}">
                                            <b>
                                            {{$productInfo[0]->seller->name}}
                                            </b>
                                        </a>
                                        <p>
                                            <span>
                                                Created account time: 
                                                <br>
                                                 {{$productInfo[0]->seller->created_at}}
                                            </span>
                                        </p>
                                        <a href="/user/{{$productInfo[0]->user_id}}">
                                        <button class="btn btn-primary w-100 btn-sm">
                                                Other books
                                            </button>
                                      </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div class="col-md-8">
        <div class="row">
            <div class="cold-md-12">
            <h1>
            {{$productInfo[0]->name}}
            <hr>
        </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
            
        <table>
            <tr>
                <td><b>Category:</b></td>
                <td>
                    <a href="">
                        {{$productInfo[0]->type->name}}
                    </a>
                </td>
            </tr>
            <tr>
                <td><b>Author:</b></td>
                <td>
                    <a href="">
                        {{$productInfo[0]->author->name}}
                    </a>
                </td>
            </tr>
            <tr>
                <td><b>Publisher: </b></td>
                <td>
                    <a href="">
                        {{$productInfo[0]->publisher->name}}
                    </a>
                </td>
            </tr>
            <tr>
                <td><b>Language</b>:</td>
                <td>
                    {{$productInfo[0]->language->name}}
                </td>
            </tr>
            <tr>
                <td><b>Pages:</b></td>
                <td>
                {{$productInfo[0]->nr_pages}}
                </td>
            </tr>
            <tr>
                <td><b>Status:</b></td>
                <td>
                    {{$productInfo[0]->status->name}}
                </td>
            </tr>
        </table>
            </div>
            <div class="col-md-5">
                <div class="card border-0">
                    <div class="card-body p-2">
                        <div class="row">
                            <div class="col-md-6">
                            <h3><b>Price  :</b></h3>
                            <h4>
                               {{$productInfo[0]->price}} RON
                            </h1>
                            
                            </div>
                            <div class="col-md-6 float-end text-end">
                                @if(session('wishlist') != null)
                                    @if(in_array($productInfo[0]->id, session('wishlist')))
                                        <a href="/remove-wishlist/{{$productInfo[0]->id}}">
                                            <i class="far fa-heart fa-4x" style="color: red"></i>
                                        </a>
                                    @else 
                                        <a href="/add-wishlist/{{$productInfo[0]->id}}">
                                            <i class="far fa-heart fa-4x"></i>
                                        </a>
                                    @endif
                                @else 
                                    <a href="/add-wishlist/{{$productInfo[0]->id}}">
                                            <i class="far fa-heart fa-4x"></i>
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 p-1">
                    <a href="/add-cart/{{$productInfo[0]->id}}">
                        <button class="btn btn-primary w-100">
                            Add to cart
                        </button>
                    </a>
                    </div>

                </div>
                
            </div>
            <div class="col-md-12">
                <hr>
            </div>
            
        </div>
        <div class="row">
            <div class="col-md-12">
                <h4><b>Description</b></h1>
                {!!$productInfo[0]->description!!}
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <hr>

    </div>


    
</div>





@endsection