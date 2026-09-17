const express = require("express");

const app = express();

app.get("/", (req, res) => {
    res.send("GHAS Workshop");
});

app.listen(3000);
