const mysql = require('mysql2/promise');
require('dotenv').config();

let db;

if (process.env.DATABASE_URL) {
  // Railway provides a full MySQL connection URL.
  // mysql2 accepts it via the `uri` option when creating a pool.
  db = mysql.createPool({
    uri:                process.env.DATABASE_URL,
    waitForConnections: true,
    connectionLimit:    10,
  });
} else {
  // Local development — use individual variables from .env
  db = mysql.createPool({
    host:               process.env.DB_HOST,
    user:               process.env.DB_USER,
    password:           process.env.DB_PASSWORD,
    database:           process.env.DB_NAME,
    port:               parseInt(process.env.DB_PORT) || 3306,
    waitForConnections: true,
    connectionLimit:    10,
  });
}

module.exports = db;