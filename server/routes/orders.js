const express = require("express");
const orderRouter = express.Router();
const auth = require("../middleware/user");
const admin = require("../middleware/admin");
const Order = require("../model/order");
const Product = require("../model/productModel");

//checkout order
orderRouter.post("/checkout", auth, async (req, res) => {
  try {
    const { userdata, paymentMethod, orderItems, totalPrice } = req.body;
    let newOrder = new Order({
      userdata,
      paymentMethod,
      orderItems,
      orderStatus,
      totalPrice,
      userId: req.userId,
    });
    await newOrder.save();
    res.json({ msg: " Order placed succesfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// list of orders
orderRouter.get("/admin/getOrder", admin, async (req, res) => {
  try {
    const adminId = req.userId;
    const adminProducts = await Product.find({ adminId }).select("_id");
    const productIds = adminProducts.map((product) => product._id);
    const orders = await Order.find({
      "orderItems.productId": { $in: productIds },
    }).populate("orderItems.productId");
    res.status(200).json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//change order status
orderRouter.get("/admin/changeStatus", admin, async (req, res) => {
    try {
        
    } catch (e) {
        res.status(500).json({error: e.message})
    }
})

module.exports = orderRouter;
