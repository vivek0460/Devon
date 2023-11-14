<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Category;
use App\Http\Requests\ValidateReviewRequest;

class ProductController extends Controller {
    public function index(Request $request) {
        $products = Product::with(['images', 'reviews', 'category']);

        if(isset($request->available) && $request->available == 'true') {
            $products = $products->where('available', 1);
        }

        if(isset($request->min_price) && isset($request->max_price)) {
            $products = $products->where('price', '>=', $request->min_price)
                            ->where('price', '<=', $request->max_price);
        }

        if(isset($request->category_ids) && !empty($request->category_ids)) {
            $products = $products->where('category_id', explode(',', $request->category_ids));
        }

        $products = $products->get();
        
        return response()->json($products);
    }

    public function store(Request $request) {
        $product = new Product(['name' => $request->input('name'), 'detail' => $request->input('detail') ]);
        $product->save();
        return response()->json('Product created!');
    }

    public function show($id) {
        $product = Product::with(['images', 'reviews', 'category'])->find($id);

        if(count($product->reviews) > 0) {

            $totalrating = collect($product->reviews)->pluck('rating')->toArray();
            $product->totalrating = array_sum($totalrating)/count($product->reviews); 
        }

        return response()->json($product);
    }

    public function update($id, Request $request) {
        $product = Product::find($id);
        $product->update($request->all());
        return response()->json('Product updated!');
    }
    
    public function destroy($id) {
        $product = Product::find($id);
        $product->delete();
        return response()->json('Product deleted!');
    }

    public function getFilter() { 
        $data['price_min'] = Product::min('price');
        $data['price_max'] = Product::max('price');
        $data['categories'] = Category::get(['id', 'name']);

        return response()->json($data);
    }

    public function similarItems(Request $request) {

        $category_id = $request->category_id;

        $products = Product::with(['images', 'reviews'])->where('category_id', $category_id);
        $products = $products->get();
        
        return response()->json($products);

    }

    public function submitReview(ValidateReviewRequest $request) {
  
        $productreview = ProductReview::where('client_id', $request->client_id)
                            ->where('product_id', $request->product_id)->first();

        if(!empty($productreview)) {

            $productreview->rating = $request->input('rating');
            $productreview->review = $request->input('review');
                  
        } else {
             $productreview = new ProductReview(
                [
                    'product_id' => $request->input('product_id'), 
                    'client_id' => $request->input('client_id'),
                    'rating' => $request->input('rating'),
                    'review' => $request->input('review')
                ]
            ); 
        }

        $productreview->save();

        return response()->json('Product review submitted!');
    }
}