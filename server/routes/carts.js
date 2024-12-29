const express = require("express");
const cartRouter = exxpress.Router();
const auth = require("../middleware/user");
const Cart = require("../model/cart");

//add to cart
cartRouter.post("/add_to_cart", auth, async (req, res) => {
  try {
    const { name, price, quantity, image } = req.body;
    const userId = req.userId;
    const existingUser = await Cart.findOne({ userId });
    if (!existingUser) {
      let add_to_cart = new addCart({
        userId,
        items: [
          {
            name,
            price,
            quantity,
            image,
          },
        ],
      });
      await add_to_cart.save();
      res.json("Cart added successfully");
    } else {
      existingUser.items.push({ name, price, quantity, image });
      await existingUser.save();
      res.json("Cart updated successfully");
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get user cart
cartRouter.get("/get_cart".auth, async (req, res) => {
  try {
    const userId = req.userId;
    const userCart = await Cart.findOne({ userId });
    res.json({ userCart });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
