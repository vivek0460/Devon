<template>
	<Header></Header>
	<div class="mainsec">
		<router-view></router-view>
	</div>
	<Footer></Footer>
</template>

<script>
	import Header from "./Header";
	import Footer from "./Footer";
	export default {
		components: { Header, Footer },
	};
</script>

<style lang="css">
	/* GLOBAL STYLES */
	body {
		font-family: system-ui;
	}
	.container{
		max-width: 1400px;
	}
	a,
	a:hover {
		text-decoration: none;
	}
	ul {
		list-style: none;
	}
	/* CUSTOM STYLES */
	header {
		    background: #fff;
    border-bottom: 1px solid #ddd;
    color: #252525;
	}

	header h1.brand a {
		font-size: 20pt;
		color: #252525;
	}
	header ul {
		display: flex;
		margin: 0;
	}
	header ul li a {
		background: #292929;
		color: white;
		padding: 10px 20px;
		margin: 0px 10px;
	}
	header ul li a:hover,
	header ul li a.router-link-exact-active {
		color: white;
		border-bottom: 2px solid;
	}

	footer {
		background: #d8d8d8;
		position: absolute;
		bottom: 0;
		width: 100%;
	}

	.main {
		display: flex;
		height: 500px;
		align-items: center;
	}

	footer p {
		margin: 0;
		padding: 10px;
		text-align: center;
	}
	footer span {
		color: red;
	}
</style>
