@extends('app')
@section('title', 'My products')
@section('content')

@include('components.header-other')

<div class="row mb-5">
    <div class="col-md-12">
        @include('components.success')

        <div class="card">
                <div class="card-body mb-0 pb-0">
                    <div class="row mb-0 pb-0">
                    @foreach($products as $product)
                    <div class="col-md-2 mt-2 col-xs-2 col-3">
                            <img src="{{$product->image}}" alt="" style="height: 150px; width: 150px;object-fit: cover; border-radius: 5%">
                    </div>
                    <div class="col-md-10 col-xs-10 col-9">
                        <div class="row">
                                    <div class="col-md-12">
                                        <h5>{{$product->name}}</h4>
                                        <table>
                                            <tr>
                                                <td >
                                                    <b>Publish date:</b>
                                                </td>
                                                <td>
                                                    {{$product->created_at}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Category:</b>
                                                </td>
                                                <td>
                                                    {{$product->type->name}}
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-md-12">
                                        <hr style="padding-bottom: 0">
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <form action="{{ route('deleteMyProduct', ['id' => $product->id]) }}" method="POST" 
                                        onSubmit="return confirm('Sunteți sigur că doriți să ștergeți pagina ?')">
                        <a class="btn btn-default btn-sm border border-dark" id="edit-item" href="{{ route('deleteMyProduct',$product->id) }}" data-item-id="{{$product->id}}">
                            <i class="far fa-edit"></i> Editeaza</a>
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-danger btn-sm border" type="submit" ><i class="fas fa-trash-alt"></i> Sterge</button>
                    </form>
                                    </div>
                                </div>
                    </div>
                    <hr>
                    @endforeach
                </div>
            </div>
   
        </div>
    </div>
</div>

{{$products->links()}}


@endsection