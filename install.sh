#!/bin/bash
clear
echo "=========================================="
echo "    INSTALLER ADBEAST                     "
echo "    Created by: Tri Atmoko                "
echo "=========================================="
echo ""
echo "[*] Memulai proses instalasi dari server..."

# --- GANTI DENGAN LINK RAW FILE ZIP KAMU ---
URL_ZIP="https://github.com/TRI-ATMOKO-ID/Adbeast/raw/refs/heads/main/Adbeast.zip"

# 1. Bersihkan sisa instalasi yang gagal/lama
rm -rf $PREFIX/share/adbeast_system
rm -f $PREFIX/bin/adbeast

# 2. Download file ZIP secara diam-diam
echo "[*] Men-download data sistem (mungkin butuh beberapa detik)..."
wget -qO adbeast_temp.zip $URL_ZIP

# 3. Ekstrak ZIP ke dalam ruang aman sistem Termux ($PREFIX/share)
echo "[*] Mengekstrak dan merakit sistem..."
unzip -q adbeast_temp.zip -d $PREFIX/share/
rm adbeast_temp.zip # Hapus sampah ZIP

# 4. Ubah nama folder hasil ekstrak agar rapi
mv $PREFIX/share/botku.dist $PREFIX/share/adbeast_system

# 5. Berikan izin eksekusi pada file biner aslinya
chmod +x $PREFIX/share/adbeast_system/botku.bin

# 6. MEMBUAT WRAPPER SCRIPT (JALAN PINTAS SAKTI)
echo "[*] Mengatur Global Command..."
cat << 'EOF' > $PREFIX/bin/adbeast
#!/bin/bash

# Simpan lokasi markas rahasia bot
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
