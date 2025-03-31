var mysql = require("mysql2/promise");
const env = require("dotenv").config({ path: "../../.env" });

const db = async () => {
  try {
    let connection = await mysql.createConnection({
      host: process.env.host,
      user: process.env.user,
      port: process.env.port,
      password: process.env.password,
      database: process.env.database,
    });

    let [rows, fields] = await connection.query("select * from st_info");
    console.log(rows);

    let data = {
      st_id: "202599",
      name: "Moon",
      dept: "Computer",
    };

    let insertId = data.st_id;

    // insert query
    [rows, fields] = await connection.query("insert into st_info set ?", data);
    console.log("\nData is inserted~!!");

    // select * for inserted data
    [rows, fields] = await connection.query(
      "select * from st_info where st_id = ?",
      [insertId]
    );
    console.log(rows);

    // update query
    [rows, fields] = await connection.query(
      "update st_info set dept = ? where st_id = ?",
      ["Moon", insertId]
    );
    console.log("Data is updated: " + insertId);

    // select * for updated data
    [rows, fields] = await connection.query(
      "select * from st_info where st_id = ?",
      [insertId]
    );
    console.log(rows);

    // delete query
    [rows, fields] = await connection.query(
      "delete from st_info where st_id = ?",
      [insertId]
    );
    console.log("Data is deleted: " + insertId);
    // select * for deleted data
    [rows, fields] = await connection.query(
      "select * from st_info where st_id = ?",
      [insertId]
    );
    console.log(rows);
  } catch (err) {
    console.log(err);
  }
};

db();
