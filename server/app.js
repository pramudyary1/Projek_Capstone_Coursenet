const express = require("express");
const app = express();
const path = require("path");
const userRoute = require("./routes/userRoute");
const authenticationRoutes = require("./routes/authenticationRoute");
const categoryRoutes = require("./routes/categoryRoute");
const productRoutes = require("./routes/productRoute");

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

require("dotenv").config();

app.use("/images", express.static("images"));
app.use("/authentication", authenticationRoutes);
app.use("/categories", categoryRoutes);
app.use("/products", productRoutes);
app.use("/user", userRoute);

app.get("/", (req, res) => {
  res.json({
    status: 200,
    message: "Welcome To SRC API",
  });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`listening on port http://localhost:${PORT}`);
});
