# Memory layout: .text, .data, .bss

!!! note "Tóm tắt"
    Vì sao firmware chạy được từ flash, và vì sao biến global có giá trị khởi tạo cần một bước
    "copy" đặc biệt trước khi `main()` chạy.

## Vì sao cần biết cái này

Đây là kiến thức đứng sau file linker script và file `startup.s` mà cậu sẽ tự viết — không hiểu
memory layout thì linker script chỉ là những dòng chép lại không hiểu vì sao đúng. Nó cũng là thứ
đầu tiên cần tra khi build ra lỗi kiểu "region FLASH overflowed" hoặc firmware chạy sai chỉ vì
biến global đọc ra giá trị rác.

## Ba vùng bộ nhớ chính

Trình biên dịch/linker chia code và dữ liệu thành các "section", ba section quan trọng nhất:

- **`.text`** — code đã biên dịch (mã máy) và các hằng số `const`. Không đổi khi chạy, nằm hẳn
  trong flash (bộ nhớ không mất khi cúp điện).
- **`.data`** — biến global/static **có** giá trị khởi tạo khác 0 (`int count = 5;`). Cần đọc/ghi
  được lúc chạy nên phải nằm trong RAM — nhưng giá trị khởi tạo ban đầu (5) phải được lưu ở đâu đó
  không mất điện, tức flash.
- **`.bss`** — biến global/static **không** khởi tạo hoặc khởi tạo bằng 0 (`int count;` hoặc
  `int count = 0;`). Cũng nằm trong RAM lúc chạy, nhưng không cần lưu giá trị ban đầu trong flash
  vì "giá trị ban đầu" luôn là 0 — tiết kiệm dung lượng flash đáng kể so với `.data`.

## LMA và VMA — chỗ hay gây nhầm nhất

Mỗi section trong file `.elf` có hai địa chỉ:

- **LMA (Load Memory Address)** — địa chỉ nơi dữ liệu **được lưu trữ** khi chưa chạy (trong flash)
- **VMA (Virtual/run-time Memory Address)** — địa chỉ nơi CPU **truy cập** dữ liệu đó lúc chạy

Với `.text`, hai địa chỉ này giống nhau — code chạy thẳng tại chỗ nó nằm trong flash (execute-in-place).

Với `.data`, hai địa chỉ **khác nhau**: LMA nằm trong flash (chỗ lưu giá trị khởi tạo), VMA nằm
trong RAM (chỗ CPU sẽ đọc/ghi lúc chạy). Đây là lý do đoạn code đầu tiên trong `startup.s`, trước
khi gọi `main()`, luôn có một vòng lặp copy: đọc dữ liệu từ LMA (flash), ghi sang VMA (RAM) —
thường thấy dưới tên biến linker `_sidata`, `_sdata`, `_edata` trong linker script.

```
Flash (LMA)                          RAM (VMA)
┌─────────────┐                    ┌─────────────┐
│   .text     │ ← chạy tại chỗ     │             │
├─────────────┤                    ├─────────────┤
│ .data (bản  │ ─── copy lúc ───→  │   .data     │ ← CPU đọc/ghi ở đây
│  gốc, chỉ    │     startup        │             │
│  đọc)        │                    ├─────────────┤
└─────────────┘                    │   .bss      │ ← chỉ cần zero-init,
                                     │             │   không cần copy từ flash
                                     └─────────────┘
```

`.bss` không cần bước copy này — startup code chỉ cần zero-init cả vùng đó (`memset` về 0), vì
giá trị ban đầu luôn là 0, không cần lưu bản gốc trong flash.

## Đọc file `.map`

Sau khi build, linker xuất ra file `.map` liệt kê chính xác từng symbol (hàm, biến) nằm ở địa chỉ
nào, section nào, chiếm bao nhiêu byte. Đây là công cụ tra cứu thực tế khi:

- Biết chương trình đang dùng bao nhiêu % flash/RAM — tổng kích thước `.text + .data` so với dung
  lượng flash, `.data + .bss` so với dung lượng RAM
- Tìm biến/hàm nào đang "ăn" nhiều bộ nhớ nhất khi cần tối ưu
- Xác nhận một biến thật sự nằm đúng section mong đợi (vd: kiểm tra một mảng lớn có bị đưa nhầm
  vào `.data` thay vì `.bss` do lỡ khởi tạo giá trị khác 0)

Format khác nhau tùy toolchain, nhưng luôn có một bảng liệt kê symbol kèm địa chỉ và kích thước —
tìm đúng tên biến/hàm cần tra là đọc được ngay.

## Liên quan

- **Đọc trước:** [C nâng cao](c-nang-cao.md) — struct padding cũng ảnh hưởng trực tiếp kích thước
  các section này
- **Đọc tiếp:** `startup-linker.md` — áp dụng trực tiếp kiến thức này để tự viết linker script
- **Tự kiểm tra:** câu 3–4 trong [28 câu tự kiểm tra](../phu-luc/28-cau-tu-kiem-tra.md)

---
*Khái niệm phổ biến trong tài liệu embedded/lập trình hệ thống nói chung — tham khảo thêm:
tài liệu GNU linker (`ld`), reference manual của chip đang dùng.*
