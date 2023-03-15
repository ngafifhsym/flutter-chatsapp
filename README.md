# PANDUAN MENGERJAKAN PROYEK DENGAN GITHUB
## LANGKAH 1
### CLONE PROJECT

<ul>
  <li>Buka folder untuk menyimpan repository, setelah itu buka terminal dan jalankan perintah berikut :</li>
</ul>

```bash
git clone https://github.com/ngafifhsym/flutter-chatsapp.git
```

## LANGKAH 2
### CARA MENGERJAKAN TASK

<ul>
  <li>Membuat branch baru dengan format (nama-kamu/nama-fitur) contoh (ngafif/widget)</li>
</ul>

<ul>
  <li>Kemudian checkout ke branch yang telah dibuat melalui terminal</li>
</ul>
  
  ```bash
git checkout (nama-branch)
```

<ul>
  <li>Ngoding .......</li>
</ul>

<ul>
  <li>Setelah menyelesaikan beberapa point jangan lupa commit sebagai checkpoint</li>
</ul>
  
  ```bash
git add .
git commit -m 'pesan commit'
```


### CARA SUBMIT TASK

<ul>
  <li>Untuk menghindari konflik lakukan git pull sebelum git push</li>
</ul>

  ```bash
git pull
```

<ul>
  <li>Push project </li>
</ul>

```
  git push origin (nama-branch)
```

## LANGKAH 3

<ul>
  <li>Checkout kembali ke branch main</li>
</ul>

```
git checkout main
```

<ul>
  <li>Lakukan git pull kembali</li>
</ul>

```
git pull origin main
```

<ul>
  <li>Hapus branch yang telah di push jika dirasa sudah tidak digunakan</li>
</ul>
<ul>
  <li>Untuk mengerjakan fitur baru silakan ulangi dari langkah 2</li>
</ul>
