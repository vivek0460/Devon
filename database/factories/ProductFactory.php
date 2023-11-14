<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $products = [
            'OnePlus XE',
            'iPhone 11',
            'iPhone 12',
            'iPhone 13',
            'iPhone 14',
            'iPhone 15',
            'Samsumg 12',
            'Samsumg 32',
            'Samsumg 21',
            'Samsumg 52',
            'Samsumg 70',
            'Samsumg 71',
            'Samsumg Note 12',
            'Samsumg  Ultra 23',
            'Realme 11',
            'Lenovo Ideabook',
            'Nilkamal Sofa',
            'HP Inkjet Printer',
            'Jockey TShirt',
            'OnePlus 10T'
        ];

        return [
            'name' => $this->faker->randomElement($products),
            'price' => $this->faker->numberBetween(20000, 50000),
            'discount_percent' => $this->faker->randomElement([10,20,30,40,50]),
            'detail' => $this->faker->text,
            'category_id' => $this->faker->randomElement([1,2,3,4,5]),
        ];
    }
}
