const express = require("express");
const productRouter = express.Router();
const productModel = require("../model/productModel");
const admin = require("../middleware/admin");
const auth = require("../middleware/user");

//create product
productRouter.post("/admin/post_product", admin, async (req, res) => {
  try {
    const { name, image, description, price, quantity, brand, category } =
      req.body;
    let product = new productModel({
      name,
      image,
      description,
      price,
      quantity,
      brand,
      category,
      adminId: req.userId,
    });
    await product.save();
    res.json({ product });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all product of an admin
productRouter.get("/admin/get_all_product", admin, async (req, res) => {
  try {
    const allAdminProduct = await productModel.find();
    const adminProducts = allAdminProduct.filter((products) => {
      return products.adminId === req.userId;
    });

    res.status(200).json(adminProducts);
    // const adminProducts = [];

    //   for (let i = 0; i < allAdminProduct.length; i++){
    //     if (allAdminProduct[i].adminId == req.userId) {
    //      adminProducts.push(allAdminProduct[i])
    //     }
    //   }
    //   res.status(200).json({adminProducts})
    // //  if(!adminProduct)
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all products
productRouter.get("/get_all_product", auth, async (req, res) => {
  try {
    const allAdminProduct = await productModel.find();

    res.status(200).json(allAdminProduct);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get best selling products
//

module.exports = productRouter;
