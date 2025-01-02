const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const cartRouter = require("./routes/carts");
const orderRouter = require("./routes/orders");

app.use(express.json());
app.use(authRouter);
app.use(productRouter);
app.use(cartRouter);
app.use(orderRouter);

mongoose
  .connect(process.env.MONGODB_URL)
  .then(() => {
    console.log("Connection made");
  })
  .catch((e) => {
    console.log(e.message);
  });
// app.listen(PORT, () => {
//   console.log("Yes");
// });

module.exports = app

