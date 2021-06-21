var express = require("express");
const OrderController = require("../controllers/OrderController");
const ProductController = require("../controllers/ProductController");
const UserController = require("../controllers/UserController");
var router = express.Router();

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

//users
router.post("/signup", UserController.Signup);
router.post("/signin", UserController.Signin);
router.post("/adduserdetails", UserController.AddUserDetails);

//products
router.post("/addproduct", ProductController.AddProduct);
router.get("/getproducts/:vendorid?", ProductController.GetProducts);

//orders
router.post("/addtocart", OrderController.AddToCart);
router.get(
  "/removefromcart/:customerid/:productid?",
  OrderController.RemoveFromCart
);

module.exports = router;
