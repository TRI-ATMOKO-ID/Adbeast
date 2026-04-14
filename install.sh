#!/bin/bash
clear
echo "[*] Memulai Instalasi AdBeast Bot..."

# Download file biner langsung dari GitHub dan taruh di folder sistem Termux
wget -qO $PREFIX/bin/adbeast https://raw.githubusercontent.com/TRI-ATMOKO-ID/Adbeast/main/botku.bin

# Berikan izin eksekusi
chmod +x $PREFIX/bin/adbeast

echo "[V] Instalasi Selesai! Ketik 'adbeast' untuk menjalankan bot."
