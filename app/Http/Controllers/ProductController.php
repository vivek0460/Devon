<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Category;
use App\Http\Requests\ValidateReviewRequest;

class ProductController extends Controller {
 
    /**
     * @OA\Get(
     *     path="/api/v1/products",
     *     summary="get product listing with filter feature",
     *     @OA\Response(response="200", description="Success"),
     *     security={{"bearerAuth":{}}}
     * )
     */
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
  
    /**
     * @OA\Get(
     *     path="/api/v1/products/1",
     *     summary="get product details",
     *     @OA\Response(response="200", description="Success"),
     *     security={{"bearerAuth":{}}}
     * )
     */
    public function show($id) {
        $product = Product::with(['images', 'reviews', 'category'])->find($id);

        if($product && count($product->reviews) > 0) {

            $totalrating = collect($product->reviews)->pluck('rating')->toArray();
            $product->totalrating = array_sum($totalrating)/count($product->reviews); 
        }

        return response()->json($product);
    }

    /**
     * @OA\Get(
     *     path="/api/v1/products/filters",
     *     summary="get product filters details",
     *     @OA\Response(response="200", description="Success"),
     *     security={{"bearerAuth":{}}}
     * )
     */
    public function getFilter() { 
        $data['price_min'] = Product::min('price');
        $data['price_max'] = Product::max('price');
        $data['categories'] = Category::get(['id', 'name']);

        return response()->json($data);
    }

    /**
     * @OA\Get(
     *     path="/api/v1/products/similar-items?product_id=2",
     *     summary="get product similar products",
     *     @OA\Response(response="200", description="Success"),
     *     security={{"bearerAuth":{}}}
     * )
     */
    public function similarItems(Request $request) {

        $category_id = $request->category_id;

        $products = Product::with(['images', 'reviews'])->where('category_id', $category_id);
        $products = $products->get();
        
        return response()->json($products); 
    }

    /**
     * @OA\Post(
     *     path="/api/v1/review/submit-review",
     *     summary="Submit review for product",
     *     @OA\Parameter(
     *         name="client_id",
     *         in="query",
     *         description="User unique ID",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="product_id",
     *         in="query",
     *         description="Review for product",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Parameter(
     *         name="rating",
     *         in="query",
     *         description="Rating value from 1 to 5",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Parameter(
     *         name="review",
     *         in="query",
     *         description="Review",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(response="201", description="Review added"),
     *     @OA\Response(response="422", description="Validation errors")
     * )
     */
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