- NAMA : ALI AMBARI
-- NIM : 22241044
-- MODUL 2


use martundikma;

-- NILAI LITERAL

-- menggunakan SELECT Statement untuk nilai literal untuk angka
SELECT 77 AS nomor_punggung;

-- menampilkan nilai literal beberapa tipe data
SELECT 77 AS angka, true AS nilai_logika, 'DQLAB' as teks;

-- NULL

-- Menampilkan NULL
SELECT NULL AS Kosong;

-- OPERATOR MATEMATIKA

-- Kalkulasi ekspresi Mtematika
SELECT 
5%2 AS sisa_bagi,
5/2 AS hasil_bagi,
5 DIV 2 AS hasil_bagi_2;

-- LATIHAN

SELECT
4*2 AS hasil_kali,
(4*8)%7 AS sisa_bagi_1,
(4*8) MOD 7 AS sisa_bagi_2,
(4*8) / 7 AS hasil_bagi;

SELECT * FROM tr_penjualan_dqlab;

-- Ekspresi MATEMATIKA
-- Menampilkan hasil kali dari kolom qty dan harga
SELECT 
    5=5,
    5<>5,
    5<>4,
    5!=5,
    5!=4,
    5>4;
   
   
-- LATIHAN MANDIRI Operator perbandingan
SELECT 
    1= true,
    1= false,
    5>=5,
    5.2=5.20000,
    NULL=1
    NULL=NULL;
   
-- LATIHAN
SELECT qty<=3 FROM tr_penjualan_dqlab;

-- FUNGSI 
SELECT POW(3,2), ROUND(3.14), ROUND (3.54),
ROUND(3.155,1), ROUND (3.155,2), floor(4.28),
floor(4.78), ceiling(4.39), ceiling(4.55);

-- Fungsi Tanggal
SELECT NOW(),
year (),
datediff(now(), '2004-03-17'),
day('2004-03-17');


-- Latihan 
SELECT NOW (),
datediff('2022-07-23'NOW()),
year ('2022-07-23'),
month('2022-07-23',)
day ('2022-07-23'),
year(now();

-- Menampilkan selisih transaksi dengan tanggal saat ini
SELECT datediff(now(), tgl_transaksi) AS selisih_hari
FROM 
tr_penjualan_dqlab;

-- WHERE Statement
-- Mengambil nama produk dan quantity yang quantitynya lebih dari 3
SELECT 
    nama_produk,qty
FROM
    tr_penjualan_dqlab
WHERE 
    qty > 3;


-- Mengambil nama_produk, qty, yang qty >3, dan transaksi bulan 6
SELECT 
     nama_produk,qty
     
FROM 
     tr_penjualan_dqlab
WHERE 
     qty > 3 AND 
     month(tgl_transaksi) = 6;

    
-- Mengambil nama_produk, qty dengan nama tertentu
SELECT 
     nama_produk,qty
FROM 
     tr_penjualan_dqlab
WHERE  
     nama_produk = "flashdisk DQlab 32 GB";

    
-- LIKE
-- mengambil nama produk yang berawalan huruf 'f'
SELECT nama_produk
FROM tr_penjualan_dqlab_tpd
WHERE nama_produk LIKE 'F%';

-- LATIHAN MANDIRI
SELECT nama_produk FROM tr_penjulan_dqlab WHERE nama_produk like '_a%';
SELECT nama_produk FROM ms_produk_dqlab WHERE nama_produk LIKE 't%';
SELECT nama_produk FROM ms_produk_dqlab WHERE nama_produk LIKE 'un%';

-- Menampilkan produk dari tabel penjualan yang berlawalan huruf 'f' dan qty
SELECT nama_produk FROM tr_penjualan_dqlab WHERE nama_produk LIKE 'f%' or qty > 2;
     
