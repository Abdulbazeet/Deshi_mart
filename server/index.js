const express = require("express");
const app = express();
const PORT = 3000;
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product")

app.use(express.json());
app.use(authRouter);
app.use(productRouter);

mongoose
  .connect(
    "mongodb+srv://olatunji:Ba1za22ta@cluster0.lhzpe.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
  )
  .then(() => {
    console.log("Connection made");
  })
  .catch((e) => {
    console.log(e.message);
  });
app.listen(PORT, () => {
  console.log("Yes");
});

// app.get('/hello', (req, res) => {
//     console.log('Connection made')
//     res.send("It's made")

// })
