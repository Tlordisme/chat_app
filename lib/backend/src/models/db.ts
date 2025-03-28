import { Pool } from "pg";

const pool = new Pool({
  user: "postgres",
  password: "Thanh2182003?",
  host: "localhost",
  port: 5432,
  database: "ChatAppDb",
});

export default pool;
