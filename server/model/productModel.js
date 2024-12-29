const mongoose = require("mongoose");
const ratingSchema = require("./rating");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  price: {
    required: true,
    type: String,
  },
  description: {
    type: String,
    required: true,
  },
  quantity: {
    type: Number,
    required: true,
  },
  image: [
    {
      required: true,
      type: String,
    },
  ],
  category: {
    type: String,
    required: true,
  },
  rating: [ratingSchema],
  brand: {
    type: String,
    required: true,
  },
  adminId: {
    required: true,
    type: String,
  }
});
const productModel = mongoose.model("Products", productSchema)
module.exports = productModel;
