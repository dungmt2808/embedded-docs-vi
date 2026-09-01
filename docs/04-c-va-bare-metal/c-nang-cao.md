# C nâng cao cho firmware

!!! note "Tóm tắt"
    Bốn thứ hay bị hỏi phỏng vấn và hay gây bug khó hiểu nhất trong C khi viết firmware:
    con trỏ hàm, `volatile`, `static`, và struct padding.

## Vì sao cần biết cái này

Đọc source kernel hay FreeRTOS, gặp `struct file_operations` hay `TaskFunction_t` là gặp con trỏ hàm
ngay dòng đầu. Không hiểu `volatile` thì viết driver polling một thanh ghi mà compiler tối ưu mất,
chương trình treo vô lý không debug ra. Không để ý struct padding thì gửi struct qua UART/SPI rồi
thấy dữ liệu lệch byte so với thiết kế — bug loại này rất khó đoán vì code "nhìn đúng".

## Con trỏ hàm

Con trỏ hàm lưu địa chỉ của một hàm, gọi được như gọi hàm bình thường qua con trỏ đó.

```c
int (*op)(int, int);   // khai báo con trỏ hàm nhận 2 int, trả về int
op = add;               // gán địa chỉ hàm add
int r = op(3, 4);        // gọi qua con trỏ
```

Giá trị thật của nó nằm ở chỗ nhét vào struct để tạo ra kiểu "đa hình" trong C — đây chính là cách
kernel Linux tổ chức driver:

```c
struct file_operations {
    ssize_t (*read)(struct file *, char __user *, size_t, loff_t *);
    ssize_t (*write)(struct file *, const char __user *, size_t, loff_t *);
    // ...
};
```

Mỗi driver tự điền hàm `read`/`write` của mình vào struct này. Kernel gọi `fops->read(...)` mà không
cần biết đang gọi driver nào — đúng cơ chế mà C++ làm bằng vtable, chỉ là C phải tự tay dựng lấy.

## `volatile`

Compiler mặc định giả định giá trị một biến chỉ đổi khi code của mình gán cho nó, nên được phép
cache giá trị đó trong thanh ghi CPU để chạy nhanh hơn, thay vì đọc lại từ RAM mỗi lần. `volatile`
tắt giả định này — buộc compiler đọc/ghi thẳng vào địa chỉ bộ nhớ mỗi lần truy cập.

Ba tình huống bắt buộc phải dùng:

1. **Thanh ghi ánh xạ bộ nhớ (MMIO)** — giá trị đổi do phần cứng, không phải do code
   ```c
   #define STATUS_REG (*(volatile uint32_t *)0x40001000)
   while (!(STATUS_REG & READY_BIT)) { }   // thiếu volatile: compiler có thể tối ưu
                                             // thành vòng lặp vô hạn đọc 1 lần rồi cache
   ```
2. **Biến sửa trong ISR, đọc ở main loop** — main loop không biết ISR chạy chen ngang lúc nào
3. **Biến chia sẻ giữa nhiều task RTOS** — tương tự, task khác có thể đổi giá trị bất cứ lúc nào

`volatile` không thay thế cho khóa đồng bộ (mutex/spinlock) khi cần tính atomic — nó chỉ đảm bảo
compiler không cache sai, không đảm bảo truy cập là an toàn khi có nhiều luồng tranh chấp cùng lúc.

## `static`

Ba nghĩa hoàn toàn khác nhau tùy ngữ cảnh khai báo:

- **Biến local trong hàm**: giữ nguyên giá trị qua các lần gọi hàm, thay vì cấp phát lại trên stack
  mỗi lần — hữu ích cho bộ đếm, cache nội bộ hàm
- **Biến/hàm ở file scope (ngoài mọi hàm)**: giới hạn linkage chỉ trong file `.c` đó, file khác không
  `extern` gọi vào được — cách chuẩn để ẩn implementation detail trong C, tương đương `private` thô sơ
- **Biến trong struct/class ở C++**: dùng chung cho mọi instance — không liên quan hai nghĩa trên

## Struct padding

Compiler tự chèn byte đệm giữa các field để mỗi field nằm đúng địa chỉ "aligned" theo kích thước
của nó (CPU đọc dữ liệu 4-byte nhanh nhất khi địa chỉ chia hết cho 4). Ví dụ trên kiến trúc 32-bit:

```c
struct Example {
    char  a;   // offset 0, 1 byte
    // 3 byte đệm ở đây — để b bắt đầu ở offset chia hết cho 4
    int   b;   // offset 4, 4 byte
    char  c;   // offset 8, 1 byte
    // 3 byte đệm cuối — để sizeof(struct) chia hết cho alignment lớn nhất (4)
};
// sizeof(Example) == 12, không phải 6
```

Đổi thứ tự field (nhóm các field cùng kích thước lại) giảm được padding — struct trên nếu viết
`int b; char a; char c;` chỉ tốn 8 byte. Khi struct này còn dùng để mô tả layout một gói tin gửi
qua UART/SPI, padding không mong muốn giữa hai máy build bằng compiler khác nhau (hoặc cùng compiler
nhưng khác cấu hình alignment) là nguồn bug rất khó thấy — cách phòng tránh phổ biến là
`#pragma pack(1)` hoặc `__attribute__((packed))` để tắt hẳn padding cho struct giao tiếp.

## Liên quan

- **Đọc tiếp:** [Memory layout](memory-layout.md) — `.data`/`.bss` cũng liên quan trực tiếp đến
  cách compiler xếp biến trong bộ nhớ
- **Tự kiểm tra:** câu 1–4 trong [28 câu tự kiểm tra](../phu-luc/28-cau-tu-kiem-tra.md)

---
*Khái niệm phổ biến trong tài liệu C và lập trình hệ thống nói chung — tham khảo thêm:
Expert C Programming: Deep C Secrets (Peter van der Linden).*
