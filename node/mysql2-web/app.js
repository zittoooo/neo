const express = require("express");
const morgan = require("morgan");
const path = require("path");
const app = express();
const bodyParser = require("body-parser");

app.set("port", process.env.PORT || 8000);
app.use(morgan("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

var main = require("./routes/main");
app.use("/", main);

app.listen(app.get("port"), function () {
  console.log("Server is Started~!!" + app.get("port"));
});
