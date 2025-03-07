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
> Karena temanya di planet lain, saya mengimplementasikan gravitasi yang lebih rendah dan menyesuaikan *jump speed* agar lompatnya makin tinggi. Selain itu, saya juga mengimplementasikan beberapa **TileMap yang bergerak** dengan menempatkannya dalam **Node2D** sebagai parent dan menggunakan tween untuk mengatur pergerakannya. Saya menyimpan posisi awal TileMap, lalu menggerakkannya sejauh nilai `move_distance` dengan kecepatan yang ditentukan oleh `move_speed`. Setelah mencapai titik tujuan, arah gerakan dibalik secara otomatis, sehingga TileMap terus bergerak bolak-balik.