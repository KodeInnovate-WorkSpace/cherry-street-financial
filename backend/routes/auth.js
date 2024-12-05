const express = require("express");
const jwt = require("jsonwebtoken");
const db = require("../db");

const router = express.Router();
const SECRET_KEY = "your_secret_key";

router.post("/login", (req, res) => {
  const { username, password } = req.body;

  const query = "SELECT * FROM users WHERE username = ? AND pass = ?";
  db.query(query, [username, password], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0)
      return res.status(401).json({ message: `Invalid username or password` });

    const user = results[0];
    const token = jwt.sign(
      { id: user.id, username: user.username },
      SECRET_KEY,
      { expiresIn: "1h" }
    );

    res.status(200).json({
      user: {
        id: user.id,
        username: user.username,
        pass: user.pass,
        token: token,
      },
    });
  });
});

module.exports = router;
