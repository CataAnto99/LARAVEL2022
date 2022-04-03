<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductType;
use App\Models\User;
use App\Models\Author;
use App\Models\Language;
use App\Models\Publisher;
use Auth;
use Illuminate\Support\Facades\Hash;
use Storage;



class UserController extends Controller
{
    public function index()
    {
        $products = Product::paginate(12);
        return view('home', compact('products'));
    }

    public function shop()
    {
        $productType = ProductType::where('is_active', 1)->get();
        $products = Product::paginate(12);
        $selected_type = null;
        return view('shop', compact('products', 'productType', 'selected_type'));
    }

    public function shopFindId($id)
    {
        $productType = ProductType::where('is_active', 1)->get();
        $products    = Product::where('product_type_id', $id)->paginate(10);
        $selected_type = $id;
        return view('shop', compact('products', 'productType', 'selected_type'));
    }

    public function contact()
    {
        return view('contact');
    }
    
    public function about()
    {
        return view('about');
    }

    public function addProductCart($id)
    {
        $product = Product::find($id);
        session()->push('cart', $product->id);

        return back()->with('message', 'Product was added to your shopping cart.');
    }

    public function addProductWishList($id)
    {
        $product = Product::find($id);
        session()->push('wishlist', $product->id);
        return back()->with('message', 'Product was added to your wishlist.');
    }

    public function removeProductWishList($id)
    {
        $products = session()->pull('wishlist', []); // Second argument is a default value
        if(($key = array_search($id, $products)) !== false) {
            unset($products[$key]);
        }
        session()->put('wishlist', $products);

        return back()->with('message', 'Product has been deleted from your wishlist.');
    }

    public function removeProductCart($id)
    {
        $products = session()->pull('cart', []);
        if(($key = array_search($id, $products)) !== false) {
            unset($products[$key]);
        }
        session()->put('cart', $products);

        return redirect()->back()->with('success', 'Product has been deleted from your cart.');
    }

    public function cart()
    {
        $items    = session('cart');
        $products = [];
        $total    = 0;

        if(session('cart') != null)
        {
            for($i = 0; $i< count($items); $i++)
            {
               $product = Product::where('id', $items[$i])->first();
               array_push($products, $product);
               $total += $product->price;
            }
        }
        return view('cart', compact('products', 'total'));
    }

    public function removeAllItemsFromCart()
    {
        session()->forget('cart');

        return back()->with('message', 'All items has been remove...');
    }

    public function productInfo($id)
    {
        $productInfo = Product::where('id', $id)->get();
        $productType = ProductType::where('id', $productInfo[0]->product_type_id)->get();

        return view('product', compact('productInfo', 'productType'));
    }

    public function userBooks($id)
    {
        $products = Product::where('user_id', $id)->paginate(8);
        $userInfo = User::where('id', $id)->get();
        return view('userbooks', compact('products', 'userInfo'));
    }

    public function profile()
    {
        $userInfo = User::where('id', Auth::user()->id)->get();
        return view('profile', compact('userInfo'));
    }

    public function myProducts()
    {
        $products = Product::where('user_id', Auth::user()->id)->paginate(10);
        return view('my_products', compact('products'));
    }

    public function editProfile(Request $request)
    {
        $userInfo        = User::findOrFail(Auth::user()->id);
        $userInfo->name  = $request->name;
        $userInfo->email = $request->email;

        if(!is_null($request->image))
        {
            $name           = $request->file('image')->getClientOriginalName();
            $storagePath    = Storage::disk('userImage')->put('images/',  $request->file('image'));
            $storageName    = basename($storagePath);
            $userInfo->image = 'images/' . $storageName;
        }
        
        if(!is_null($request->password))
            $userInfo->password = Hash::make($request->password);

        $userInfo->save();

        return redirect()->back()->with(['success' => 'The Message']);
    }

    public function deleteMyProduct($id)
    {
        $myProduct = Product::findOrFail($id);
        $myProduct->delete();

        return redirect()->back()->with(['success' => 'The Message']);
    }

    public function addNewBookCreate()
    {

        $categories = ProductType::all();
        $authors    = Author::all();
        $languages = Language::all();
        $publishers = Publisher::all();

        return view('createOrUpdateBook', compact('authors', 'categories', 'languages', 'publishers'));
    }

    public function addNewBook(Request $request)
    {
        $book = new Product;
        $book->name = $request->name;
        $book->description = $request->description;
        $book->price = $request->price;
        $book->product_type_id  = $request->product_type_id;
        $book->language_id  = $request->language_id ;
        $book->author_id  = $request->author_id ;
        $book->publisher_id  = $request->publisher_id ;
        $book->nr_pages = $request->nr_pages;
        $book->user_id  = Auth::user()->id;
        $book->amount = $request->amount;
        $storagePath    = Storage::disk('userImage')->put('products/',  $request->file('image'));
        $book->image = 'products/' . basename($storagePath);
        $book->save();

        $products = Product::where('user_id', Auth::user()->id)->paginate(10);

        return redirect()->route('myProducts')->with(['success' => 'The Message', 'products' => $products]);
    }

}
