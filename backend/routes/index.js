var express = require("express");
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

module.exports = router;
