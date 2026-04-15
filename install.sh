#!/bin/bash
clear
echo "=========================================="
echo "    INSTALLER ADBEAST PREMIUM BOT         "
echo "    Created by: Tri Atmoko                "
echo "=========================================="
echo ""
echo "[*] Mempersiapkan Mesin Inti Termux..."
# Memastikan pengguna memiliki mesin Python asli Termux yang tidak amnesia
pkg install python -y > /dev/null 2>&1

echo "[*] Memulai proses instalasi dari server..."
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

# 4. HAPUS LIBRARY RACUN & MESIN AMNESIA
echo "[*] Menyesuaikan bot dengan sistem Android..."
rm -f $PREFIX/share/adbeast_system/libc++.so
rm -f $PREFIX/share/adbeast_system/libc++_shared.so
rm -f $PREFIX/share/adbeast_system/libunwind.so
rm -f $PREFIX/share/adbeast_system/liblog.so
rm -f $PREFIX/share/adbeast_system/libc.so
rm -f $PREFIX/share/adbeast_system/libdl.so
rm -f $PREFIX/share/adbeast_system/libm.so
# ---> INI KUNCI UTAMANYA: Hapus mesin bawaan Nuitka <---
rm -f $PREFIX/share/adbeast_system/libpython*.so

# 5. Berikan izin eksekusi pada file biner
chmod +x $PREFIX/share/adbeast_system/botku.bin

# 6. MEMBUAT WRAPPER SCRIPT
echo "[*] Mengatur Global Command..."
cat << 'EOF' > $PREFIX/bin/adbeast
#!/bin/bash
DIST_DIR="$PREFIX/share/adbeast_system"

# Paksa bot untuk membaca library tambahannya, TAPI meminjam libpython milik Termux
export LD_LIBRARY_PATH="$DIST_DIR:$LD_LIBRARY_PATH"

# Jalankan bot! (Tanpa unset, biar pakai environment asli Termux yang sehat)
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
