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
  stock: {
    type: Number,
    required: true,
    default: 0,
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
  },
  salesCount: {
    type: Number,
    default: 0,
  },
  discount: {
    percentage: {
      type: Number,
      default:0
    },
    startDate: Date,
    endDate: Date
  }
});
const productModel = mongoose.model("Products", productSchema)
module.exports = productModel;
