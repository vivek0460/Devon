<template>
	<div class="container">
		<!-- <h1>{{ $route.name }} Page Component</h1> -->

		<div class="row">
			<div class="col-sm-3 filter">
				<section>
					<br><br><br>
					<!-- Section: Filters -->
					<section id="filters" data-auto-filter="true">
						 
						<!-- Section: Category -->
						<section class="mb-4" data-filter="condition">
							<h6 class="font-weight-bold mb-3">Category</h6>

							<div class="form-check mb-3" v-for="cat in filters.categories" key="cat.id">
								<input @change="hasChanged(event, cat)" class="form-check-input" type="checkbox" :id="'lin'+cat.id" :value="cat.id" autocompleted="">
								<label class="form-check-label text-uppercase small text-muted" :for="'lin'+cat.id">
									{{cat.name}}
								</label>
							</div>
 
						</section> 
					 
						<section class="mb-4">
							<h6 class="font-weight-bold mb-3">Price</h6>
 
  							<div class="slidderbox">

 <fieldset
    style="border: 0;"> 
    <MultiRangeSlider
      baseClassName="multi-range-slider-bar-only"
      :minValue="filterParams.price_min"
      :maxValue="filterParams.price_max"
      :max="filters.price_max"
      :min="filters.price_min"
      :step="5"
      :rangeMargin="0"
      @change="update_oBarValues"
    />

        <div
      style="display: flex;
    height: 40px;
    justify-content: space-between;
    text-align: center;
    font-size: 14px;"
    >
      <span
        style="
          display: inline-block;
    padding: 5px;
    border: 1px solid;
    border-radius: 5px;
    width: 70px;
    margin: 3px;
        "
        >{{ filterParams.price_min }}</span
      > 
      <span
        style="
             display: inline-block;
    padding: 5px;
    border: 1px solid;
    border-radius: 5px;
    width: 70px;
    margin: 3px;
        "
        >{{ filterParams.price_max }}</span
      >
    </div>

  </fieldset>
 
  							</div>
 
						</section>
						<!-- Section: Price -->

						<!-- Section: Size -->
						<section class="mb-4" data-filter="size">
							 
							<div class="form-check mb-3">
								<input @change="hasChanged(event, '')" class="form-check-input" v-model="filterParams.available" type="checkbox" value="34" id="price-checkbox">
								<label class="form-check-label text-uppercase small text-muted" for="price-checkbox">
									Show Only Available
								</label>
							</div> 
						</section>
						<!-- Section: Size --> 
					</section>
					<!-- Section: Filters -->
				</section>
			</div>
			<div class="col-sm-9 products"> 
				<section style="background-color: #eee;">
					<div class="container py-5">
						<div class="row justify-content-center mb-3" v-for="product in products" key="product.id">
							<div class="col-md-12 col-xl-10" @click="redirectToDetail(product.id)">
								<div class="card shadow-0 border rounded-3">
									<div class="card-body">
										<div class="row">
											<div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
												<div class="bg-image rounded ripple-surface">
													<img :src="product.images[0].image"
													class="w-100" />
													<div class="hover-overlay">
														<div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
													</div>
												</div>
											</div>
											<div class="col-md-6 col-lg-6 col-xl-6">
												<h5>{{product.name}}</h5>
												<i style="font-size:12px">
													{{product.category.name}}
												</i>
												<div class="d-flex flex-row">
													<div class="text-danger mb-1 me-2">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
													<span>310</span>
												</div>
											<!-- 	<div class="mt-1 mb-0 text-muted small">
													<span>100% cotton</span>
													<span class="text-primary"> • </span>
													<span>Light weight</span>
													<span class="text-primary"> • </span>
													<span>Best finish<br /></span>
												</div>  -->
												<p class="text-truncate mb-4 mb-md-0">
													{{ product.detail }}
												</p>
											</div>
											<div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
												<div class="d-flex flex-row align-items-center mb-1">
													<h4 class="mb-1 me-1">${{ product.price - ((product.discount_percent/100) * product.price) }}</h4>
													<span class="text-danger"><s>${{ product.price }}</s></span>
												</div>
												<h6 class="text-success">Free shipping</h6>
												<div class="d-flex flex-column mt-4">
													<button class="btn btn-primary btn-sm" type="button">Details</button>
												 
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
 
					</div>
				</section>
			</div> 
		</div>

	</div>
</template>
<script>
import { reactive, ref } from 'vue'
 
import RangeSlider from 'vue-range-slider' 
import 'vue-range-slider/dist/vue-range-slider.css'
import MultiRangeSlider from "multi-range-slider-vue";

import "multi-range-slider-vue/MultiRangeSliderBlack.css";
import "multi-range-slider-vue/MultiRangeSliderBarOnly.css";

export default {

	data() {
		return {
			// Our data object that holds the Laravel paginator data
			products: ref({}),
			client_id: null,
			filters: {
				price_min: 0,
				price_max: 1
			},
			sliderValue: 50,
			filterParams: {
				available: false,
				category: null,
				categories: [],
				category_ids: '',
				price_min: 0,
				price_max: 1
			},
      oBarMinValue: 10,
      oBarMaxValue: 90,
		}
	},

	components: {
	    MultiRangeSlider
	},

	mounted() {
		// Fetch initial results 
		this.getFilters();

		if(localStorage.getItem('devon_client')) {
			this.client_id = localStorage.getItem('devon_client');
		} else {
			this.client_id = this.createUUID();
			localStorage.setItem('devon_client', this.client_id);
		}

	},

	methods: {
		// Our method to GET results from a Laravel endpoint
		getResults(filterParams) {

			let url = 'http://devon.localhost/api/v1/products';
			url += '?available='+filterParams.available; 
			url += '&min_price='+filterParams.price_min+'&max_price='+filterParams.price_max;

			if(filterParams.category_ids) {
				url += '&category_ids='+filterParams.category_ids;			
			}

			this.axios.get(url)
				.then(response => {
					this.products = response.data; 
				});
		},

		getFilters() {
			this.axios.get('http://devon.localhost/api/v1/products/filters')
				.then(response => {
					this.filters = response.data; 
					this.filterParams.price_min = this.filters.price_min; 
					this.filterParams.price_max = this.filters.price_max; 

					this.getResults(this.filterParams);
				});
		},

		hasChanged(event, data) {
			if(data) { 

				let id = data.id;

				if(this.filterParams.categories.indexOf(id) >= 0) {
					this.filterParams.categories.splice(this.filterParams.categories.indexOf(id), 1);
				} else {
					this.filterParams.categories.push(id);
				}

				if(this.filterParams.categories.length > 0) {
					this.filterParams.category_ids = this.filterParams.categories.toString();
				} else {
					this.filterParams.category_ids = '';
				}
			}

				this.getResults(this.filterParams); 
	  	},

	  	update_oBarValues(e) {  
	      this.filterParams.price_min = e.minValue;
	      this.filterParams.price_max = e.maxValue;

	      this.getResults(this.filterParams); 

	    },

	    redirectToDetail(id) {
	    	this.$router.push({ name: 'ProductDetail', params: { id: id }});
	    },

	    createUUID() {
		    // http://www.ietf.org/rfc/rfc4122.txt
		    var s = [];
		    var hexDigits = "0123456789abcdef";
		    for (var i = 0; i < 36; i++) {
		        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
		    }
		    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
		    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
		    s[8] = s[13] = s[18] = s[23] = "-";

		    var uuid = s.join("");
		    return uuid;
			}
	}

} 
</script>
<style>
.rating {
	padding: 0;
	margin: 0;
}

.rating li {
	float: left;
	margin: 0 10px;
}

.slidderbox {
	position: relative;
}

.sleft {
	    position: absolute;
    left: 0;
    top: 16px;
    font-size: 14px;
    font-weight: 300;
    font-style: italic;
}

.sright {
	    position: absolute;
    right: 0;
    top: 16px;
    font-size: 14px;
    font-weight: 300;
    font-style: italic;
}


</style> 
