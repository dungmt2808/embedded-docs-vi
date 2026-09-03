# 28 câu tự kiểm tra

!!! note "Cách dùng"
    Làm 3 lần để đo tiến bộ: **tuần 1** (baseline, chưa học gì — để biết điểm xuất phát),
    **cuối tháng 12**, và **tháng 4/2027**. Mỗi lần viết câu trả lời ra giấy, không tra cứu;
    câu nào bí thì đánh dấu — đó là bản đồ điểm yếu.

    Hàng tuần: sáng thứ Bảy lấy 3 câu ra tự trả lời (30–45 phút), bí mới mở tài liệu.

## C / Kiến trúc

1. `volatile` giải quyết vấn đề gì? 3 tình huống bắt buộc dùng?
2. `static` có mấy nghĩa trong C?
3. `struct {char a; int b; char c;}` chiếm bao nhiêu byte, tại sao?
4. `.data` và `.bss` khác nhau thế nào? Cái nào chiếm chỗ trong file binary?
5. Từ lúc cấp nguồn đến khi `main()` chạy, MCU làm những gì?
6. MMU vs MPU? Tại sao Cortex-M không có MMU?
7. Cache write-back vs write-through? Cache coherency gây bug gì khi DMA?

## RTOS

8. Context switch trên Cortex-M diễn ra thế nào? Tại sao PendSV mà không phải SysTick?
9. MSP và PSP dùng khi nào?
10. Priority inversion là gì? Priority inheritance sửa ra sao?
11. Mutex vs binary semaphore khác nhau thật sự ở đâu?
12. Tại sao phải có API `...FromISR`?
13. Tại sao không được `malloc` trong ISR?
14. Phát hiện stack overflow của một task bằng cách nào?

## Linux

15. Từ lúc bật nguồn đến khi shell hiện ra, hệ thống Linux nhúng đi qua những bước nào?
16. Device tree để làm gì? Không có nó thì sao?
17. Platform driver `probe()` được gọi khi nào, do ai gọi?
18. Spinlock vs mutex: cái nào dùng được trong interrupt context, tại sao?
19. Top half / bottom half? Tasklet vs workqueue chọn khi nào?
20. Tại sao phải `copy_to_user` thay vì gán trực tiếp?
21. `kmalloc` vs `vmalloc`?
22. Linux mặc định không real-time vì sao? PREEMPT_RT thay đổi gì?
23. Yocto: layer, recipe, bbappend khác nhau thế nào? Khi nào dùng Yocto thay Buildroot?
24. U-Boot làm gì trước khi trao quyền cho kernel?

## Ngoại vi / mạch

25. Vẽ waveform SPI mode 0 và mode 3.
26. I2C clock stretching là gì? Arbitration hoạt động ra sao?
27. Tụ decoupling để làm gì, đặt ở đâu, tại sao 100nF song song 10µF?
28. Pull-up bao nhiêu ohm cho I2C, phụ thuộc yếu tố nào?

---
*Nội dung tự biên, trích từ lộ trình học cá nhân.*