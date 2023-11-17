1. Shared_preference plugin : tidak di gunakan di lokasi storage. 
2. Implementasi Shared preference : 
a.final _(nama properti) = TextEditingController() ; . 
b. Digunakan  TextFormField  untuk 3 properti yang sudah di definisi kan. 
c. Gunakan Method dispose() sifatnya optional, yg merupakan turunan dari statefullwidget, untuk menghindari kebocoran memori. Menggunakan void dispose() {(nama properti).dispose(); }. Digunakan untuk data yang berjalan. 
d. Membuat variabel baru : menggunakan late SharedPreference logindata; 
Late data bool; (dijamin kalau saat di run akan di masukan datanya tidak bernilai null dengan tipe data boolean), di letakan dibawah final final itu. 
e. Membuat method baru checkLogin(): menggunakan async await karena setelah shared preference ada nilainya baru bisa di jalan baris berikutnya. Diletakkan di bawah late late sebelum nya.
f. Membuat file home_screen
g. Memanggil checklogin degan menggunakan initState, jadi sebelum dia menampilkan name dan sebagainya dia akan mengecek dulu nilainya.
h. Di dalam onPressed elevatedButton  ditambahkn variabel baru username untuk menampung input data user, jadi pada username akan di hasilkan dari property nameController.