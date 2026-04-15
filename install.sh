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
echo "[*] Men-download data sistem (mungkin butuh beberapa detik)..."
wget -qO adbeast_temp.zip $URL_ZIP

# 3. Ekstrak ZIP ke dalam ruang aman sistem
echo "[*] Mengekstrak dan merakit sistem..."
unzip -q adbeast_temp.zip -d $PREFIX/share/
rm adbeast_temp.zip

# 4. Ubah nama folder hasil ekstrak
mv $PREFIX/share/botku.dist $PREFIX/share/adbeast_system

# ==========================================================
# 5. JURUS PAMUNGKAS: HAPUS LIBRARY YANG BENTROK!
echo "[*] Membersihkan library C++ yang bentrok dengan Android..."
rm -f $PREFIX/share/adbeast_system/libc++.so
rm -f $PREFIX/share/adbeast_system/libc++_shared.so
rm -f $PREFIX/share/adbeast_system/libunwind.so
# ==========================================================

# 6. Berikan izin eksekusi pada file biner
chmod +x $PREFIX/share/adbeast_system/botku.bin

# 7. MEMBUAT WRAPPER SCRIPT
echo "[*] Mengatur Global Command..."
cat << 'EOF' > $PREFIX/bin/adbeast
#!/bin/bash
DIST_DIR="$PREFIX/share/adbeast_system"

# Karena file biang kerok sudah dihapus, kita kembali ke settingan awal yang paling stabil:
export LD_LIBRARY_PATH="$DIST_DIR:$LD_LIBRARY_PATH"

# Jalankan bot langsung dari lokasi user saat ini
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
echo "=========================================="# Simpan lokasi markas rahasia bot
DIST_DIR="$PREFIX/share/adbeast_system"

# BALIK URUTANNYA: Baca sistem Termux dulu, baru baca folder bot
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIST_DIR"

# Jalankan bot langsung dari lokasi user saat ini
"$DIST_DIR/botku.bin" "$@"
EOF

# Beri izin jalan untuk jalan pintasnya
chmod +x $PREFIX/bin/adbeast

echo ""
echo "[V] Instalasi Berhasil Sempurna! 🎉"
echo "=========================================="
echo "cukup ketik perintah:"
echo "adbeast"
echo "=========================================="
