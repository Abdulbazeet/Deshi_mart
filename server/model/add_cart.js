const mongoose = require('mongoose')
const cartItemSchema = mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    quantity: {
        type: Number,
        required: true,
    },
    image: {
        type: String,
        required: true
    },
    price: {
        type: Number,
        required: true
    }
})


module.exports = cartItemSchema;