const express = require("express");
const mysql = require("mysql2");

const cors = require("cors");
const app = express();

// Allow requests from Vue app
app.use(cors());

// Connect to MySQL database
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "mydb",
});

// Checking if connection works
connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});

// Getting all business units, workers, groups from selected business unit and products for selected worker from database
app.get("/poslovna-enota", (req, res) => {
  let sql = "SELECT * FROM poslovna_enota";

  connection.query(sql, function (err, result) {
    if (err) throw err;
    res.json(result);
  });
});

app.get("/delavci/:id", (req, res) => {
  let skupinaId = req.params.id;

  let sql = "SELECT * FROM delavec WHERE organizacijska_skupina_id = ?";

  connection.query(sql, [skupinaId], function (err, result) {
    if (err) throw err;
    res.json(result);
  });
});

app.get("/organizacijske-skupine/:id", (req, res) => {
  let poslovnaEnotaId = req.params.id;

  let sql = "SELECT * FROM organizacijska_skupina WHERE poslovna_enota_id = ?";

  connection.query(sql, [poslovnaEnotaId], function (err, result) {
    if (err) throw err;

    res.json(result);
  });
});

app.get("/tipi-izdelkov/:id", (req, res) => {
  let delavecId = req.params.id;
  // Get products for selected worker
  let sql = `
        SELECT tip_digitalni_produkt.naziv, tip_digitalni_produkt.opis
        FROM delavec_tip_produkta
        JOIN poslovna_enota_has_tip_produkta
        ON delavec_tip_produkta.poslovna_enota_has_tip_produkta_id = poslovna_enota_has_tip_produkta.id
        JOIN tip_digitalni_produkt
        ON poslovna_enota_has_tip_produkta.tip_digitalni_produkt_id = tip_digitalni_produkt.id
        WHERE delavec_tip_produkta.delavec_id = ?
    `;

  connection.query(sql, [delavecId], function (err, result) {
    if (err) throw err;
    res.json(result);
  });
});

// Starting backend server
app.listen(3000, () => {
  console.log("Server deluje na port 3000");
});
