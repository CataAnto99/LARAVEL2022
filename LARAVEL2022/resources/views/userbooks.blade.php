@extends('app')
@section('title', 'Profile  ' . $userInfo[0]->name)
@section('content')
<div class="row mt-3">
   <div class="col-md-4">
      <div class="card h-100">
         <div class="card-body">
            <div class="row mb-2">
               <b>Seller:</b>
            </div>
            <div class="row">
               <div class="col-md-3 ms-2 border" style="height: 120px; border-radius: 5%; background-image: url('/{{$userInfo[0]->image}}'); background-size: cover">
                  
               </div>
               <div class="col-md-8">
                  <a href="/user/1">
                  <b>
                  {{$userInfo[0]->name}}
                  </b>
                  </a>
                  <p>
                     <span>
                     Created account time: 
                     <br>
                     {{$userInfo[0]->created_at}}
                     </span>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="col-md-8">
      <div class="card h-100">
         <div class="card-body">
            <div class="row">
               <div class="col-md-12">
                  <b>Reviews</b>
               </div>
            </div>
            <div class="row pt-2">
               <div class="col-md-12">
                  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">

                     <div class="carousel-inner">
                        @foreach($userInfo[0]->reviews as $key => $item)
                        <div class="carousel-item @if( $key == 0) active @endif">
                           <div class="row">
                              <div class="col-md-2 border" style="height: 120px; width: 120px;border-radius: 5%; background-image: url('/{{$userInfo[0]->image}}'); background-size: cover">
                     
                              </div>
                              <div class="col-md-8 ms-2" >
                                 
                                 <div style="height: 50px">
                                    {{$item->description}}
                                 </div>
                                 <hr>
                                  
                                 @for($i = 0; $i< 5; $i++)
                                    <i class="fas fa-star" @if($i <= $item->nr_stars-1) style="color: gold" @endif></i>
                                 @endfor
                              </div>
                           </div>
                        </div>
                        @endforeach
                     </div>
                    
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" style="background-color: black; width: 40px; border-radius: 5%">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only"></span>
                    </a>

                  </div>


               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="col-md-12">
   <hr>
</div>
<div class="col-md-12 mb-5">
   <h2>
      User books:
   </h2>
   <div class="card">
      <div class="card-body">
         <div class="row">
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
               <a href="/add-cart/{{$product->id}}">
               <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918681/heart.png" alt="" class="mt-3">
               </a>
               </div>
               </div>
               </div>
               </div>
               </a>
            </div>
            @endforeach
            @endif
            {{$products->links()}}
         </div>
      </div>
   </div>
</div>


@endsection