const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT;

const authRoutes = require("./routes/auth");
const advisorRoutes = require("./routes/advisor");
const transactionRoutes = require("./routes/transaction");

app.use(express.json());
app.use(cors());

app.use("/auth", authRoutes);
app.use("/advisor", advisorRoutes);
app.use("/transaction", transactionRoutes);

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
