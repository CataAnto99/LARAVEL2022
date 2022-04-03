@extends('app')
@section('title', 'Products')
@section('content')

@include('components.header-other')


<div class="container">

   <div class="row mb-3">
      <div class="col-md-3">
            <select name="" id="" class="form-control" onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
            @foreach($productType as $type)
               <option value="/shop/{{$type->id}}" @if($type->id == $selected_type) selected @endif >{{$type->name}}</option>
            @endforeach
         </select>   
      </div>
   </div>


   <div class="row mb-3">
   @if(count($products) > 0)

      @foreach($products as $product)
        
            <div class="col-md-3 box-container mb-3">
            <a href="/product/{{$product->id}}">
               <div class="card">
                  <div class="card-body">
                  <div style="width: 100%; height: 200px; background-image: url({{$product->image }}); background-size: cover" >

                  </div>
                  <div class="name mt-3"> 
                     <h4>
                     {{$product->name }}
                     </h4>   
                  </div>
                  <div class="price"> 
                     {{$product->price }} RON   
                  </div>
                     <div class="row">
                        <div class="col-md-9 col-10">
                        <a href="/add-cart/{{$product->id}}">
                        <input type="submit" value="add to cart" name="add_to_cart" class="btn btn-primary w-100 mt-3">
                     </a>
                     
                        </div>
                        <div class="col-md-3 col-2">
                           @if(session('wishlist') != null)
                                       @if(in_array($product->id, session('wishlist')))
                                          <a href="/remove-wishlist/{{$product->id}}">
                                             <i class="far fa-heart fa-2x mt-3" style="color: red"></i>
                                          </a>
                                       @else 
                                          <a href="/add-wishlist/{{$product->id}}">
                                             <i class="far fa-heart fa-2x mt-3"></i>
                                          </a>
                                       @endif
                                 @else 
                                       <a href="/add-wishlist/{{$product->id}}">
                                             <i class="far fa-heart fa-2x mt-3"></i>
                                       </a>
                           @endif
                        </div>
                     </div>
                  </div>
               </div>
               </a>
            </div>
       
      @endforeach
   @else 
      <div class="row">
         <div class="col-md-12">
         <div class="card">
            <div class="card-body">
               <p class="mb-0">No products found.</p>
            </div>
         </div>
         </div>
      </div>
   @endif
   </div>

   </div>
   {{$products->links()}}

@endsection