# MacOS Setup Scripts

Bộ script này giúp tự động hóa quá trình cài đặt và cấu hình môi trường phát triển trên macOS, đặc biệt cho Apple Silicon Macs.

## Nội dung

1. [setup-terminal.sh](#setup-terminalsh)
2. [setup-app.sh](#setup-appsh)

## Yêu cầu

- macOS chạy trên Apple Silicon (M1, M2, v.v.)
- Quyền admin trên máy

## Hướng dẫn sử dụng

### setup-terminal.sh

Script này cài đặt và cấu hình các công cụ cơ bản cho terminal.

Bao gồm:

- Homebrew
- Zsh
- Oh My Zsh

Cách sử dụng:

1. Mở Terminal
2. Chạy các lệnh sau:

```bash
chmod +x setup-terminal.sh
./setup-terminal.sh
```

3. Sau khi script hoàn tất, khởi động lại Terminal hoặc mở một Terminal mới.

### setup-app.sh

Script này cài đặt các ứng dụng và công cụ phát triển phổ biến.

Bao gồm:

- NVM (Node Version Manager)
- Node.js 20
- Nhiều ứng dụng hữu ích khác (xem danh sách trong script)

Cách sử dụng:

1. Đảm bảo bạn đã chạy `setup-terminal.sh` và khởi động lại Terminal
2. Chạy các lệnh sau:

```bash
chmod +x setup-app.sh
./setup-app.sh
```

## Lưu ý

- Các script có thể yêu cầu nhập mật khẩu admin trong quá trình chạy.
- Quá trình cài đặt có thể mất một thời gian tùy thuộc vào tốc độ internet và hiệu suất máy tính.
- Một số ứng dụng có thể yêu cầu cấu hình thêm sau khi cài đặt.
- Sau khi chạy cả hai script, nên khởi động lại máy tính để đảm bảo tất cả thay đổi được áp dụng.

## Tùy chỉnh

Bạn có thể chỉnh sửa các script để thêm hoặc bớt các ứng dụng theo nhu cầu cá nhân.

## Đóng góp

Nếu bạn có bất kỳ đề xuất cải tiến nào, vui lòng tạo issue hoặc pull request.

## Giấy phép

[MIT License](LICENSE)

```

Bạn có thể sử dụng nội dung này cho file README.md trong repository Git của bạn. Nó cung cấp một tổng quan về các script, hướng dẫn sử dụng, và các thông tin quan trọng khác cho người dùng.

Đừng quên tạo một file LICENSE nếu bạn muốn sử dụng giấy phép MIT hoặc bất kỳ giấy phép mã nguồn mở nào khác chodự án của mình.
```
