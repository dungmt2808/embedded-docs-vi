# Quy ước thuật ngữ: khi nào dịch, khi nào giữ tiếng Anh

!!! note "Tóm tắt"
    Ba nhóm từ, ba cách xử lý khác nhau. Danh sách này sống — thêm dần khi gặp từ mới,
    không cần dịch đúng ngay từ đầu.

## Vì sao cần một quy ước rõ ràng

Không có quy tắc thì mỗi trang dịch một kiểu — trang này gọi "ngắt", trang khác gọi "interrupt",
người đọc không biết có phải cùng một khái niệm không. Ba nhóm dưới đây dựa trên cách tiếng Việt
kỹ thuật thật sự được dùng: giáo trình đại học Việt Nam đã có vocab chuẩn cho các khái niệm nền
tảng từ lâu, nhưng ngành embedded/kernel/RTOS thì kỹ sư Việt Nam dùng thẳng tiếng Anh trong công
việc hàng ngày — dịch cưỡng ép nhóm này ra tiếng Việt tạo cảm giác xa lạ hơn là dễ hiểu.

## Nhóm 1 — Luôn dịch sang tiếng Việt

Khái niệm nền tảng CS/kiến trúc máy tính, đã có vocab chuẩn từ giáo trình đại học Việt Nam,
dịch không gây khó hiểu:

| Tiếng Anh | Tiếng Việt |
|---|---|
| function | hàm |
| variable | biến |
| pointer | con trỏ |
| array | mảng |
| data type | kiểu dữ liệu |
| loop | vòng lặp |
| statement | câu lệnh |
| memory | bộ nhớ |
| register | thanh ghi |
| interrupt *(khái niệm chung)* | ngắt |
| thread | luồng |
| process | tiến trình |
| compile *(động từ)* | biên dịch |
| link *(động từ)* | liên kết |
| synchronization | đồng bộ hóa |
| variable scope | phạm vi biến |
| library | thư viện |
| floating point | dấu phẩy động |
| instruction set | tập lệnh |
| sensor | cảm biến |
| environment variable | biến môi trường |

**Lưu ý riêng cho "ngắt" vs "ISR"**: dịch "interrupt" thành "ngắt" khi nói về khái niệm/cơ chế
chung ("xử lý ngắt", "ưu tiên ngắt"). Giữ nguyên "ISR" (Interrupt Service Routine) khi nói tên
riêng của hàm xử lý — đây là quy ước, không phải mâu thuẫn.

**Lưu ý riêng cho "luồng" vs "task"**: dịch "thread" thành "luồng" khi nói khái niệm chung của hệ
điều hành (vd: "nhiều luồng tranh chấp một biến"). Giữ nguyên "task" khi nói cụ thể đơn vị thực thi
trong RTOS (FreeRTOS gọi thẳng là Task, API `xTaskCreate`...) — hai từ gần nghĩa nhưng chỉ vật khác
nhau trong ngữ cảnh RTOS, không thay thế cho nhau được.

## Nhóm 2 — Luôn giữ tiếng Anh

Thuật ngữ chuyên ngành embedded/kernel/RTOS — kỹ sư Việt Nam dùng thẳng tiếng Anh trong công việc,
không có bản dịch tiếng Việt nào được dùng phổ biến hơn bản gốc:

`driver` · `kernel` · `firmware` · `bootloader` · `toolchain` · `struct` · `task` · `module`
*(kernel module)* · `mutex` ·
`semaphore` · `spinlock` · `scheduler` · `stack` · `heap` · `flash` · `cache` · `padding` ·
`alignment` · `callback` · `watchdog` · `backtrace` · `breakpoint` · `watchpoint` ·
`cross-compile` · `linker` *(danh từ — công cụ)* · `compiler` *(danh từ — công cụ)* ·
`debugger` *(danh từ — công cụ)* · `sysroot` · `header` · `tuple` *(kiến trúc tuple)* ·
`binary` *(danh từ — file đã biên dịch)* · `hard float` · `soft float` · `endianness` · `headless`
*(setup không cắm màn hình/bàn phím)* · `serial console` · `baud rate` · `image`
*(danh từ — bản OS để flash vào thẻ nhớ)* · `board` · `logic analyzer` · `breadboard` ·
`jumper` *(dây jumper)* · `boot` *(danh từ/động từ — quá trình khởi động hệ thống)* ·
`filesystem` · `mount` *(động từ)* · `init` *(tiến trình đầu tiên ở user space, PID 1)* ·
`initramfs` · `initrd` · `panic` *(kernel panic)* · `prompt` · `partition` ·
`build` *(động từ — biên dịch/dựng ra từ source)* · `script` · `command line` ·
`user space` · `kernel space` · `character device` · `block device` ·
`major`/`minor` *(số hiệu thiết bị)* · `sysfs` · `debugfs` · `configfs` · `devtmpfs` ·
`pseudo filesystem` · `applet` *(đơn vị lệnh trong BusyBox)* · `symlink` · `device file` · `shell` ·
`node` *(Device Tree)* · `property` *(Device Tree)* · `cell` *(đơn vị giá trị 32-bit trong
property)* · `overlay` *(Device Tree overlay)* · `binding` *(Device Tree binding)* ·
`label` *(nhãn đặt trước node để tham chiếu, vd `i2c1:`)* · `pin-muxing`/`pinmux`
*(gán một chân vật lý cho một trong nhiều chức năng khả dụng)* · `buffer` · `recovery`
*(cơ chế khôi phục/reflash khi thiết bị hỏng hoặc chưa có bootloader)* · `socket`
*(network socket)* · `upstream` *(driver/patch đã được cộng đồng kernel chấp nhận vào tree
chính thức)* · `out-of-tree` *(driver/patch nằm ngoài tree chính thức)*

## Nhóm 3 — Luôn giữ nguyên (tên riêng, viết tắt, tên file/section)

Không dịch dưới bất kỳ hình thức nào — đây là tên riêng, không phải khái niệm:

- **Giao thức/chuẩn**: I2C, SPI, UART, USB, CAN, GPIO, DMA, ARM, RISC-V
- **Tên section/file**: `.text`, `.data`, `.bss`, `.map`, `.dts`, `.dtsi`
- **Tên công cụ/lệnh**: GDB, CMake, Make, Git, OpenOCD, Yocto, Buildroot, BitBake, Kconfig,
  defconfig, menuconfig, `libgpiod`, `i2c-tools`, `i2c-dev`, `spidev`, `UIO`, `libusb`, `udev`,
  `mdev`, `pinctrl` *(subsystem/tên node trong kernel)*, `libfdt`
- **Tên subsystem kernel**: PWM, MTD, DRM, ALSA, V4L (Video4Linux), IIO, RTC, hwmon, remoteproc
- **Tên linh kiện**: MOSFET, LDO, TVS, Schottky
- **Viết tắt**: ISR, MMIO, IRQ, RTOS, BSP, DT (device tree), API, ABI, MMU, FPU, FDT (flattened
  device tree), phandle, BIOS, UEFI, ACPI, SPL/TPL (Secondary/Tertiary Program Loader),
  FIT (Flat Image Tree)
- **Tên property chuẩn trong Device Tree**: `compatible`, `reg`, `status`, `interrupts`,
  `interrupt-parent`, `interrupts-extended`, `interrupt-controller`, `#address-cells`,
  `#size-cells`, `#interrupt-cells`, `#clock-cells`, `#reset-cells`, `#dma-cells`, `#gpio-cells`,
  `clocks`, `resets`, `dmas`, `gpios`, `pinctrl-0`/`pinctrl-1`/`pinctrl-names`, `chosen`,
  `bootargs`, `stdout-path`, `model`, `device_type`

## Khi gặp từ chưa có trong 3 nhóm trên

Ưu tiên theo trực giác: từ đó là **khái niệm CS phổ thông** cấp đại học → dịch (Nhóm 1). Từ đó là
**danh từ kỹ thuật chuyên ngành** embedded/kernel → giữ tiếng Anh (Nhóm 2). Không chắc → giữ tiếng
Anh, an toàn hơn dịch sai hoặc dịch ra một từ không ai dùng. Thêm từ mới vào đúng bảng ở trên khi
quyết định xong, để trang sau không phải quyết định lại từ đầu.

---
*Danh sách tự biên, đúc kết từ cách dùng thật trong các trang đã viết — không phải dịch từ nguồn
nào, cập nhật liên tục khi gặp từ mới.*
