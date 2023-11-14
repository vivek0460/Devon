<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Providers\RouteServiceProvider;

class SubmitReviewTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
 
    public function test_submit_review_for_product()
    { 
        $response = $this->post('/api/v1/review/submit-review', [
            'client_id' => '5786ce1a-706a-44c4-8567-8ae13ae71983',
            'product_id' => 3,
            'rating' => 5,
            'review' => 'This is test review',
        ]);
  
        $response->assertStatus(200);
    }
}
