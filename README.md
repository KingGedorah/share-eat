# 🍽️ Share Eat 🍽️
Sebuah tempat untuk membeli makanan dengan *partner* restoran dengan diskon lebih. Hal ini dilakukan untuk meminimalisir makanan yang terbuang.

[![Pre-Release](https://github.com/KingGedorah/share-eat/actions/workflows/pre-release.yml/badge.svg)](https://github.com/KingGedorah/share-eat/actions/workflows/pre-release.yml)
[![Release](https://github.com/KingGedorah/share-eat/actions/workflows/release.yml/badge.svg)](https://github.com/KingGedorah/share-eat/actions/workflows/release.yml)
[![Build status](https://build.appcenter.ms/v0.1/apps/70f6692f-c886-46ea-9255-9a965598ef09/branches/main/badge)](https://install.appcenter.ms/orgs/d02-pbp-2022-2023/apps/share-eat/distribution_groups/public)

<br>

**Kini, dapat diakses secara langsung melalui ponsel.**
<br>

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2021/2022.

## 📱 Aplikasi 📱
Saat ini, hanya tersedia versi Android (APK) untuk diunduh. File APK dapat diunduh di bagian [_releases_](https://github.com/KingGedorah/share-eat/releases/tag/1.0.0%2B1) dan [_Microsoft App Center_](https://install.appcenter.ms/orgs/d02-pbp-2022-2023/apps/share-eat/distribution_groups/public).

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
- *__Landing Page__.*
Page awal yang berisikan tentang penjelasan singkat dan navigasi secara umum terkait aplikasi Share-Eat. *(Achieva)*
- *__Login__*
Tampilan __login__ untuk pengguna lama ataupun calon - pengguna baru. *(Astrid)*
- *__Profile page__*
Fitur ini menampilkan data dari _seller_ dan _customer_ yang sudah melakukan _register_ pada _website_.
- *__Customer Page__*
Menampilkan daftar _restaurant_ beserta menu yg dijual untuk _Customer_. _Customer_ dapat mengakses menu yang dimiliki oleh _restaurant_ beserta harga dan deskripsi dari menu tersebut. _Customer_ dapat membeli makanan melalui _input form_ yang disediakan. Fitur ini hanya bisa diakses oleh _customer_ yang sudah melakukan _login_. *(Alizha)*
- *__Order page for Customer__*
Pada fitur ini, user yang _login_ sebagai _customer_ dapat melihat rekap menu yang sudah dipesan sebelumnya pada fitur _customer page_. _Customer_ juga dapat menambahkan catatan pesanan. *(Naufal)*
- *__Order page for Seller__*
Pada Fitur ini, *seller* dapat melihat tampilan menu beserta jumlah makanan yang dibeli oleh _customer_. _Seller_ juga dapat menambahkan makanan gratis untuk _customer_ dan menampilkan makanan tambahan gratis tersebut bersamaan dengan rekap pesanan yang dipesan oleh _customer_. Fitur ini hanya dapat diakses oleh _Seller_ yang sudah _login_. *(Achieva)*
- *__Restaurant Page__.*
Fitur ini hanya bisa diakses oleh _seller_ yang sudah _login_. Pada fitur ini, _seller_ dapat menambahkan menu, mengedit detail makanan, dan menghapus makanan yang sudah ditambahkan sebelumnya. *(Jason)*


## 🔗 Alur Pengintegrasian dengan Situs Web 🔗
1. Melengkapi _endpoint_ JSON pada modul-modul yang terdapat pada web untuk pengambilan dan pengiriman data terkait. Modul-modul ini akan didefinsikan sesuai dengan implementasi anggota kelompok.
2. Menambahkan _package_  pbp_django_auth pada pubspec.yaml untuk autentikasi, _method request_ POST, _method request_ GET, dan lain-lain.
3. Menambahkan `middleware` pada setting Django agar kita dapat memberikan akses API untuk aplikasi mobile yang berasal dari luar website kita. API ini nantinya akan mengembalikan response dalam bentuk JSON.
4. Membuat async function terkait pada implementasi aplikasi Flutter untuk pengolahan data aplikasi terkait (menggunakan `FutureBuilder`).
5. Pengambilan data dari web yang sudah terintegrasi akan menggunakan HTTP `GET` dan data yang sudah diambil tadi akan ditampilkan pada aplikasi yang sudah dibuat. Untuk pengiriman data,  akan digunakan HTTP `POST` yang nantinya akan tersimpan di _database web_ aplikasi Django yang terintegrasi.
6. Response yang sudah difetch/diambil tadi juga akan dikonversi menjadi Dart object sehingga dapat digunakan sebagai model pada aplikasi Flutter yang akan dirancang.

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

<br>


##  Pertanyaan Demo TK PAS

Pertanyaan: Sebutkan jenis _event handling_ yang digunakan dan jelaskan apa kegunaannya.

- **Login Page** : 
  - Class TextFormField:
    - OnChanged : untuk menyimpan data ketika _user_ menuliskan data di _text field_
    - OnSaved : untuk menyimpan data ketika _user_ selesai menuliskan data di _text field_
    - OnPressed : _event handling_ ketika _user_ menekan _button_ login untuk melakukan _login_ dan data-data yang telah diisi sebelumnya dilakukan penyimpanan dan diproses
    
- **Customer Page** :
	- Class TextFormField:
		- OnChanged: Mengassign input jumlah makanan yang ingin dibeli oleh customer ketika _customer_ mengganti input  jumlah makanan yang ingin dibeli.
		- OnSaved: Mengassign input jumlah makanan ketika _customer_ selesai menginput data pada formfield.
	- Class TextButton:
		- OnPressed: 
          - Navigasi ke dialog pop up ketika _customer_ selesai menginput pesanan.
          - Menghapus tampilan jumlah input pada FormField ketika _customer_ menutup dialog pop up yang muncul setelah menambahkan pesanan. (memanfaatkan TextEditingController()).
	- Class IconButton:
        - onPressed:
          - Navigasi ke halaman rekap pesanan saat _user_ klik tombol ikon yang tersedia pada AppBar.
          - Navigasi ke halaman sebelumnya.
    - Class Container:
      - OnTap:
          - Navigasi ke halaman menu, sesuai dengan restoran mana yang ditap oleh _customer_
          - Navigasi ke halaman detail dari menu, sesuai dengan menu yang dipilih oleh _customer_

- **Order page for Customer (Fitur Cart)** :
	- Class TextFormField
		- onChanged :
			- Mengassign data text catatan yang ditambahkan oleh customer saat ingin menambahkan catatan
		- onSaved :
			- Mengassign data text catatan customer (saat menambahkan catatan pesanan) ketika customer selesai menginput data pada formfield.
	- Class TextButton
		- onPressed : 
			- Membuat catatan pesanan dengan menjalankan function asynchronous yang telah dibuat yaitu buatCatatan(request, catatan, context) dan memvalidasi inputannya. 
	- OutlinedButton
		- onPressed :
			- Mengarahkan ke page untuk menambahkan catatan pesanan customer

- __Landing Page__:
	- Class: TextButton
      - OnPressed: 
	      - Navigasi ke suatu page tertentu untuk mengakses fitur aplikasi.
	- Class: ListTile -> Drawer
      - OnTap: 
	      - Navigasi ke suatu page tertentu untuk mengakses fitur aplikasi.

- __Order page for Seller__ : 
	- Class: TextButton
		- OnPressed: 
			- Navigasi ke suatu page tertentu seperti page lihat pesanan, detail pesanan, tambah gratisan, dan lain semacamnya. 
            - Menambahkan gratisan dengan fungsi asinkronus addGratisan() sehingga data pada Django juga ikut terupdate.
            - Menyelesaikan suatu pesanan yang ada di list daftar pesanan dengan fungsi asinkronus donePesanan() sehingga data pada Django juga ikut terupdate.
            - Dengan bantuan formkey GlobalKey<FormState>, suatu form (sebagai contoh: Add Gratisan) dapat memvalidasi form agar pengisian inputnya valid.
	- Class: TextFormField
      - OnChanged:
      	- Mengassign data nama makanan dan nama customer (saat menambahkan gratisan) ketika persona mengganti input data pada formfield.
      - OnSaved:
      	- Mengassign data nama makanan dan nama customer (saat menambahkan gratisan) ketika persona selesai menginput data pada formfield.
	- Class: InkWell
      - OnTap:
      	- Dismiss popup dan melakukan refresh setState() agar dapat memberi tahu Flutter bahwa terdapat data yang berubah (contoh: ketika menandakan selesainya pesanan).

- __Restaurant Page__ :
	- Class TextButton
		- OnPressed:
          - Navigasi ke suatu page tertentu seperti page edit makanan, kembali ke page sebelumnya. 
          - Menghapus makanan dengan menjalankan fungsi asinkronus deleteMakanan(request, id).
          - Mengupdate makanan dengan menjalankan fungsi asinkronus updateMakanan(request, _makanan) dan memvalidasi input form pada page edit makanan.
          - Membuat makanan dengan menjalankan fungsi asinkronus buatMakanan(request, _makanan) dan memvalidasi input form pada page tambah makanan.
	- Class Container
		- OnTap
			- Navigasi ke page tertentu seperti detail makanan
  - Class: TextFormField
  	- OnChanged:
  		- Mengassign data nama makanan (saat menambahkan makanan atau mengedit detail makanan) ketika 		pengguna mengganti input data pada formfield.
  	- OnSaved:
  		- Mengassign data nama makanan (saat menambahkan makanan atau mengedit detail makanan) ketika pengguna selesai menginput data pada formfield.
		

