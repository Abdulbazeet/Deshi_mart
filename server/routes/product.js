const express = require("express");
const productRouter = express.Router();
const productModel = require("../model/productModel");
const admin = require("../middleware/admin");
const auth = require("../middleware/user");

//create product
productRouter.post("/admin/post_product", admin, async (req, res) => {
  try {
    const {
      name,
      image,
      description,
      price,
      stock,
      brand,
      category,
      salesCount,
      discount,
    } = req.body;

    let product = new productModel({
      name,
      image,
      description,
      price,
      stock,
      brand,
      category,
      salesCount,
      adminId: req.userId,
      discount: {
        percentage: discount?.percentage || 0, // Default to 0 if no discount
        startDate: discount?.startDate || null,
        endDate: discount?.endDate || null,
      },
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
productRouter.get("/get_best_selling", auth, async (req, res) => {
  try {
    const best_selling = await productModel
      .find()
      .sort({ salesCount: -1 })
      .limit(15);
    res.status(200).json(best_selling);
  } catch (e) {
    res.status(500).json({ errorr: e.message });
  }
});

//get exclusive offers
productRouter.get("/exclusive_offers", auth, async (req, res) => {
  try {
    const exclusive_offers = await productModel;
    const currendDate = new Date()
      .find({
        "discount.percentage": { $gt: 0 },
        $and: [
          { "discount.startDate": { $lte: currendDate } }, // Discount started
          { "discount.endDate": { $gte: currendDate } }, // Discount not expired
        ],
      })
      .sort({ "discount.percentage": -1 });
    res.json(exclusive_offers);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// delete product
productRouter.delete(
  "/admin/delete_product/:product_id",
  admin,
  async (req, res) => {
    try {
      const { product_id } = req.params;
      if (!product_id) res.status(400).json({ msg: "product_id is required" });
      const adminProducts = await productModel.findById(product_id);
      if (!adminProducts)
        res.status(400).json({ msg: "Product with id doesn't exist" });
      if (!(adminProducts.adminId == req.userId))
        res
          .status(400)
          .json({ msg: "You are not authorized to delete this product" });
      const product = await productModel.findByIdAndDelete(product_id);

      res.status(200).json({ msg: "Product successfully deleted" });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  }
);

//update product
productRouter.put(
  "/admin/update_product/: product_id",
  admin,
  async (req, res) => {
    try {
      const { product_id } = req.params;

      const {
        name,
        image,
        description,
        price,
        stock,
        brand,
        category,
        salesCount,
        discount,
      } = req.body;

      const product = await productModel.findById(product_id);
      if (!product) res.status(400).json({ msg: "Product doesn not exist" });
      if (!(product.adminId == req.userId))
        res
          .status(400)
          .json({ msg: "You are not authorized to update product" });
      let update = {
        name,
        image,
        description,
        price,
        stock,
        brand,
        category,
        salesCount,
        discount,
      };
      const updated_product = await productModel.findByIdAndUpdate(
        product_id,
        update,
        { new: true }
      );
      res.json({ msg: "Product Successfully updated" });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  }
);
module.exports = productRouter;
