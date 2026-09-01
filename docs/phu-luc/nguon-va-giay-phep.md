# Nguồn và giấy phép

!!! note "Tóm tắt"
    Site này dịch/phóng tác một phần từ tài liệu giấy phép mở, phần còn lại là nội dung tự viết.
    Trang này ghi công đầy đủ theo yêu cầu của giấy phép CC BY-SA, và là bảng tra khi cần biết
    một nguồn có được dịch hay không.

## Giấy phép của site này

Toàn bộ nội dung trong `docs/` phát hành theo **CC BY-SA 4.0**. Đây không phải lựa chọn tùy ý:
site có dịch tài liệu Bootlin (CC BY-SA 3.0) và LDD3 (CC BY-SA 2.0), nên điều khoản ShareAlike
bắt buộc bản phái sinh phải giữ cùng giấy phép.

## Ghi công

**Bootlin** — [bootlin.com/docs](https://bootlin.com/docs/), CC BY-SA 3.0.
Các mục **Linux nền tảng**, **Kernel driver**, **Yocto & BSP**, và trang `preempt-rt.md`
dịch/phóng tác từ bộ slide đào tạo của Bootlin. Từng trang có ghi rõ khóa nguồn ở cuối trang.

**Linux Device Drivers, 3rd Edition** — Jonathan Corbet, Alessandro Rubini, Greg Kroah-Hartman,
[lwn.net/Kernel/LDD3](https://lwn.net/Kernel/LDD3/), CC BY-SA 2.0. Dùng bổ sung cho mục
**Kernel driver**. Lưu ý: sách viết cho kernel 2.6.10 (2005) — khái niệm nền vẫn chuẩn nhưng
nhiều API đã đổi, các trang có dùng LDD3 đều ghi chú chỗ nào đã lỗi thời.

**FreeRTOS-Kernel** — [github.com/FreeRTOS/FreeRTOS-Kernel](https://github.com/FreeRTOS/FreeRTOS-Kernel),
MIT. Code trích dẫn trong mục **RTOS internals** giữ nguyên header bản quyền gốc.

**TFLite Micro, CMSIS-NN** — Apache 2.0, dùng trong mục **AI nhúng**.

## Quy tắc kiểm tra giấy phép — áp dụng cho mọi nguồn mới

Trước khi dịch nguyên văn bất kỳ nguồn nào, tìm dòng giấy phép ở footer trang, file
`LICENSE`/`COPYING` trong repo, hoặc trang "About":

| Thấy gì | Xử lý |
|---|---|
| CC BY / CC BY-SA / MIT / Apache / GPL | **Dịch được**, ghi công đúng loại giấy phép |
| "All rights reserved", © kèm nhà xuất bản | **Chỉ viết lại bằng lời mình**, trích dẫn nguồn, không dịch nguyên văn |
| Không thấy công bố giấy phép gì cả | **Mặc định coi là đóng** — miễn phí đọc và được phép tái phân phối là hai chuyện khác nhau |
| Docs chính thức của dự án mã nguồn mở | **Kiểm tra riêng từng cái** — docs đôi khi có giấy phép khác phần mềm chính |

## Bảng nguồn theo mục

### Tầng A — được dịch trực tiếp

| Nguồn | Giấy phép | Dùng cho mục |
|---|---|---|
| Bootlin — *Embedded Linux System Development* | CC BY-SA 3.0 | 01 Linux nền tảng |
| Bootlin — *Linux kernel and driver development* | CC BY-SA 3.0 | 02 Kernel driver |
| Bootlin — *Yocto Project and OpenEmbedded* | CC BY-SA 3.0 | 03 Yocto & BSP |
| Bootlin — *Buildroot system development* | CC BY-SA 3.0 | 03 Yocto & BSP |
| Bootlin — *Real-time Linux with PREEMPT_RT* | CC BY-SA 3.0 | 06 Real-time |
| *Linux Device Drivers 3rd Ed.* (LDD3) | CC BY-SA 2.0 | 02 Kernel driver |
| FreeRTOS-Kernel source | MIT | 05 RTOS internals |
| TFLite Micro, CMSIS-NN | Apache 2.0 | 08 AI nhúng |

### Tầng B — chỉ viết lại bằng lời mình

Các nguồn dưới đây **không** được dịch nguyên văn. Nội dung liên quan trên site là do tự viết từ
kiến thức nền, có tham khảo ý tưởng:

*The Linux Programming Interface* (Kerrisk) · *Expert C Programming* (van der Linden) ·
*The Definitive Guide to ARM Cortex-M3/M4* (Yiu) · *Linux Device Drivers Development* (Madieu) ·
*Mastering Embedded Linux Programming* (Simmonds) · *TinyML* (Warden & Situnayake) ·
*Mastering the FreeRTOS Real Time Kernel* · Reference Manual RM0433 và datasheet ST ·
Phil's Lab (YouTube) · Interrupt Blog (Memfault) · các bài blog kỹ thuật khác

**GDB manual** (*Debugging with GDB*) là trường hợp riêng: nó có giấy phép mở (GNU FDL 1.3) nhưng
kèm Invariant Sections và Cover Text, **không tương thích trực tiếp** với CC BY-SA của site này —
nên vẫn xếp Tầng B, đọc để hiểu rồi viết lại, không dịch nguyên văn.

## Công cụ tra cứu thường dùng

- [elixir.bootlin.com](https://elixir.bootlin.com) — đọc source Linux kernel có cross-reference
- [docs.kernel.org](https://docs.kernel.org) — tài liệu chính thức từng subsystem
- [docs.yoctoproject.org](https://docs.yoctoproject.org), [u-boot.readthedocs.io](https://u-boot.readthedocs.io)

---
*Trang này là nghĩa vụ pháp lý theo điều khoản Attribution của CC BY-SA, không phải mục tùy chọn.
Cập nhật mỗi khi thêm nguồn mới.*
