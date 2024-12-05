const express = require("express");
const db = require("../db");

const router = express.Router();

router.get("/transaction", (req, res) => {
  const query = `
    SELECT 
      DATE_FORMAT(transaction_date, '%M %Y') AS month,
      DATE_FORMAT(transaction_date, '%m-%d-%Y') AS day,
      purchase,
      cost
    FROM 
      transactions
    ORDER BY 
      transaction_date DESC, purchase;
  `;

  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    res.json({
      transaction: results,
    });
  });
});

module.exports = router;
