#!/bin/bash
clear
echo "=========================================="
echo "    INSTALLER ADBEAST PREMIUM BOT         "
echo "    Created by: Tri Atmoko                "
echo "=========================================="
echo ""
echo "[*] Memulai proses instalasi dari server..."

# Link ZIP kamu
URL_ZIP="https://raw.githubusercontent.com/TRI-ATMOKO-ID/Adbeast/main/Adbeast.zip"

# 1. Bersihkan sisa instalasi
rm -rf $PREFIX/share/adbeast_system
rm -f $PREFIX/bin/adbeast

# 2. Download & Ekstrak ZIP
echo "[*] Men-download dan merakit sistem..."
wget -qO adbeast_temp.zip $URL_ZIP
unzip -q adbeast_temp.zip -d $PREFIX/share/
rm adbeast_temp.zip

# 3. Ubah nama folder hasil ekstrak
mv $PREFIX/share/botku.dist $PREFIX/share/adbeast_system

# 4. HAPUS LIBRARY RACUN (Agar tidak bentrok dengan Android)
echo "[*] Membersihkan library sistem yang bentrok..."
rm -f $PREFIX/share/adbeast_system/libc++.so
rm -f $PREFIX/share/adbeast_system/libc++_shared.so
rm -f $PREFIX/share/adbeast_system/libunwind.so
rm -f $PREFIX/share/adbeast_system/liblog.so
rm -f $PREFIX/share/adbeast_system/libc.so
rm -f $PREFIX/share/adbeast_system/libdl.so
rm -f $PREFIX/share/adbeast_system/libm.so

# 5. Berikan izin eksekusi pada file biner
chmod +x $PREFIX/share/adbeast_system/botku.bin

# 6. MEMBUAT WRAPPER SCRIPT TERBARU
echo "[*] Mengatur Global Command..."
cat << 'EOF' > $PREFIX/bin/adbeast
#!/bin/bash

# Simpan lokasi markas bot
DIST_DIR="$PREFIX/share/adbeast_system"

# WAJIB: Hapus pengaturan Python bawaan Termux agar bot tidak bingung
unset PYTHONHOME
unset PYTHONPATH

# Paksa Termux untuk membaca file .so milik bot
export LD_LIBRARY_PATH="$DIST_DIR:$LD_LIBRARY_PATH"

# Jalankan bot tanpa perlu men-setting PYTHONHOME, biarkan Nuitka bekerja sendiri
"$DIST_DIR/botku.bin" "$@"
EOF

# Beri izin jalan untuk jalan pintasnya
chmod +x $PREFIX/bin/adbeast

echo ""
echo "[V] Instalasi Berhasil Sempurna! 🎉"
echo "=========================================="
echo "Bot sudah tertanam di sistem Termux kamu."
echo "Untuk menyalakan bot, ketik perintah:"
echo ""
echo "adbeast"
echo "=========================================="
