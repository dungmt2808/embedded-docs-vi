# Ghi chép Embedded Linux

Đây là nhật ký học Embedded Linux của mình — kernel driver, Yocto, RTOS, bare-metal — viết lại
bằng tiếng Việt vì lúc học phải ghép nhặt từ nhiều nguồn tiếng Anh rời rạc, viết ra để tự mình
đọc lại cho có hệ thống. Nếu cậu cũng đang tự học embedded ở trình độ tương tự thì chắc dùng
được, nhưng đây không phải giáo trình đầy đủ — chỗ nào mình chưa đụng tới thì trang đó chưa có.

## Các mục chính

- **[Linux nền tảng](01-linux-nen-tang/toolchain.md)** — toolchain, boot flow, U-Boot, build kernel, device tree, rootfs
- **[Kernel driver](02-kernel-driver/kernel-module.md)** — viết char driver, platform driver, xử lý ngắt, đồng bộ hóa, driver I2C
- **[Yocto & BSP](03-yocto-bsp/khai-niem.md)** — build image, viết layer riêng, recipe cho kernel module, so sánh với Buildroot
- **[C & Bare-metal](04-c-va-bare-metal/c-nang-cao.md)** — memory layout, startup code, linker script, lập trình thanh ghi trực tiếp
- **[RTOS internals](05-rtos-internals/freertos-kien-truc.md)** — kiến trúc FreeRTOS, context switch, cơ chế đồng bộ trong RTOS
- **[Real-time & Project](06-realtime-project/preempt-rt.md)** — PREEMPT_RT, đo latency, một project hybrid Linux + RTOS thực tế
- **[Phần cứng](07-phan-cung/linh-kien.md)** — linh kiện cơ bản, đọc schematic, debug phần cứng
- **[AI nhúng](08-ai-nhung/ai-de-hoc.md)** — chạy model AI trên thiết bị nhúng, TinyML

Ngoài ra còn mục **Bắt đầu** (cài môi trường, chọn phần cứng) và **Phụ lục** (thuật ngữ, câu tự
kiểm tra, nguồn tham khảo) hỗ trợ cho các mục trên.

## Giấy phép

Toàn bộ nội dung trong site này theo **CC BY-SA 4.0**. Phần nào dịch/phóng tác từ nguồn nào,
giấy phép gốc ra sao — xem chi tiết ở [Nguồn và giấy phép](phu-luc/nguon-va-giay-phep.md).
