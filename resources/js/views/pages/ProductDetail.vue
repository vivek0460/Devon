<template>
	<header>
		<!-- Heading -->
		<div class="bg-primary">
			<div class="container py-4">
				<!-- Breadcrumb -->
				<nav class="d-flex">
					<h6 class="mb-0">
						<a href="/" class="text-white-50">Products</a>
						<span class="text-white-50 mx-2"> > </span>
						<a href="" class="text-white">Details</a> 
					</h6>
				</nav>
				<!-- Breadcrumb -->
			</div>
		</div>
		<!-- Heading -->
	</header>

	<!-- content -->
	<section class="py-5" v-if="productData.name">
		<div class="container">
			<div class="row gx-5">
				<aside class="col-lg-6" v-if="productData.images && productData.images.length > 0">
					<div class="border rounded-4 mb-3 d-flex justify-content-center"> 
						<img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" :src="productData.images[0].image" /> 
					</div> 

				</aside>
				<main class="col-lg-6">
					<div class="ps-lg-3">
						<h4 class="title text-dark">
							{{productData.name}}
						</h4>
						<div class="d-flex flex-row my-3">
							  <star-rating :star-size="20" :increment="0.5" :show-rating="false" v-model:rating="productData.totalrating" :read-only="true"></star-rating> 
							<span class="text-success ms-2">{{productData.category.name}}</span>
						</div>

						<div class="mb-3">
							<span class="h5">${{ productData.price - ((productData.discount_percent/100) * productData.price) }}</span> 
						</div>

						<p>
							{{productData.detail}}
						</p> 

						<hr />

						<div class="row mb-4">
							<div class="col-md-4 col-6">
								<label class="mb-2">Size</label>
								<select class="form-select border border-secondary" style="height: 35px;">
									<option>Small</option>
									<option>Medium</option>
									<option>Large</option>
								</select>
							</div>
							<!-- col.// -->
							<div class="col-md-4 col-6 mb-3">
								<label class="mb-2 d-block">Quantity</label>
								<div class="input-group mb-3" style="width: 170px;">
									<button class="btn btn-white border border-secondary px-3" type="button" id="button-addon1" data-mdb-ripple-color="dark">
										<i class="fas fa-minus"></i>
									</button>
									<input type="text" class="form-control text-center border border-secondary" placeholder="14" aria-label="Example text with button addon" aria-describedby="button-addon1" />
									<button class="btn btn-white border border-secondary px-3" type="button" id="button-addon2" data-mdb-ripple-color="dark">
										<i class="fas fa-plus"></i>
									</button>
								</div>
							</div>
						</div>
						<a href="#" class="btn btn-warning shadow-0"> Buy now </a>&nbsp;&nbsp;&nbsp;
						<a href="#" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to cart </a> 
					</div>
				</main>
			</div>
		</div>
	</section>
	<!-- content -->

	<section class="bg-light border-top py-4">
		<div class="container">
			<div class="row gx-4">
				<div class="col-lg-8 mb-4">
					<div class="border rounded-2 px-3 py-2 bg-white">
						<!-- Pills navs -->
						<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
							<li class="nav-item d-flex" role="presentation">
								<a class="nav-link d-flex align-items-center justify-content-center w-100 active" id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab" aria-controls="ex1-pills-1" aria-selected="true">Write Review</a>
							</li>
							<li class="nav-item d-flex" role="presentation">
								<a class="nav-link d-flex align-items-center justify-content-center w-100" id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2" role="tab" aria-controls="ex1-pills-2" aria-selected="false">Reviews</a>
							</li> 
						</ul>
						<!-- Pills navs -->

						<!-- Pills content -->
						<div class="tab-content" id="ex1-content">
							<div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel" aria-labelledby="ex1-tab-1">

								<div class="row" id="post-review-box" >
									<div class="col-md-12">
										<form accept-charset="UTF-8" action="" method="post">
											<input id="ratings-hidden" name="rating" type="hidden"> 
											<textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5" v-model="reviewData.review"></textarea>
<br>
											<div class="row" id="post-review-box" >
												<div class="col-md-6">
													 
														<star-rating :star-size="30" :show-rating="false" v-model:rating="reviewData.rating"></star-rating>
  												 
													
												</div>
												<div class="col-md-6">
													<div class="text-right"> 

														<button class="btn btn-success btn-lg" type="button" @click="submitReview">Save</button>
													</div>
												</div>
											</div>


										</form>
									</div>
								</div>
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
								<div class="col-sm-12 products"> 
									<section style="background-color: #eee;">
										<div class="container py-5">
											<div class="row justify-content-center mb-3" v-for="review in productData.reviews" key="review.id">
												<div class="col-md-12 col-xl-10">
													<div class="card shadow-0 border rounded-3">
														<div class="card-body">
															<div class="row">
																<div class="col-md-12 col-lg-2 col-xl-2 mb-4 mb-lg-0">
																	<div class="bg-image rounded ripple-surface">
																		<img style="width: 60%" src="https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-PNG-Pic.png"
																		class="" />
																		<div class="hover-overlay">
																			<div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
																		</div>
																	</div>
																</div>
																<div class="col-md-6 col-lg-6 col-xl-6"> 
																	<div class="d-flex flex-row">
																		<star-rating :inline="true" :star-size="20" :show-rating="false" :read-only="true" v-model:rating="review.rating"></star-rating> 
																	</div>
																 
																	<p class="text-truncate mb-4 mb-md-0">
																		{{ review.review }}
																	</p>
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
						<!-- Pills content -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="px-0 border rounded-2 shadow-0">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Similar items</h5>
								<div @click="redirectToDetail(product.id)" class="d-flex mb-3" v-for="product in similarItems" key="product.id"> 
									<img v-if="product.images[0]" :src="product.images[0].image" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" /> 
									<div class="info">
										<a href="#" class="nav-link mb-1">
											{{product.name}}
										</a>
										<strong class="text-dark"> ${{ product.price - ((product.discount_percent/100) * product.price) }}</strong>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</template>
<script>
import { reactive, ref } from 'vue'
import StarRating from 'vue-star-rating' 

export default {

	data() {
		return {
			product_id: null,
			productData: {},
			similarItems: [],
			client_id: null,
			reviewData: {
				product_id: null,
				rating: 4,
				review: '',
				client_id: ''
			}
		}
	},

	components: {
		StarRating
	},

	mounted() {

		this.client_id = localStorage.getItem('devon_client');

		if(!this.client_id) {
			this.client_id = this.createUUID();
			localStorage.setItem('devon_client', this.client_id);
		}

		this.product_id = this.$route.params.id;  
		this.getResults(this.product_id);
	},

	methods: {

		getResults(product_id) {

			let url = 'http://devon.localhost/api/v1/products/'+product_id; 

			this.axios.get(url)
			.then(response => {
				this.productData = response.data; 
				this.reviewData.product_id = this.productData.id;
				this.reviewData.client_id = this.client_id;
				this.getSimilarItems(this.productData.category_id);
			});
		},

		getSimilarItems(category_id) {
			let url = 'http://devon.localhost/api/v1/products/similar-items?category_id='+category_id; 

			this.axios.get(url)
			.then(response => {
				this.similarItems = response.data;  
			});
		},

		submitReview() {
			let url = 'http://devon.localhost/api/v1/review/submit-review'; 

			this.axios.post(url, this.reviewData)
			.then(response => {

				this.reviewData.review = '';
				this.reviewData.rating = 4; 

				this.getResults(this.reviewData.product_id);
			});
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
.custom-text {
  font-weight: bold;
  font-size: 1.9em;
  border: 1px solid #cfcfcf;
  padding-left: 10px;
  padding-right: 10px;
  border-radius: 5px;
  color: #999;
  background: #fff;
}
</style>