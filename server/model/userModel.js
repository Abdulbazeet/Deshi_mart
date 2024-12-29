const mongoose = require('mongoose')
const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,

    },
    password: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        trim: true,
    },
    type: {
        type: String,
        default: "user",
    },
    
})
const userModel = mongoose.model('User', userSchema);
module.exports = userModel  //exporting the model