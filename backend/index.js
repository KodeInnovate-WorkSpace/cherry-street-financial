const express = require("express");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const mysql = require("mysql2");
const cors = require("cors");

require("dotenv").config();
const app = express();
const PORT = process.env.PORT;
const SECRET_KEY = "your_secret_key";

app.use(express.json());
app.use(cors());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1234",
  database: "cherrystreet",
});

db.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL database");
});

app.post("/login", (req, res) => {
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

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
