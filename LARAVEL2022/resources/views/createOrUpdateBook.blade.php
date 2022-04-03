@extends('app')
@section('title', 'Add new book')
@section('content')

@include('components.header-other')


<form action="add-book-post" method="POST" enctype="multipart/form-data">
    @csrf 
<div class="row">
    <div class="col-md-4 text-center">
        <div class="row">
            <div class="col-md-12">
                <img src="https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg" 
                    id="liveImage" alt="" class="border" style="height: 260px; width: 300px;object-fit: cover; border-radius: 5%">
            </div>
            <div class="col-md-8 text-center mx-auto">
            <div class="mt-3">
                    <label for="image" class="form-label">Product image</label>
                    <input type="file" class="form-control" id="image" name="image">
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8 mb-5">
    @include('components.success')

        <div class="card">
            <div class="card-body">
                <div class="mt-3">
                    <label for="name" class="form-label">Product name:</label>
                    <input type="text" class="form-control" id="name" name="name" >
                </div>

                <div class="mt-3">
                        <label for="email" class="form-label">Description:</label>
                        <textarea class="form-control" id="description" name="description" > </textarea>
                </div>

                <div class="mt-3">
                        <label for="price" class="form-label">Price:</label>
                        <input type="number" class="form-control" id="price" name="price">
                </div>
                <div class="mt-3">
                      <div class="row">
                          <div class="col-md-6">
                            <label for="nr_pages" class="form-label">Number of pages:</label>
                            <input type="number" class="form-control" id="nr_pages" name="nr_pages">
                          </div>
                          <div class="col-md-6">
                            <label for="amount" class="form-label">Amount:</label>
                            <input type="number" class="form-control" id="amount" name="amount">
                          </div>
                      </div>
                </div>
                <div class="mt-3">
                  
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="product_type_id" class="form-label">Category:</label>
                                    <select name="product_type_id" id="product_type_id" class="form-control">
                                        @foreach($categories as $item)
                                            <option value="{{$item->id}}">{{$item->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="author_id" class="form-label">Author:</label>
                                    <select name="author_id" id="author_id" class="form-control">
                                        @foreach($authors as $author)
                                            <option value="{{$author->id}}">{{$author->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                       
                </div>
                <div class="mt-3">
                   <div class="row">
                       <div class="col-md-6">
                        <label for="language_id" class="form-label">Language:</label>
                            <select name="language_id" id="language_id" class="form-control">
                                    @foreach($languages as $language)
                                            <option value="{{$language->id}}">{{$language->name}}</option>
                                        @endforeach
                            </select>
                       </div>
                       <div class="col-md-6">
                        <label for="publisher_id " class="form-label">Publisher:</label>
                            <select name="publisher_id" id="publisher_id" class="form-control">
                                        @foreach($publishers as $item)
                                            <option value="{{$item->id}}">{{$item->name}}</option>
                                        @endforeach
                            </select>
                       </div>
                   </div>
                </div>
                
            </div>
        </div>
        <div class="mt-3">
                    <button class="btn btn-primary" type="submit">Add new book</button>
                </div>
    </div>
</div>
</form>


<script>
    image.onchange = evt => {
  const [file] = image.files
  if (file) {
    liveImage.src = URL.createObjectURL(file)
  }
}
</script>



@endsection