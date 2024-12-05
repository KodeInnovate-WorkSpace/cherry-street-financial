const express = require("express");
const db = require("../db");

const router = express.Router();

router.get("/advisor", (req, res) => {
  const query = `
    SELECT *
    FROM advisors 
    LIMIT 1
  `;

  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "No advisor found" });
    }

    const advisor = results[0]; 

    res.status(200).json({
      advisor: {
        id: advisor.id,
        img: advisor.img,
        advisorName: advisor.advisorName,
        speciality: advisor.speciality,
        joinDate: advisor.joinDate,
        phoneNum: advisor.phoneNum,
        location: advisor.location,
        workMode: advisor.workMode,
        experience: advisor.experience,
        advisorDescription: advisor.advisorDescription,
      },
    });
  });
});

module.exports = router;
