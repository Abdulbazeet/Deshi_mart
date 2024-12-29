const express = require("express");
const authRouter = express.Router();
const user = require("../model/userModel");
const bcrypt = require("bcryptjs");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");

//sign up as user
authRouter.post("/auth_signUp", async (req, res) => {
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
    res.status(500).json({ error: e.message });
  }
});


//login as user
authRouter.post("/auth_signIn", async (req, res) => {
  try {
    const { email, password } = req.body;
    const availableUser = await user.findOne({ email });
    if (!availableUser)
      res.status(400).json({ msg: "No user with email exists" });
    const correctPassword = await bcrypt.compare(
      password,
      availableUser.password
    );
    if (!correctPassword)
      res.status(400).json({ msg: "The password provided is wrong" });
    const token = jwt.sign({ id: availableUser._id }, "tokenKey");
    res.json({ token, ...availableUser._doc });
  } catch (e) {
    res.json({ error: e.message });
  }
});


module.exports = authRouter;

// authRouter.post
