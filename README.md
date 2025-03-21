# Table of Contents
- [Tutorial 4 - Introduction to Game Programming](#tutorial-4---Basic-2D-Level-Design)
- [Tutorial 6 - Menu and In-Game Graphical User Interface](#tutorial-6---Menu-and-In-Game-Graphical-User-Interface)
<br>
<br>

# Tutorial 4 - Basic 2D Level Design
## Ramadhan Andika Putra (2206081976) - GameDev A <br>

### Latihan Mandiri: Membuat Level Baru Dengan Tile Map & Obstacle Berbeda

#### Membuat level 2
> Sebagai bagian dari latihan mandiri, saya menambahkan *scene* baru yang diberi nama `Level2.tscn`. *Scene* ini berfungsi sebagai **level lanjutan** jika telah menyelesaikan Level 1, menggantikan cara sebelumnya yang hanya menampilkan gambar *meme* dengan teks **"You're Breathtaking"**. Sekarang, jika pemain berhasil mencapai **winning area** di level 1, mereka akan dipindahkan ke level baru ini. setelah melihat gambar *meme*-nya
<br>

#### Menggunakan *Tile Map* dengan Tampilan Berbeda
> Dalam level ini, saya memilih *spritesheet* dengan tema **planet lain (planet)**, yang membedakannya dari Level 1 yang menggunakan **tanah dan rumput (grass)**. Selain itu, desain level ini saya buat agar pemain juga harus **melompat ke atas** melewati rintangan yang ada, bukan hanya bergerak ke samping seperti sebelumnya. Dari segi fisika, saya tetap menggunakan **physics layer** dan **collision shape** bawaan tanpa perubahan tambahan.
<br>

#### *Spawner* Rintangan dengan Objek Baru
> Agar lebih nyambung dengan tema, untuk level 2 saya menambahkan **spawner** yang menghasilkan **mata gergaji *(saw)***, bukan ikan seperti di level 1 (karena tidak ada ikan di luar angkasa). Meskipun script yang digunakan masih sama, objek yang dihasilkan kali ini berbeda. Pada scene bom, saya menambahkan **CollisionShape2D** berbentuk lingkaran serta **AreaTrigger**, yang berfungsi mendeteksi tabrakan dan memberikan efek yang sesuai.
<br>

#### Tantangan: *Obstacle* vertikal serta Mata Gergaji yang Berjatuhan dengan Cepat
> Level ini dirancang agar pemain menghadapi tantangan baru. Karena terdapat *obstacle* yang 'memaksa' pemain melompat dan bergerak secara **vertikal**, kesalahan dalam **timing** saat melompat bisa menyebabkan pemain terjatuh ke bawah dan langsung menyebabkan **kekalahan**. Selain itu, mata gergaji *(saw)* dari **spawner** akan terus jatuh dari atas dengan posisi acak. Hal ini memaksa pemain untuk bergerak dengan cepat, karena kecepatan jatuhnya lebih cepat daripada jatuhnya ikan pada level 1.<br>

<br>

### *Polishing* Sederhana

#### Gravitasi lebih rendah dan ada *tilemap* yang bergerak
> Karena temanya di planet lain, saya mengimplementasikan gravitasi yang lebih rendah dan menyesuaikan *jump speed* agar lompatnya makin tinggi. Selain itu, saya juga mengimplementasikan beberapa **TileMap yang bergerak** dengan menempatkannya dalam **Node2D** sebagai parent dan menggunakan tween untuk mengatur pergerakannya. Saya menyimpan posisi awal TileMap, lalu menggerakkannya sejauh nilai `move_distance` dengan kecepatan yang ditentukan oleh `move_speed`. Setelah mencapai titik tujuan, arah gerakan dibalik secara otomatis, sehingga TileMap terus bergerak bolak-balik.<br>

<br>

# Tutorial 6 - Menu and In-Game Graphical User Interface
## Ramadhan Andika Putra (2206081976) - GameDev A <br>

### Latihan Mandiri: Fitur Tambahan

#### Tombol pada layar game over untuk kembali ke menu utama
> Untuk tombol kembali ke menu utama di layar Game Over, saya menambahkan sebuah *node* LinkButton di *scene* Game Over dan menghubungkannya dengan signal `pressed()`. Ketika tombol tersebut ditekan, *script* yang saya buat memanggil fungsi `get_tree().change_scene("res://scenes/MainMenu.tscn")` yang langsung mengganti *scene* dari layar Game Over ke Main Menu.<br>

#### Fitur Select Stage
> Untuk fitur Select Stage, saya mengimplementasikan sebuah menu baru yang menampilkan pilihan level yang dapat dimainkan. Saya menggunakan *container* seperti `VBoxContainer` untuk menyusun tombol-tombol level secara vertikal, sehingga tampilan menu terasa rapi dan mudah dinavigasi. Setiap tombol dihubungkan dengan fungsi yang spesifik untuk memuat *scene* level yang bersangkutan ketika ditekan.<br>

#### Layar dan efek transisi antar level, dari level 1 ke level 2
> Untuk transisi antar level, saya menggunakan tween untuk menciptakan efek fade-out yang halus. Ketika player menyentuh area trigger, kode saya membuat tween dengan perintah `create_tween()` dan mengatur easing dengan `Tween.EASE_IN_OUT` serta transisi dengan `Tween.TRANS_CUBIC`. Tween kemudian mengubah properti `modulate` pada scene saat ini secara perlahan selama 0.5 detik untuk menghasilkan efek fade-out. Setelah tween selesai (dengan `await tween.finished`), game langsung berpindah ke scene Level2 menggunakan `get_tree().change_scene_to_file()`.<br>


### *Polishing* Lebih Lanjut

#### Rintangan yang jatuh juga mengurangi nyawa player
> Di setiap level, saya menambahkan *logic* agar rintangan jatuh yang mengenai *player* akan mengurangi nyawa dengan cara yang sama seperti ketika player jatuh. Pada *script* `collision detection`, saya memasukkan kondisi yang mengecek apakah objek yang bertabrakan adalah *player* dan apakah objek tersebut merupakan rintangan ada level tersebut. Jika kondisi terpenuhi, maka *global variable* yang menyimpan jumlah nyawa akan dikurangi. Jika nyawa sudah mencapai nol, maka game secara otomatis akan menampilkan layar Game Over.