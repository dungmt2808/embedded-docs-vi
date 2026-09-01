# Linh kiện điện tử cơ bản trong mạch số

!!! note "Tóm tắt"
    Năm nhóm linh kiện xuất hiện trong hầu hết mọi schematic mạch nhúng, và vai trò cụ thể
    của từng nhóm — để đọc schematic không chỉ là nhìn hình.

## Vì sao cần biết cái này

Đọc schematic mà không hiểu vì sao có một điện trở ở đây, một tụ ở kia thì chỉ là nhìn hình vẽ,
không tự debug được mạch thật. Phần lớn lỗi "board không lên" mức phần cứng bắt nguồn từ đúng
những linh kiện cơ bản này thiếu, sai giá trị, hoặc đặt sai vị trí.

## Điện trở

- **Pull-up / pull-down**: giữ một chân GPIO ở mức logic xác định (cao hoặc thấp) khi chưa có gì
  chủ động điều khiển nó — tránh trạng thái "lơ lửng" (floating) đọc giá trị ngẫu nhiên do nhiễu.
  Giá trị điển hình 4.7k–10kΩ cho GPIO thường; I2C cần giá trị thấp hơn (2.2k–4.7kΩ) vì bus I2C
  dùng open-drain, điện trở pull-up ở đây còn quyết định tốc độ chuyển mức tín hiệu.
- **Hạn dòng LED**: giới hạn dòng qua LED để không vượt dòng tối đa cho phép, tính theo
  `R = (Vnguồn − Vled) / Idòng mong muốn`.
- **Cầu phân áp**: hai điện trở nối tiếp chia điện áp theo tỷ lệ, dùng khi cần đưa một điện áp
  cao hơn về mức GPIO đọc được an toàn (vd: đo điện áp pin qua ADC).

## Tụ điện

- **Decoupling/bypass**: đặt sát ngay chân nguồn của IC, lọc nhiễu tần số cao sinh ra khi IC
  chuyển trạng thái đột ngột, đồng thời cấp dòng tức thời mà nguồn chính (ở xa hơn, có trở kháng
  dây dẫn) không đáp ứng kịp. Thường thấy kết hợp hai giá trị: tụ nhỏ (100nF) lọc nhiễu tần số
  cao, tụ lớn hơn (10–100µF) lọc dao động tần số thấp — càng gần chân nguồn IC càng hiệu quả,
  đặt xa vài mm cũng đã giảm tác dụng đáng kể vì điện cảm ký sinh của đường mạch.
- **Tụ lọc nguồn (bulk)**: dung lượng lớn hơn, đặt gần đầu vào nguồn của cả board, ổn định điện
  áp khi tải thay đổi đột ngột.

## Diode

- **Flyback**: bắt buộc khi điều khiển tải có cuộn cảm (relay, motor, cuộn dây) — lúc ngắt dòng
  đột ngột, cuộn cảm sinh ra điện áp ngược rất lớn (theo `V = -L·di/dt`) có thể phá hỏng linh kiện
  điều khiển nếu không có đường xả năng lượng này qua diode mắc ngược song song với cuộn cảm.
- **TVS (Transient Voltage Suppressor)**: bảo vệ chống xung điện áp đột biến (ESD, sét lan truyền)
  trên các đường tín hiệu ra ngoài board.
- **Schottky**: sụt áp thuận thấp hơn diode thường đáng kể, hay dùng để chống cắm ngược cực nguồn,
  hoặc OR hai nguồn cấp điện (vd: USB và pin) mà không tổn hao nhiều điện áp.

## MOSFET

Dùng phổ biến nhất như một công tắc điện tử điều khiển bằng tín hiệu logic:

- **Low-side switching**: MOSFET đặt giữa tải và GND, dễ điều khiển hơn (chỉ cần đưa gate lên
  cao để bật) — dùng khi không cần tải nối trực tiếp GND với mạch khác.
- **High-side switching**: MOSFET đặt giữa nguồn và tải, cần mạch điều khiển gate phức tạp hơn
  (thường cần driver riêng) nhưng cho phép tải giữ GND chung với hệ thống.
- **Gate resistor**: điện trở nhỏ (chục Ω) mắc nối tiếp vào chân gate, hạn dòng nạp/xả tụ ký sinh
  giữa gate và nguồn/máng, tránh dao động (ringing) và giảm nhiễu phát xạ khi chuyển trạng thái.

## Bộ điều áp: LDO vs Buck

- **LDO (Linear Dropout Regulator)**: mạch đơn giản, ít linh kiện, ít nhiễu — nhưng hiệu suất
  thấp khi chênh lệch điện áp vào/ra lớn, vì phần chênh lệch đó tiêu tán thành nhiệt
  (`hiệu suất ≈ Vout / Vin`). Hợp cho tải dòng nhỏ, hoặc khi chênh áp vào/ra nhỏ.
- **Buck (switching regulator)**: hiệu suất cao hơn nhiều (85–95%) ở mọi mức chênh áp nhờ chuyển
  mạch thay vì tiêu tán tuyến tính, nhưng phức tạp hơn (cần cuộn cảm, tụ lọc, mạch phản hồi) và
  sinh nhiễu tần số chuyển mạch — cần layout cẩn thận hơn LDO để không ảnh hưởng tín hiệu analog
  nhạy cảm gần đó.

## Liên quan

- **Đọc tiếp:** `doc-schematic.md` — áp dụng trực tiếp để đọc schematic board thật
- **Đọc tiếp:** `debug-phan-cung.md` — quy trình debug dựa trên hiểu vai trò từng linh kiện này

---
*Khái niệm điện tử cơ bản phổ biến trong mọi tài liệu thiết kế mạch — tham khảo thêm:
Practical Electronics for Inventors, kênh Phil's Lab (YouTube).*
