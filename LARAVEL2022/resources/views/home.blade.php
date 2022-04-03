@extends('app')


@section('content')


<section class="products mt-3">

   <div class="row">
      <div class="col-md-12">
      <h1 class="title">latest products</h1>

<div class="container">
      </div>
   </div>


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

@else 

No products found.

@endif
   </div>

   </div>

   <div class="load-more" style="margin-top: 2rem; text-align:center">
      <a href="shop.php" class="option-btn">load more</a>
   </div>

</section>

<section class="about">

   <div class="flex">

      <div class="image">
         <img src="images/about-img.jpg" alt="">
      </div>

      <div class="content">
         <h3>about us</h3>
         <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit quos enim minima ipsa dicta officia corporis ratione saepe sed adipisci?</p>
         <a href="about.php" class="btn">read more</a>
      </div>

   </div>

</section>

<section class="home-contact">

   <div class="content">
      <h3>have any questions?</h3>
      <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Atque cumque exercitationem repellendus, amet ullam voluptatibus?</p>
      <a href="contact.php" class="white-btn">contact us</a>
   </div>

</section>



@endsection