# Nội dung từng trang — kế hoạch viết chi tiết

*Đi kèm `mkdocs.yml` (cấu trúc nav) và `nguon-tai-lieu-tong-hop.md` (nguồn + giấy phép).
K = khung khái niệm · T = khung thực hành.*

**Cột Luồng:**
- **A** — dịch trực tiếp từ nguồn giấy phép mở (Bootlin, LDD3, source MIT/Apache), ghi công
- **B** — giải thích từ kiến thức nền, không đọc sách cụ thể (xem `CLAUDE.md`)
- **Gốc** — nội dung của riêng cậu (log dự án, log tiến độ), không có "nguồn" để phân loại,
  viết tự do, không áp dụng luật A/B

## 00 — Bắt đầu

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `moi-truong.md` | Setup RPi (OS, SSH, UART serial console), toolchain cross-compile, GitHub repo | T | Gốc |
| `phan-cung.md` | Board đang dùng (H7, RPi), linh kiện cần mua (logic analyzer, USB-TTL, cảm biến I2C) | K | Gốc |

## 01 — Linux nền tảng *(GĐ1, T9, dịch từ Bootlin)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `toolchain.md` | Cross-compile, `gcc/ld/objdump/readelf`, sysroot, static vs dynamic linking | K | A |
| `boot-flow.md` | ROM → bootloader → U-Boot → kernel → initramfs → init/systemd | K | A |
| `u-boot.md` | Vào prompt, `bootargs`/`bootcmd`, tftp/nfs boot, build U-Boot từ source | T | A |
| `build-kernel.md` | Clone kernel RPi, `menuconfig`, cross-compile, boot bằng kernel tự build | T | A |
| `device-tree.md` | Cú pháp `.dts`/`.dtsi`/overlay, node/compatible/reg/interrupts, tự viết 1 overlay | T | A |
| `rootfs.md` | Rootfs gồm gì, BusyBox, init system | K | A |
| `userspace-hardware.md` | `libgpiod`/`spidev`/`i2c-dev` — đọc cảm biến I2C từ userspace | T | A |

## 02 — Kernel driver ⭐ *(GĐ2, T10-11, dịch từ Bootlin + LDD3)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `kernel-module.md` | `init`/`exit`, `insmod`/`rmmod`, module params, Makefile out-of-tree | T | A |
| `char-driver.md` | `alloc_chrdev_region`, `cdev_init`, `file_operations`, `copy_to/from_user` | T | A |
| `device-model.md` | Bus/device/driver, `struct device`, sysfs — nền tảng trước platform driver | K | A |
| `platform-driver.md` | `of_match_table`, `compatible`, `probe()`/`remove()`, `devm_*` | T | A |
| `interrupt.md` | `request_irq`, threaded IRQ, top half/bottom half (tasklet, workqueue) | K | A |
| `dong-bo.md` | Spinlock vs mutex (atomic context), atomic_t, completion, wait queue | K | A |
| `i2c-driver.md` | I2C client driver cho cảm biến thật, expose qua sysfs/IIO | T | A |
| `debug.md` | `dmesg`, `debugfs`, `ftrace`, đọc kernel oops | T | A |

## 03 — Yocto & BSP ⭐ *(GĐ3, T12-T1, dịch từ Bootlin)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `khai-niem.md` | BitBake, layer, recipe, `local.conf`/`bblayers.conf` | K | A |
| `build-image.md` | Build `core-image-minimal` cho RPi bằng `meta-raspberrypi` | T | A |
| `layer-rieng.md` | Tạo `meta-mylayer`, viết recipe cho app C của mình | T | A |
| `recipe-kernel-module.md` | Recipe cho kernel module ở mục 02, `bbappend` thêm DT overlay | T | A |
| `buildroot-so-sanh.md` | Buildroot vs Yocto — khi nào dùng cái nào | K | A |

## 04 — C & Bare-metal *(GĐ4, T2 — Tết rơi vào đây)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `c-nang-cao.md` | Lấp từ `c-gaps.md` tích lũy: con trỏ hàm, `volatile`/`static`, struct padding | K | **B** ✅ đã soạn |
| `memory-layout.md` | `.text/.data/.bss`, LMA vs VMA, đọc file `.map` | K | **B** ✅ đã soạn |
| `startup-linker.md` | Vector table, `Reset_Handler`, tự viết `startup.s` + linker script | T | B |
| `thanh-ghi.md` | Blinky + UART không dùng HAL, clock tree bằng tay (HSE→PLL→SYSCLK) | T | B |
| `ngoai-vi.md` | UART/SPI/I2C mức tín hiệu — bắt waveform bằng logic analyzer | T | B |
| `debug-gdb-jtag.md` | GDB qua OpenOCD: breakpoint vs hardware watchpoint, đọc register/memory, backtrace đối chiếu HardFault, RTOS-aware debug | T | B |
| `cmake-build.md` | Toolchain file CMake cross-compile ARM, build lại project bare-metal H7 bằng CMake thay Makefile | T | B |

## 05 — RTOS internals *(GĐ5, T3)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `freertos-kien-truc.md` | Đọc `tasks.c`/`queue.c` — TCB, ready/delayed list | K | A *(source MIT)* |
| `context-switch.md` | Đọc `port.c` — PendSV, MSP/PSP, exception stack frame | K | A *(source MIT)* |
| `dong-bo-rtos.md` | Priority inversion, mutex vs semaphore | K | **B** ✅ đã soạn |
| `mini-rtos.md` | Log xây mini-RTOS: scheduler, context switch, benchmark so với FreeRTOS | T | Gốc |

## 06 — Real-time & Project chủ lực *(GĐ6, T4)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `preempt-rt.md` | Vì sao Linux mặc định không real-time, PREEMPT_RT thay đổi gì | K | A *(Bootlin PREEMPT_RT deck)* |
| `do-latency.md` | Build kernel RT, đo bằng `cyclictest`, so sánh trước/sau | T | Gốc *(log đo đạc riêng)* |
| `project-hybrid.md` | Log project chủ lực: STM32H7 ↔ RPi qua SPI, driver tự viết, số liệu đo | T | Gốc |

## 07 — Phần cứng *(xuyên suốt)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `linh-kien.md` | Điện trở/tụ/diode/MOSFET/LDO — vai trò trong mạch số | K | **B** ✅ đã soạn |
| `doc-schematic.md` | Reverse-engineer schematic H7 + RPi: power tree, BOOT pin, SWD | T | Gốc |
| `debug-phan-cung.md` | Quy trình "board không lên": đo rail, đo clock theo thứ tự nào | T | B |

## 08 — AI nhúng *(tùy chọn, chỉ làm nếu dư thời gian)*

| Trang | Nội dung | Khung | Luồng |
|---|---|---|---|
| `ai-de-hoc.md` | Dùng Claude Code đọc nhanh codebase lớn — cách làm, không phải lý thuyết | K | Gốc |
| `tinyml.md` | TFLite Micro + CMSIS-NN chạy model nhỏ trên H7 | T | A *(code, Apache 2.0)* + B *(giải thích)* |

## Phụ lục

| Trang | Nội dung | Luồng |
|---|---|---|
| `28-cau-tu-kiem-tra.md` | 28 câu hỏi tự kiểm tra (đã có sẵn từ lộ trình) | Gốc |
| `thuat-ngu.md` | Quy ước dịch/giữ nguyên thuật ngữ — 3 nhóm, dùng chuẩn cho mọi trang | Gốc ✅ đã soạn |
| `c-gaps.md` | Nhật ký gap C — ghi khi đọc kernel/RTOS gặp construct không hiểu | Gốc |
| `nguon-va-giay-phep.md` | Ghi công Bootlin/LDD3 + quy tắc kiểm tra giấy phép + bảng Tầng A/B | Gốc ✅ đã soạn |
| `nhat-ky.md` | Log tiến độ hàng tuần — đối chiếu với bảng theo dõi trong lộ trình | Gốc |

---

## Danh sách Luồng B đầy đủ (10 trang) — để duyệt qua khi viết

| # | Trang | Trạng thái |
|---|---|---|
| 1 | `04-c-va-bare-metal/c-nang-cao.md` | ✅ Đã soạn — không cần chi tiết board |
| 2 | `04-c-va-bare-metal/memory-layout.md` | ✅ Đã soạn — không cần chi tiết board |
| 3 | `05-rtos-internals/dong-bo-rtos.md` | ✅ Đã soạn — không cần chi tiết board |
| 4 | `07-phan-cung/linh-kien.md` | ✅ Đã soạn — không cần chi tiết board |
| 5 | `04-c-va-bare-metal/startup-linker.md` | Cần chi tiết chip (dung lượng flash/RAM đúng variant H7) — làm qua Claude Code |
| 6 | `04-c-va-bare-metal/thanh-ghi.md` | Cần chi tiết chip (địa chỉ thanh ghi, pin thật) — làm qua Claude Code |
| 7 | `04-c-va-bare-metal/ngoai-vi.md` | Cần dữ liệu logic analyzer thật — làm qua Claude Code |
| 8 | `04-c-va-bare-metal/debug-gdb-jtag.md` | Cần config OpenOCD thật cho board — làm qua Claude Code |
| 9 | `04-c-va-bare-metal/cmake-build.md` | Cần đường dẫn toolchain thật trên máy — làm qua Claude Code |
| 10 | `07-phan-cung/debug-phan-cung.md` | Nên có kinh nghiệm debug thật trước khi viết | Làm sau, khi đã có ca thực tế |

