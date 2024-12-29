const express = require("express");
const jwt = require("jsonwebtoken");

const userM = async (req, res, next) => {
  try {
    const token = req.header("authToken");
    if (!token)
      res.status(400).json({ msg: "Token is empty; authetication failed" });
    const verifiedToken = jwt.verify(token, "tokenKey");
    if (!verifiedToken) res.status(400).json({ msg: "Authorization failed" });

    req.token = token;
    req.userId = verifiedToken.id;
    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = userM;
