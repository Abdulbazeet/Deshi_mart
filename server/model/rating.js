const mongoose = require("mongoose");
const ratingSchema = mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
  },
  rating: {
    type: Number,
    required: true,
  },
});

//const ratingModel = mongoose.model("rating", ratingSchema)
module.exports = ratingSchema;