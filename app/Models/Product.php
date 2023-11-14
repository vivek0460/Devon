<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model {
    use HasFactory;

    protected $fillable = ['name', 'detail', 'price', 'discount_percent', 'category_id'];

    public function images() {
        return $this->hasMany('App\Models\ProductImage');
    }

    public function reviews() {
        return $this->hasMany('App\Models\ProductReview');
    }

    public function category() {
        return $this->belongsTo('App\Models\Category');
    }
}