const express = require('express')
const authRouter = express.Router()
const user = require('../model/userModel')
const bcrypt = require('bcryptjs')
const mongoose = require('mongoose')
authRouter.post('/auth_signUp', async(req, res) => {
   try {
     const { name, email, password } = req.body;
     const existingUser = await user.findOne({ email });
     if (existingUser)
       res.status(400).json({ msg: "There is a user with this email address" });

     const hashedPassword = await bcrypt.hash(password, 8);
     let newUser = await new user({
       name,
       password: hashedPassword,
       email,
     });
     await newUser.save();
     res.json({ newUser });

   } catch (e) {
    res.status(500).json({'error': e.message})
   }
    
})