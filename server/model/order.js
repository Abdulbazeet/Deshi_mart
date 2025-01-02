const mongoose = require("mongoose");
const orderSchema = mongoose.Schema({
  userId: {
    type: String,
    required: true,
  },
  userdata: {
    name: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    phone: {
      type: String,
      required: true,
    },
    address: {
      type: String,
      required: true,
    },
  },
  orderItems: [
    {
      productId: {
        required: true,
        type: String,
      },
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
  totalPrice: {
    type: Number,
    required: true,
  },
  orderStatus: {
    type: String,
    enum: ["pending", "approved", "declined"], // Fixed enum usage
    default: "pending",
  },
  paymentMethod: {
    type: String,
    enum: ["Credit Card", "Debit Card", "PayPal", "Cash on Delivery"],
    required: true,
  },
});
const orderModel = mongoose.model("orders", orderSchema);
module.exports = orderModel;
