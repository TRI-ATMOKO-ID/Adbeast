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

# 1. Bersihkan sisa instalasi yang gagal
rm -rf $PREFIX/share/adbeast_system
rm -f $PREFIX/bin/adbeast

# 2. Download file ZIP
echo "[*] Men-download data sistem..."
wget -qO adbeast_temp.zip $URL_ZIP

# 3. Ekstrak ZIP ke dalam ruang aman sistem
echo "[*] Mengekstrak dan merakit sistem..."
unzip -q adbeast_temp.zip -d $PREFIX/share/
rm adbeast_temp.zip

# 4. Ubah nama folder hasil ekstrak
mv $PREFIX/share/botku.dist $PREFIX/share/adbeast_system

# 5. JURUS SAPU JAGAT: HAPUS SEMUA LIBRARY RACUN NUITKA
echo "[*] Membersihkan library sistem yang bentrok..."
rm -f $PREFIX/share/adbeast_system/libc++.so
rm -f $PREFIX/share/adbeast_system/libc++_shared.so
rm -f $PREFIX/share/adbeast_system/libunwind.so
rm -f $PREFIX/share/adbeast_system/liblog.so
rm -f $PREFIX/share/adbeast_system/libc.so
rm -f $PREFIX/share/adbeast_system/libdl.so
rm -f $PREFIX/share/adbeast_system/libm.so

# 6. Berikan izin eksekusi pada file biner
chmod +x $PREFIX/share/adbeast_system/botku.bin

# 7. MEMBUAT WRAPPER SCRIPT (Pake metode Echo agar 100% aman)
echo "[*] Mengatur Global Command..."
echo '#!/bin/bash' > $PREFIX/bin/adbeast
echo 'DIST_DIR="'$PREFIX'/share/adbeast_system"' >> $PREFIX/bin/adbeast
echo 'export LD_LIBRARY_PATH="$DIST_DIR:$LD_LIBRARY_PATH"' >> $PREFIX/bin/adbeast
echo '"$DIST_DIR/botku.bin" "$@"' >> $PREFIX/bin/adbeast

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
