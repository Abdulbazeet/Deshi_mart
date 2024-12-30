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

module.exports = productRouter;
