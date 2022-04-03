<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;


    public function author()
    {
        return $this->hasOne(Author::class, 'id', 'author_id');
    }


    public function publisher()
    {
        return $this->hasOne(Publisher::class, 'id', 'publisher_id');
    }

    public function language()
    {
        return $this->hasOne(Language::class, 'id', 'language_id');
    }

    public function type()
    {
        return $this->hasOne(ProductType::class, 'id', 'product_type_id');
    }

    public function seller()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function status()
    {
        return $this->hasOne(ProductStatus::class, 'id', 'status_id');
    }
}
