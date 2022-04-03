@extends('app')
@section('title', 'Cart')
@section('content')

@include('components.header-other')

@include('components.success')

@if(session('cart') != null)
    
    @if(count(session('cart')) > 0)

<table class="table table-sm table-bordered" id="myCart">

<thead>
    <tr>
        <th></th>
        <th>Produs</th>
        <th>Buc.</th>
        <th style="width: 120px">Preț</th>
        <th style="width: 120px">Total</th>
        <th style="width: 40px"></th>
    </tr>
</thead>
@foreach($products as $key => $item)

        <tr>
            <td style="width: 2%">
                <img src="{{$item["image"]}}" alt="" style="height: 100px">
            </td>
            <td>
                
                {{$item->name}}
            </td>
            <td>
                <select name="" id="amount{{$item->id}}" class="form-control">
                    @for($i = 1; $i <= $item->amount; $i++)
                        <option value="{{$i}}">{{$i}}</option>
                    @endfor
                </select>
            </td>
            <td>
                <span id="price{{$item->id}}">{{$item["price"]}}</span> RON
            </td>
            <td>
                <span id="total{{$item->id}}">0</span> RON
            </td>
            <td>
                <a href="/remove-cart/{{$item['id']}}" class="ms-2">
                    <i class="fa fa-trash"></i>
                </a>
            </td>
        </tr>

@endforeach
<tr>
    <td colspan="3"></td>
    <td>
        <b>Total:</b>
    </td>
    <td> 
        <b> <span id="totalTable"> {{$total}}</span> RON</b>
    </td>
    <td></td>
</tr>
</table>

<div class="row ">

<div class="text-end">
<button class="btn btn-primary">Continuă la date de livrare</button>

<a href="/removeAllItemsFromCart">
    <button class="btn btn-primary">Remove all items</button>
</a>
</div>

</div>

@endif

@else 

<p>
    The cart is empty.
</p>

@endif

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$('select').on('change', function() {
    idItem = this.id;
    nrOfItems     = document.getElementById(idItem).value;
    pricePerPiece = document.getElementById(idItem.replace("amount", "price")).innerText;
    total = Number(nrOfItems) * Number(pricePerPiece);
    document.getElementById(idItem.replace("amount", "total")).innerHTML= total;

    calculateTotal();
});

function calculateTotal()
{
    var myTab       = document.getElementById('myCart');
    var tableData   = [];
    totalTableValue = 0;

    for (i = 1; i < myTab.rows.length -1; i++) {
        var objCells = myTab.rows.item(i).cells;
        totalTableValue = totalTableValue + parseInt(objCells.item(4).innerText.replace("RON", ""));
    }
    document.getElementById("totalTable").innerHTML = totalTableValue;
}
</script>

@endsection