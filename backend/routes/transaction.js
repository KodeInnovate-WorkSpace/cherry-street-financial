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

    const groupedTransactions = results.reduce((acc, transaction) => {
      const { month, day, purchase, cost } = transaction;

      if (!acc[month]) {
        acc[month] = [];
      }

      acc[month].push({ day, purchase, cost });

      return acc;
    }, {});

    const formattedResponse = Object.entries(groupedTransactions).map(
      ([month, transactions]) => ({
        month,
        transactions,
      })
    );

    res.json({
      transaction: formattedResponse,
    });
  });
});

module.exports = router;
