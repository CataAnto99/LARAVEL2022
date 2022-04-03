    <header class="header">
        <!-- Top Bar -->
        <div class="top_bar bg-light p-2" style="height: 50px">
            <div class="container d-flex justify-content-end">
                    <div class="row ms-auto  ">
                    <ul class="list-group list-group-horizontal d-flex align-items-center" style="list-style-type: none;">
                        @guest
                            @if (Route::has('login'))
                                    <a class="" href="{{ route('login') }}">{{ __('Login') }}</a> /
                            @endif
                            @if (Route::has('register'))
                                    <a class="" href="{{ route('register') }}">{{ __('Register') }}</a>
                            @endif
                        @else
                        
                            <li class="dropdown ">
                                <a id="" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }}
                                </a>
                                <div class="dropdown-menu " aria-labelledby="navbarDropdown"> <!-- dropdown-menu-end -->
                                    <a class="dropdown-item" href="/my-products" >
                                        Cartile mele 
                                    </a>
                                    <a class="dropdown-item" href="/profile">
                                        Editeaza profil 
                                    </a>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                            
                        @endguest
                    </ul>
                    </div>
            
            </div>
        </div> <!-- Header Main -->
        <div class="header_main p-3">
            <div class="container">
                <div class="row">
                    <!-- Logo -->
                    <div class="col-lg-2 col-sm-3 col-3 order-1">
                        <div class="logo_container">
                            <img src="https://www.pngkey.com/png/full/673-6736663_online-training-icon.png" alt="" style="height: 50px">
                        </div>
                    </div> <!-- Search -->
                    <div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
                        <div class="header_search">
                            <div class="header_search_content">
                                <div class="header_search_form_container">
                                   
                                </div>
                            </div>
                        </div>
                    </div> <!-- Wishlist -->
                    <div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
                        <div class="row float-end  ">
                                <div class="col-md-4 border-right me-3 ms-auto">
                            <div class="wishlist d-flex flex-row align-items-center justify-content-end">
                                <div class="wishlist_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918681/heart.png" alt=""></div>
                                <div class="wishlist_content ms-2">
                                    <div class="wishlist_text"><a href="#">Wishlist</a></div>
                                    <div class="wishlist_count"> {{ session('wishlist') != null ? count(session('wishlist')) : 0}}</div>
                                </div>
                            </div>
                            </div>
                            <div class="col-md-4">
                            <div class="cart">
                                <a href="/cart">
                                    <div class="cart_container d-flex flex-row align-items-center justify-content-end">
                                        <div class="cart_icon"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918704/cart.png" alt="">
                                        </div>
                                        <div class="cart_content ps-2">
                                            <div class="cart_text"><a href="/cart">Cart</a></div>
                                            <div class="cart_price">
                                                {{ session('cart') != null ? count(session('cart')) : 0}}
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- Main Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm" style="height: 60px">
  <div class="container">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="/">Home</a>
      <a class="nav-item nav-link" href="/about">About</a>
      <a class="nav-item nav-link" href="/shop">Shop</a>
      <a class="nav-item nav-link" href="/contact">Contact</a>
    </div>
        @guest @else 
            <div class="ms-auto">
                <a href="/add-book">
                    <button class="btn btn-primary " style="width: 200px;">Add book</button>
                </a>
            </div>
        @endguest
  </div>
  </div>
</nav>
    </header>
