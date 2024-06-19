- NAMA : ALI AMBARI
-- NIM  : 22241044
-- TUGAS

-- Akses databse
USE martundikma;

-- CASE 1
SELECT nama_pelanggan, alamat
FROM ms_pelanggan_dqlab;

-- CASE 2
SELECT nama_produk, harga
FROM ms_produk_dqlab;

-- CASE 3
SELECT *
FROM ms_produk_dqlab
WHERE nama_produk = 'Flashdisk DQLab 32 GB'
AND harga > 15000;


-- CASE 4
SELECT *
FROM ms_produk_dqlab
WHERE nama_produk 
IN ('Flashdisk DQLab 84 GB', 'Tas Travel Organizer DigiSkills.id', 'Gantungan Kunci DQLab');


-- CASE 5
SELECT *
FROM ms_produk_dqlab
WHERE harga < 50000;

-- CASE 6
SELECT kode_pelanggan, nama_produk, qty, harga,(qty*harga) AS total
FROM tr_penjualan_dqlab
WHERE (qty*harga) >= 200000
ORDER BY total DESC;


-- CASE 7
SELECT kode_pelanggan, SUM(qty) AS total_qty, SUM(qty * harga) AS total_harga, SUM(qty) % 3 AS sisa_quantity
FROM tr_penjualan_dqlab
GROUP BY kode_pelanggan;
    
 
-- CASE 8
SELECT kode_transaksi, tgl_transaksi, no_urut, kode_produk,nama_produk,
CONCAT(kode_produk, ' - ', nama_produk) AS kode_produk_namaproduk
FROM tr_penjualan_dqlab
WHERE qty = 5;
     

-- CASE 9
SELECT nama_pelanggan,
TRIM(REPLACE(nama_pelanggan, ', S.H', '')) AS nama_tanpa_gelar, 
SUBSTRING_INDEX(nama_pelanggan, ' ', 1) AS nama_panggilan
FROM ms_pelanggan_dqlab
WHERE kode_pelanggan = 'dqlabcust01';


-- CASE 10
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial
FROM ms_pelanggan_dqlab;



-- CASE 11
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial,
LENGTH(nama_pelanggan) AS total_char
FROM ms_pelanggan_dqlab;


-- CASE 12
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial,
LENGTH(nama_pelanggan) AS total_char,
CASE 
WHEN nama_pelanggan = 'Pelanggan Non Member' THEN 'Not member' 
ELSE nama_pelanggan
END AS new_revisi_pelanggan
FROM ms_pelanggan_dqlab;


-- CASE 13
SELECT nama_pelanggan, SUBSTRING(nama_pelanggan, 2, 3) AS initial, LENGTH(nama_pelanggan) AS Total_Char,
CASE 
WHEN nama_pelanggan = 'Pelanggan Non Member' THEN 'Not member' 
ELSE nama_pelanggan
END AS new_revisi_pelanggan,
UPPER(nama_pelanggan) AS UPPER_NAMA_PELANGGAN, 
LOWER(nama_pelanggan) AS lower_nama_pelanggan
FROM ms_pelanggan_dqlab;


-- CASE 14
SELECT nama_pelanggan, 
SUBSTR(nama_pelanggan, 2, 3) AS initial,
LENGTH(nama_pelanggan) AS total_char,
CASE 
WHEN nama_pelanggan = 'Pelanggan Non Member' THEN 'Not member' 
ELSE nama_pelanggan
END AS new_revisi_pelanggan
FROM ms_pelanggan_dqlab;


-- CASE 15
SELECT kode_pelanggan,
COUNT(kode_transaksi) AS total_order,
SUM(qty) AS total_quantity,
SUM(harga * qty) AS revenue,
CASE 
WHEN SUM(harga * qty) >= 900000 THEN 'Target Achieved'
WHEN SUM(harga * qty) <= 850000 THEN 'Less performed'
ELSE 'Follow Up'
END AS remark
FROM tr_penjualan_dqlab
GROUP BY kode_pelanggan;
GROUP BY kode_pelanggan;


-- CASE 16
SELECT 
kode_transaksi,
kode_pelanggan,
kode_produk,
nama_produk,
harga,
qty,
(qty*harga) AS total
FROM tr_penjualan_dqlab
ORDER BY harga DESC;


-- CASE 17
SELECT nama_produk, no_urut
FROM tr_penjualan_dqlab;

-- CASE 18
SELECT nama_produk,no_urut
FROM ms_produk_dqlab
UNION
SELECT nama_produk, no_urut
FROM tr_penjualan_dqlab;


-- CASE 19
SELECT 
p.kode_pelanggan,
p.nama_pelanggan,
p.alamat,
pr.nama_produk
FROM 
ms_pelanggan_dqlab p
JOIN 
tr_penjualan_dqlab t ON p.kode_pelanggan = t.kode_pelanggan
JOIN 
ms_produk_dqlab pr ON t.kode_produk = pr.kode_produk
WHERE 
pr.nama_produk IN ('Kotak Pensil DQLab', 'Flashdisk DQLab 32 GB', 'Sticky Notes DQLab 500 sheets');


-- CASE 20
SELECT nama_produk, tgl_transaksi, DATEDIFF(curdate(), tgl_transaksi) AS selisih_hari
FROM tr_penjualan_dqlab;
