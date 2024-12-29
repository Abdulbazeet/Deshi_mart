const mongoose = require("mongoose")
const cartItemSchema = require("./add_cart")
const cartSchema = mongoose.Schema({
  userId: {
    required: true,
    type: String,
  },
  items: [cartItemSchema],
});

const cartModel = mongoose.model("cart", cartSchema)
module.exports = cartModel