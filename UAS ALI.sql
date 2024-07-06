USE mart_undikma


-- NAMA : ALI AMBARI
-- NIM :22241044

-- SOAL 1 --
-- Tampilkan hanya 5 nama produk yang memiliki pendapatan (Revenue) penjualan terbanyak.*/
SELECT 
    p.nama_produk,
    SUM(t.qty * t.harga) AS total_revenue
FROM 
    tr_penjualan_dqlab t
JOIN 
    ms_produk_dqlab p ON t.kode_produk = p.kode_produk
GROUP BY 
    p.nama_produk
ORDER BY 
    total_revenue DESC
LIMIT 5;




-- SOAL 2
/* Tampilkan hanya 3 kategori produk, dan total pendapatan (Revenue) yang berstatus target achived dengan ketentuan;
jika revenue >= 90000 = Target achived
jika revenue < 90000 = Less performance
Jika tidak keduanya = follow update
SELECT 
    pr.kategori_produk,
    SUM(t.qty * (t.harga - (t.diskon_persen / 100) * t.harga)) AS total_revenue,
    CASE 
        WHEN SUM(t.qty * (t.harga - (t.diskon_persen / 100) * t.harga)) >= 90000 THEN 'Target Achieved'
        WHEN SUM(t.qty * (t.harga - (t.diskon_persen / 100) * t.harga)) < 90000 THEN 'Less Performance'
        ELSE 'Follow Up'
    END AS performance_status
FROM tr_penjualan_dqlab t
LEFT JOIN ms_produk_dqlab pr 
ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk
HAVING performance_status = 'Target Achieved'
ORDER BY total_revenue DESC
LIMIT 3;





-- SOAL 3
/* Jika hari ini adalah tanggal 30 juni 2020, maka berikan informasi 3 nama produk yang paling lama tidak dibeli oleh pelanggan
(Wajib menggunakan join */
SELECT 
    p.nama_produk,
    MAX(t.tgl_transaksi) AS tanggal_pembelian_terakhir,
    DATEDIFF('2020-06-30', MAX(t.tgl_transaksi)) AS hari_sejak_pembelian_terakhir
FROM 
    ms_produk_dqlab p
LEFT JOIN 
    tr_penjualan_dqlab t ON p.kode_produk = t.kode_produk
GROUP BY 
    p.nama_produk
ORDER BY 
    hari_sejak_pembelian_terakhir DESC
LIMIT 3;

