const express = require("express");
const jwt = require("jsonwebtoken");
const user = require("../model/userModel");
const adminM = async (req, res, next) => {
  try {
    const token = req.header("authToken");
    if (!token)
      res.status(400).json({ msg: "Token is empty; authetication failed" });
    const verifiedToken = jwt.verify(token, "tokenKey");
    if (!verifiedToken) res.status(400).json({ msg: "Authorization failed" });
    const verifiedUser = await user.findById(verifiedToken.id);
    if (verifiedUser.type == "user")
      res.status(400).json({ msg: "User is not authorized for this action" });

    req.token = token;
    req.userId = verifiedToken.id;
    req.name = verifiedUser.name;
    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = adminM;
