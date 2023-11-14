<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProductTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_product_listing()
    {
        $response = $this->get('/api/v1/products?available=false&min_price=21238&max_price=47365');

        $response->assertStatus(200);
    }

    public function test_product_listing_with_category()
    {
        $response = $this->get('/api/v1/products?available=false&min_price=21238&max_price=47365&category_ids=2,1');

        $response->assertStatus(200);
    }

    public function test_product_filters()
    {
        $response = $this->get('/api/v1/products/filters');

        $response->assertStatus(200);
    }

    public function test_product_details()
    {
        $response = $this->get('/api/v1/products/2');

        $response->assertStatus(200);
    } 

    public function test_product_similar_products() {
        
        $response = $this->get('/api/v1/products/similar-items?category_id=2');

        $response->assertStatus(200);
    }
}
