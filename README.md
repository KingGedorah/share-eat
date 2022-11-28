# 🍽️ Share Eat 🍽️
Sebuah tempat untuk membeli makanan dengan *partner* restoran dengan diskon lebih. Hal ini dilakukan untuk meminimalisir makanan yang terbuang.
<br>

**Kini, dapat diakses secara langsung melalui ponsel.**
<br>

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2021/2022.

## 📱 Aplikasi 📱
Saat ini, hanya tersedia versi Android (APK) untuk diunduh. File APK dapat diunduh di bagian [_releases_]().

## 🧑 Nama Anggota 🧑
- Naufal Zhafari Zahran (2106752104)
- Jason Irvine Mahendra Putra (2106750654)
- Alizha (2106652000)
- Achieva Futura Gemilang (2106750452)
- Astrid Swardhani Putri (2106707113)
<br>

## 🌅 Brief 🌅
Dilansir dari __website__ GoodStats, berdasarkan survei yang dilakukan oleh United Nations Environment Programme (UNEP) Indonesia menempati posisi teratas sebagai negara penghasil *food waste* atau sampah makanan terbanyak di Asia Tenggara. Hal ini sungguh ironis, mengingat Indonesia juga menempati urutan ketiga dengan tingkat kelaparan tertinggi di Asia Tenggara. Menurut Global Hunger Index (GHI), Indonesia memiliki skor indeks sebesar 18 poin yang di mana skor tersebut berada di atas rata-rata global, yakni 17,9 poin. Melihat mirisnya kondisi ini, kelompok kami tergerak untuk membuat sebuah aplikasi bernama Share Eat. Share Eat hadir sebagai sarana untuk menghubungkan *customer* dengan restoran yang memiliki kelebihan makanan yang tidak terjual. Melalui Share Eat, *customer* dapat membeli makanan dari restoran yang menjual makanan berlebihnya dengan harga *discount*, sehingga dengan adanya Share Eat, tingkat *food waste* di Indonesia diharapkan dapat mengalami penurunan. Aplikasi ini terdiri atas lima fitur yang dibagi menjadi dua tipe __user__ yaitu untuk penjual (*restoran*) dan pembeli (*customer*). 

Untuk __user__ penjual atau restoran, penjual dapat menambahkan makanan yang ingin dijual dan menampilkan daftar makanan yang dipesan. Daftar makanan yang dijual ini dapat dilihat oleh __user__ *customer*. Selain itu, penjual dapat mengedit detail makanan yang dijualnya.

Pada tampilan *customer*, *customer* dapat melihat daftar restoran yang tersedia beserta menu yang dijualnya. *Customer* memiliki fitur keranjang untuk menampilkan daftar makanan yang dipesan. Setelah *customer* memesan makanan, keranjang *customer* diisi dengan daftar makanan yang telah dipesan sebelumnya. *Customer* dapat melakukan pembayaran melalui fitur keranjang untuk memproses makanan yang dipesan. Setelah pembayaran berhasil, saldo *customer* akan terpotong.

<br>

## 📗 Modul dan Kontrak Kerja 📗
- *__Landing Page__.* :  Page awal yang berisikan tentang penjelasan secara umum Share-Eat *(Astrid)*
- *__Login & Register__*: Tampilan login dan register untuk pengguna lama ataupun calon - pengguna  baru. *(Astrid)*
- *__Customer Page__*: Tampilan daftar __restaurant__ beserta menu yg dijual untuk __Customer__. *(Alizha)*
- *__Order page for Customer__*: Keranjang untuk merekap pesanan dan menampilkan makanan yang telah dipesan. *(Naufal)*
- *__Order page for Seller__*: Menampilkan daftar pesanan yang dipesan oleh Customer. *(Achieva)*
- *__Restaurant Page__.* :  Menambahkan menu dan mengedit stok yang tersedia di partner restoran. *(Jason)*

## 🔗 Alur Pengintegrasian dengan Situs Web 🔗
1.    Melengkapi modul - modul yang terdapat pada web untuk pengambilan dan pengiriman data
2.    Menambahkan middleware agar API dapat diakses dari luar website
3.    Membuat async function - function untuk pengolahan data
4.    Pengambilan data dari web yang sudah terintegrasi akan menggunakan HTTP Get dan data yang sudah diambil tadi akan ditampilkan pada aplikasi yang sudah dibuat. Untuk pengiriman data,  akan digunakan HTTP Post yang nantinya akan tersimpan di database web aplikasi Django yang terintegrasi
5.    Response yang sudah difetch/diambil tadi juga akan dikonversi menjadi Dart object sehingga dapat digunakan sebagai model pada aplikasi Flutter yang akan dirancang
<br>

## 🧍 Persona 🧍
- 👤 *User* yang belum *login* 👤
      <br>
      *User* yang belum login hanya bisa mengakses landing page saja dengan melihat about us dari Share-Eat dan melakukan eksplorasi pada fitur-fitur dalam *landing page*. *User* yang belum melakukan *login* tidak bisa melakukan pemesanan   
- 🛒 *Customer* 🛒
      <br>
      Customer merupakan __user__ yang sudah __login__ sebagai *customer*. *Customer* bisa melihat *list restaurant* apa saja di __restaurant page__. Lalu, *customer* bisa melihat *list* makanan dalam suatu *restaurant* di *menu page*. Terakhir, *customer* bisa melakukan pemesanan makanan dan melakukan pembayaran di *order page*.
- 🍽️ *Restaurant* 🍽️
      <br>
      *User* yang __login__ sebagai __Seller__ bisa menambahkan makanan yang akan dijual beserta detailnya. *User* ini juga bisa memodifikasi detail dari makanan yang telah didaftarkan pada daftar makanan. *Seller* juga dapat melihat daftar pesanan yang dipesan oleh *customer*.
