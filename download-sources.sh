#!/usr/bin/env bash
# Chạy 1 lần trong thư mục gốc repo: bash download-sources.sh
# Chỉ tải nguồn Tầng A (giấy phép mở, được dịch) — xem phu-luc/nguon-va-giay-phep.md
set -e

mkdir -p references/bootlin references/ldd3

echo "== Bootlin (CC BY-SA 3.0) =="
curl -fL -o references/bootlin/embedded-linux-slides.pdf \
  https://bootlin.com/doc/training/embedded-linux/embedded-linux-slides.pdf
curl -fL -o references/bootlin/linux-kernel-slides.pdf \
  https://bootlin.com/doc/training/linux-kernel/linux-kernel-slides.pdf
curl -fL -o references/bootlin/yocto-slides.pdf \
  https://bootlin.com/doc/training/yocto/yocto-slides.pdf
curl -fL -o references/bootlin/buildroot-slides.pdf \
  https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf

echo "== LDD3 — Linux Device Drivers 3rd Ed. (CC BY-SA 2.0) =="
curl -fL -o references/ldd3/ldd3_pdf.tar.bz2 \
  https://lwn.net/images/pdf/LDD3/ldd3_pdf.tar.bz2
tar -xjf references/ldd3/ldd3_pdf.tar.bz2 -C references/ldd3/
rm references/ldd3/ldd3_pdf.tar.bz2

echo "== FreeRTOS-Kernel source (MIT) =="
git clone --depth 1 https://github.com/FreeRTOS/FreeRTOS-Kernel references/freertos-kernel

echo "== TFLite Micro + CMSIS-NN (Apache 2.0) — tùy chọn, chỉ cần cho GĐ AI nhúng =="
# git clone --depth 1 https://github.com/tensorflow/tflite-micro references/tflite-micro
# git clone --depth 1 https://github.com/ARM-software/CMSIS-NN references/cmsis-nn

cat >> .gitignore << 'EOF'

# Nguồn tham khảo tải về — không commit (nặng, và một số chỉ dùng để tra cứu nội bộ)
references/
EOF

echo "Xong. references/ nặng — đã thêm vào .gitignore, không commit lên GitHub."
