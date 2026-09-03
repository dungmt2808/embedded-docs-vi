# Nguồn tài liệu tổng hợp — theo từng mảng kiến thức

*Đi kèm file `lo-trinh-embedded-nhat-ban-v2.md`. Mục nào có link thì tải/đọc trực tiếp; mục là sách thì tự tìm mua/mượn (không đưa link để tránh nguồn lậu).*

## Quy tắc kiểm tra giấy phép — áp dụng cho MỌI nguồn mới tìm được sau này

Trước khi dịch nguyên văn bất kỳ nguồn nào (không chỉ danh sách dưới đây), tìm dòng giấy phép ở footer trang, file `LICENSE`/`COPYING` trong repo, hoặc trang "About":

| Thấy gì | Xử lý |
|---|---|
| CC BY / CC BY-SA / MIT / Apache / GPL | **Dịch được**, ghi công đúng loại giấy phép |
| "All rights reserved", © kèm nhà xuất bản | **Chỉ viết lại bằng lời mình**, trích dẫn nguồn, không dịch nguyên văn |
| Không thấy công bố giấy phép gì cả | **Mặc định coi là đóng** — không suy luận "chắc mở vì đọc miễn phí". Miễn phí đọc và được phép tái phân phối là hai chuyện khác nhau |
| Docs chính thức của dự án mã nguồn mở (U-Boot, Yocto, Buildroot...) | **Kiểm tra riêng từng cái** — không suy luận theo giấy phép của phần mềm chính, docs đôi khi có giấy phép khác |

---

## 1. Linux Embedded — nền tảng, boot, build (GĐ1)

| Kiến thức | Nguồn | Loại | Ghi chú |
|---|---|---|---|
| System programming: process, IPC, signal, mmap, ioctl | **The Linux Programming Interface** — Michael Kerrisk | Sách | Đọc chọn chương, không cần đọc hết |
| Toolchain, boot flow, U-Boot, kernel build, device tree, rootfs, BusyBox, block/flash filesystem, cross-compile, license, software stack, debug tool | **Embedded Linux System Development** — Bootlin (bản dịch tiếng Việt đã có sẵn) | Slide, miễn phí | File đã upload — dùng làm xương sống giai đoạn này |
| Bản gốc tiếng Anh (đối chiếu khi bản dịch không rõ) | Cùng khóa trên, bản gốc | Slide, miễn phí | https://bootlin.com/doc/training/embedded-linux/embedded-linux-slides.pdf |

---

## 2. Linux Kernel Driver (GĐ2 ⭐ quan trọng nhất)

*Đây là phần bản dịch tiếng Việt KHÔNG có — bản dịch chỉ dừng ở mức "truy cập phần cứng từ userspace". Bắt buộc bổ sung nguồn dưới.*

| Kiến thức | Nguồn | Loại | Link |
|---|---|---|---|
| Kernel module, char driver, platform driver, DT binding, IRQ, spinlock/mutex, DMA — có lab thật trên board ARM | **Linux kernel and driver development** — Bootlin | Slide, miễn phí, 446 trang | https://bootlin.com/doc/training/linux-kernel/linux-kernel-slides.pdf |
| Driver mẫu, giải thích sâu từng API kernel | **Linux Device Drivers Development** — John Madieu | Sách, bản quyền đóng | — |
| Sách kinh điển nhất về viết driver — **dịch được** (CC BY-SA 2.0, xác nhận tại lwn.net) | **Linux Device Drivers, 3rd Ed.** (LDD3) — Corbet, Rubini, Kroah-Hartman | Sách, CC BY-SA 2.0 | `lwn.net/Kernel/LDD3/` — lưu ý viết cho kernel 2.6.10 (2005), khái niệm nền đúng nhưng API cụ thể đã đổi, ghi chú khi dịch |
| Đọc source kernel thật (driver mẫu trong `drivers/`) có cross-reference | Elixir — công cụ browse online của Bootlin | Web tool, miễn phí | https://elixir.bootlin.com |
| Tài liệu chính thức từng subsystem | Kernel Documentation | Web, miễn phí | https://docs.kernel.org |

---

## 3. Build System — Yocto & Buildroot (GĐ3 ⭐ JD yêu cầu trực tiếp)

*Bản dịch chỉ so sánh khái niệm Buildroot vs Yocto (mục 14.2) — không đủ sâu để build image thật.*

| Kiến thức | Nguồn | Loại | Link |
|---|---|---|---|
| BitBake, layer, recipe, bbappend, build image thật — có lab trên STM32MP1/BeagleBone/BeaglePlay | **Yocto Project and OpenEmbedded** — Bootlin | Slide, miễn phí, 328 trang | https://bootlin.com/doc/training/yocto/yocto-slides.pdf |
| Buildroot sâu hơn (nếu chọn Buildroot thay vì/thêm Yocto) | **Buildroot system development** — Bootlin | Slide, miễn phí, 344 trang | https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf |
| Tổng quan BSP, đóng gói kiến thức thành sách | **Mastering Embedded Linux Programming** — Chris Simmonds | Sách | — |

---

## 4. C sâu & Kiến trúc vi xử lý (GĐ4)

| Kiến thức | Nguồn | Loại | Ghi chú |
|---|---|---|---|
| C nâng cao: con trỏ, memory layout, UB, struct padding | **Expert C Programming: Deep C Secrets** — Peter van der Linden | Sách | Đọc chương 1, 2, 4, 6, 9, 10 |
| Kiến trúc Cortex-M, NVIC, exception model | **The Definitive Guide to ARM Cortex-M3/M4** — Joseph Yiu | Sách | Cortex-M7 (H7) kiến trúc gần giống M4, dùng được |
| Thanh ghi, clock tree, ngoại vi STM32H7 | **Reference Manual RM0433** | Tài liệu hãng | Tải từ trang chủ ST (st.com), tìm "RM0433" |
| Thông số điện, pinout board H7 | **Datasheet STM32H7** | Tài liệu hãng | Kèm theo RM0433 trên trang ST |
| Debug qua GDB: breakpoint/watchpoint, `info registers`, `x/`, backtrace | **Debugging with GDB** (manual chính thức) | Tài liệu, GNU FDL 1.3 | `sourceware.org/gdb/current/onlinedocs/gdb` — **giấy phép GFDL, không tương thích trực tiếp với CC BY-SA của site** (có Invariant Sections + Cover Text riêng). Đọc để hiểu, viết lại bằng lời mình (Tầng B), không dịch nguyên văn để tránh rắc rối tương thích giấy phép |
| CMake cross-compile cho ARM: toolchain file | Doc chính thức `cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html` + bài viết kubasejdak.com "cross-compile for embedded with CMake like a champ" | Web, hỗn hợp | Doc chính thức: **kiểm tra dòng bản quyền trước khi dịch** (không suy luận theo giấy phép BSD của phần mềm CMake). Bài blog: Tầng B, viết lại |

---

## 5. RTOS Internals (GĐ5)

*Bootlin không dạy mảng này (họ chuyên Linux) — dùng nguồn riêng.*

| Kiến thức | Nguồn | Loại | Link |
|---|---|---|---|
| Task, queue, semaphore, mutex, scheduler — lý thuyết + API | **Mastering the FreeRTOS Real Time Kernel** | Sách, miễn phí | https://www.freertos.org/Documentation/02-Kernel/07-Books-and-manual/01-RTOS_book |
| Cách task/queue thật sự vận hành bên trong | Source `tasks.c`, `queue.c` | Source code | Repo `FreeRTOS/FreeRTOS-Kernel` trên GitHub |
| Context switch bằng assembly, PendSV | Source `port.c` | Source code | Trong repo trên, đường dẫn `portable/GCC/ARM_CM7/r0p1/port.c` (đúng dòng chip H7) |

---

## 6. Real-time Linux & Debug (GĐ6)

| Kiến thức | Nguồn | Loại | Link |
|---|---|---|---|
| PREEMPT_RT, đo latency, cyclictest | **Real-time Linux with PREEMPT_RT** — Bootlin | Slide, miễn phí | Vào https://bootlin.com/docs/ rồi chọn khóa này |
| strace/ftrace/perf, debugging & tracing | **Debugging, tracing, profiling** — Bootlin | Slide, miễn phí | Cùng trang https://bootlin.com/docs/ |

---

## 7. Linh kiện điện tử & Đọc Schematic

| Kiến thức | Nguồn | Loại | Ghi chú |
|---|---|---|---|
| Giải thích linh kiện, thực hành trên board thật, phong cách đúng dân nhúng | **Phil's Lab** | Kênh YouTube, miễn phí | Tìm "Phil's Lab" trên YouTube |
| Tra cứu lý thuyết linh kiện khi cần | **Practical Electronics for Inventors** | Sách | Dùng để tra cứu, không đọc tuần tự |

---

## 8. AI trong nhúng (mức bổ sung, không ưu tiên)

| Kiến thức | Nguồn | Loại | Link |
|---|---|---|---|
| Dùng AI đọc nhanh codebase lớn (kernel, FreeRTOS) | Claude Code | Công cụ | App riêng, không phải tài liệu đọc |
| Runtime chạy model ML trên MCU | **TFLite Micro** | Source code, miễn phí | https://github.com/tensorflow/tflite-micro |
| Thư viện kernel NN tối ưu cho Cortex-M | **CMSIS-NN** — ARM | Source code, miễn phí | https://github.com/ARM-software/CMSIS-NN |
| Nền tảng khái niệm TinyML | **TinyML** — Pete Warden & Daniel Situnayake | Sách | Chỉ cần 2-3 chương đầu |

---

## Ghi chú khi dịch

- Tất cả link Bootlin (`bootlin.com`) đều tải trực tiếp về file PDF — không cần đăng nhập, không cần trả phí.
- Sách không có link vì đều là sách bản quyền — tự tìm mua hoặc mượn qua kênh hợp pháp.
- `elixir.bootlin.com` và `docs.kernel.org` là công cụ tra cứu, dùng thường xuyên chứ không đọc một lần.
- Nếu một khóa Bootlin có bản tiếng Việt tương tự bản đã có (không chắc, vì hiện tại chỉ thấy 1 bản dịch), luôn ưu tiên bản gốc tiếng Anh cho phần GĐ4 và GĐ5 vì đây là nội dung kỹ thuật sâu, bản dịch (nếu có bởi bên thứ 3 ngoài Bootlin) có thể không chuẩn thuật ngữ.

---

## Phụ lục — `m3y54m/Embedded-Engineering-Roadmap` (đánh giá)

Repo tổng hợp link rất lớn, 11.7k star, cập nhật liên tục, giấy phép **CC-BY-SA-4.0**. Đáng tin, nhưng dùng sai cách sẽ phản tác dụng.

**Bản chất:** đây là **thư mục tra cứu**, không phải khóa học có trình tự — chính tác giả cảnh báo không cần đọc hết. Phủ toàn ngành Embedded (cả phần cứng lẫn phần mềm): PCB/EMC, FPGA, DSP lý thuyết, giao thức không dây, control theory, cảm biến/actuator... **phần lớn nằm ngoài track Embedded Linux của cậu.** Không cố phủ hết repo — chỉ tra khi bí, đúng mục cần.

**6 nguồn mới lọc ra được, đáng thêm vào bảng ở trên:**

| Nguồn | Dùng cho | Link |
|---|---|---|
| *The Linux Kernel Module Programming Guide* | GĐ2, ngắn gọn, thực hành, cập nhật hơn LDD3 | `sysprog21.github.io/lkmpg` |
| Yocto Project docs chính thức | GĐ3, tra cứu khi build image thật (cập nhật hơn slide) | `docs.yoctoproject.org` |
| U-Boot docs chính thức | GĐ1, phần U-Boot | `u-boot.readthedocs.io` |
| Interrupt Blog (Memfault) | GĐ4 — có bài riêng: viết bootloader từ đầu, linker script, watchdog, DFU | tìm "Interrupt Memfault blog" |
| Cùng blog: "ARM Cortex-M RTOS Context Switching" | GĐ5 — khớp thẳng phần mini-RTOS | tìm tên bài trên Interrupt blog |

