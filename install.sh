#!/bin/bash
clear
echo "=========================================="
echo "    INSTALLER ADBEAST PREMIUM BOT         "
echo "    Created by: Tri Atmoko                "
echo "=========================================="
echo ""
echo "[*] Mempersiapkan Mesin Inti Termux..."

# 1. Pastikan mesin Python dan mesin pembaca gambar (Tesseract) terpasang
pkg update -y
pkg install python tesseract -y > /dev/null 2>&1

echo "[*] Menginstall library pendukung (Telethon, Rich, dll)..."
# 2. Install semua modul pip yang dibutuhkan oleh bot kamu
pip install telethon requests rich pillow pytesseract > /dev/null 2>&1

echo "[*] Memulai proses instalasi dari server..."
# Link langsung ke file .pyc kamu
URL_PYC="https://raw.githubusercontent.com/TRI-ATMOKO-ID/Adbeast/main/bot.pyc"

# 3. Bersihkan sisa instalasi lama
rm -rf $PREFIX/share/adbeast_system
rm -f $PREFIX/bin/adbeast

# 4. Buat markas baru untuk bot
mkdir -p $PREFIX/share/adbeast_system

# 5. Download file PYC langsung ke markasnya (Tanpa Unzip)
echo "[*] Men-download file sistem..."
wget -qO $PREFIX/share/adbeast_system/bot.pyc $URL_PYC

# 6. MEMBUAT WRAPPER SCRIPT (Jalan Pintas)
echo "[*] Mengatur Global Command..."
cat << 'EOF' > $PREFIX/bin/adbeast
#!/bin/bash
# Menjalankan file .pyc menggunakan mesin Python bawaan Termux
python $PREFIX/share/adbeast_system/bot.pyc "$@"
EOF

# 7. Beri izin jalan untuk jalan pintasnya
chmod +x $PREFIX/bin/adbeast

echo ""
echo "[V] Instalasi Berhasil Sempurna! 🎉"
echo "=========================================="
echo "Bot sudah tertanam di sistem Termux kamu."
echo "Untuk menyalakan bot, ketik perintah:"
echo ""
echo "adbeast"
echo "=========================================="
