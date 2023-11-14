// Page Components
import Home from "./views/pages/Home"; 
import ProductDetail from "./views/pages/ProductDetail"; 

export default [
    { path: "/", component: Home, name: 'Home' },
    { path: "/product/:id", component: ProductDetail, name: 'ProductDetail' }
];
