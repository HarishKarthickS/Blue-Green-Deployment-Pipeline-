const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 5000; // Green service port

const pool = new Pool({
  host: process.env.DB_HOST || 'db',
  database: process.env.DB_NAME || 'mydatabase',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
  port: 5432,
});

app.get('/', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM deployment_status;');
    client.release();
    res.json({ service: 'green', data: result.rows });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Green service running on port ${port}`);
});
