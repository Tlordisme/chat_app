import { Pool } from "pg";

const pool = new Pool({
  user: "postgres",
  password: "Thanh2182003?",
  host: "localhost",
  port: 5432,
  database: "ChatAppDb",
  
});

pool.connect()
  .then(client => {
    console.log("✅ Kết nối thành công với PostgreSQL!");
    return client.query("SELECT NOW()") // Thử chạy một truy vấn đơn giản
      .then(res => {
        console.log("⏳ PostgreSQL đang chạy, thời gian hiện tại:", res.rows[0].now);
        client.release(); // Giải phóng kết nối
      })
      .catch(err => {
        client.release();
        console.error("❌ Lỗi truy vấn:", err.stack);
      });
  })
  .catch(err => {
    console.error("❌ Lỗi kết nối PostgreSQL:", err.stack);
  });



export default pool;
