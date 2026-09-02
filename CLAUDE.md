# CLAUDE.md

Hướng dẫn cho Claude Code khi làm việc trong repo này.

## Repo này là gì

Site tài liệu tiếng Việt về Embedded Linux (kernel driver, Yocto, RTOS, bare-metal),
dựng bằng MkDocs Material, publish qua GitHub Pages. Xem cấu trúc nav đầy đủ:
@mkdocs.yml

Danh sách nguồn tham khảo và tầng giấy phép của từng nguồn:
@docs/phu-luc/nguon-va-giay-phep.md

## LUẬT GIẤY PHÉP — tuân thủ tuyệt đối, không có ngoại lệ

Repo public, mang giấy phép CC BY-SA. Mọi trang docs phải theo đúng một trong hai luồng dưới đây —
**luôn hỏi tôi trước nếu không chắc một nguồn thuộc luồng nào.**

### Luồng A — Nguồn trong `references/` có giấy phép mở (CC BY-SA, MIT, Apache)

Được dịch/phóng tác trực tiếp. Khi soạn trang thuộc luồng này:

- Đọc file PDF/source tương ứng trong `references/`
- Dịch sát nghĩa sang tiếng Việt, KHÔNG cần giữ nguyên văn từng câu — được viết lại cho tự nhiên
- Cuối trang PHẢI có block ghi công theo mẫu:

  ```
  ---
  *Trang này dịch/phóng tác từ [TÊN KHÓA/SÁCH] của [TÁC GIẢ/TỔ CHỨC],
  giấy phép [CC BY-SA 3.0 / MIT / ...]. Bản gốc: [URL].*
  ```

- Nguồn thuộc luồng này: toàn bộ slide Bootlin (`references/bootlin/`),
  LDD3 (`references/ldd3/`), source FreeRTOS-Kernel (`references/freertos-kernel/`)

### Luồng B — Mọi nguồn khác (sách bản quyền đóng, video, RM0433, GDB manual, blog thường)

**TUYỆT ĐỐI KHÔNG** mở file nguồn tương ứng (nếu có trong `references/` hoặc được dán vào chat)
rồi tóm tắt/diễn đạt lại nó — kể cả khi đổi hết từ ngữ. Đó vẫn là dịch trá hình: bám cấu trúc,
ví dụ, trình tự lập luận của một tác phẩm cụ thể thì đổi từ không biến nó thành nội dung gốc.

**Cách làm đúng — giải thích từ kiến thức nền, không đọc nguồn cụ thể:**
1. Tôi nói tên khái niệm cần viết (vd: "giải thích struct padding")
2. Claude Code giải thích bằng hiểu biết chung, **không mở file sách trong `references/`**,
   tự nghĩ ví dụ minh họa mới — không tra "sách X giải thích đoạn này thế nào" rồi phỏng theo
3. Tôi đọc lại, chỉnh/bổ sung theo kinh nghiệm thật của mình (bug đã gặp, chi tiết board cụ thể)
4. Cuối trang ghi: `*Khái niệm phổ biến trong tài liệu embedded/kernel nói chung — tham khảo thêm: [TÊN SÁCH].*`

**Nếu tôi dán nguyên văn một đoạn từ sách vào chat và yêu cầu "diễn đạt lại":**
Từ chối, giải thích ngắn gọn lý do, đề nghị giải thích khái niệm đó **từ đầu** thay vì viết lại
đoạn đã dán.

Nếu tôi yêu cầu thẳng "soạn trang X dựa trên sách Y" (ngụ ý đọc file sách cụ thể) —
nhắc lại: giải thích từ kiến thức nền, không mở file sách.

## Tính năng đã tự động — không thêm markup riêng cho từng trang

- **Comment (Giscus)** và **highlight/ghi chú của người đọc (Hypothesis)**: chạy tự động trên
  mọi trang qua `overrides/main.html`. Không viết thêm code hay nhắc gì trong nội dung trang.
- **Biểu đồ (Mermaid)**: đã bật ở `mkdocs.yml`, nhưng phải chủ động thêm vào từng trang khi phù hợp —
  xem mục "Biểu đồ" trong hai khung mẫu bên dưới.

## Hình ảnh — ưu tiên vẽ lại, hạn chế cắt ảnh

Ba loại, ba cách xử lý:

1. **Sơ đồ khái niệm (boot flow, cây device tree, chuyển trạng thái task, luồng probe...)**:
   **luôn vẽ lại bằng Mermaid**, không cắt ảnh từ slide. Sơ đồ do Claude Code tạo từ hiểu biết
   là nội dung gốc, không vướng bản quyền, nét trên mọi màn hình, khớp theme sáng/tối. Đây là
   cách mặc định.
2. **Ảnh thật của người dùng (screenshot menuconfig, output dmesg, waveform logic analyzer,
   ảnh board đấu dây)**: người dùng tự chụp, đặt vào `docs/<mục>/img/`, chèn bằng
   `![mô tả](img/ten.png)`. Đây là nội dung gốc giá trị nhất — khuyến khích dùng nhiều.
   Claude Code KHÔNG tạo được loại này, chỉ nhắc người dùng chèn vào chỗ phù hợp.
3. **Ảnh cắt trực tiếp từ slide Bootlin**: hợp pháp (CC BY-SA) nhưng **hạn chế** — chỉ khi sơ đồ
   quá phức tạp để vẽ lại. Claude Code KHÔNG cắt được ảnh trong PDF (chỉ đọc được chữ);
   người dùng tự cắt bằng `pdfimages`/`pdftoppm`. Nếu dùng, bắt buộc ghi công ngay dưới ảnh.

Ranh giới bản quyền: vẽ lại sơ đồ kỹ thuật từ hiểu biết = an toàn (ý tưởng không thuộc bản quyền);
sao chép y hệt hình minh họa có tính sáng tạo riêng = cần cân nhắc, ưu tiên vẽ lại.

## Cấu trúc trang

Mỗi trang thuộc một trong hai loại — xác định loại trước khi viết:

- **Trang khái niệm** (giải thích một ý tưởng/cơ chế): theo khung @templates/trang-khai-niem.md
- **Trang thực hành** (hướng dẫn làm một việc cụ thể, có thể tự kiểm tra kết quả): theo khung @templates/trang-thuc-hanh.md

Nếu một trang có cả lý thuyết lẫn thao tác dài, tách thành 2 trang riêng thay vì gộp —
xem `mkdocs.yml` để thêm mục nav nếu cần.

## Văn phong

- Tiếng Việt, ngôi thứ nhất số ít khi cần ("mình", không dùng "tôi/chúng tôi" trang trọng)
- Câu ngắn. **Thuật ngữ kỹ thuật: theo đúng 3 nhóm trong @docs/phu-luc/thuat-ngu.md** — không tự
  quyết định dịch hay giữ nguyên một từ mà không tra bảng đó trước. Gặp từ chưa có trong bảng,
  quyết định xong thì thêm vào đúng nhóm, không quyết định lại ở trang sau.
- Mỗi trang 300-800 từ, không viết dài kiểu giáo trình
- Code block giữ nguyên comment gốc bằng tiếng Anh nếu trích từ source, thêm giải thích tiếng Việt bên ngoài block

## Quy trình một phiên làm việc

1. Nói rõ đang soạn trang nào (đường dẫn trong `docs/`) và thuộc luồng A hay B
2. Sau khi Claude Code viết xong: chạy `mkdocs serve` xem trước tại localhost, tự đọc lại
3. Chỉ commit sau khi đã đọc lại — không auto-commit hàng loạt

## Lệnh hay dùng

```bash
mkdocs serve              # xem preview local trước khi commit
mkdocs build --strict     # kiểm tra lỗi link/nav trước khi push
git add docs/<file>.md && git commit -m "docs: soạn <tên trang>"
```
