# MacOS Setup Scripts

Bộ script này giúp tự động hóa quá trình cài đặt và cấu hình môi trường phát triển trên macOS. Hỗ trợ cả **Homebrew** và **Nix** package managers.

## 📋 Nội dung

### Scripts sử dụng Homebrew
1. [setup-terminal.sh](#setup-terminalsh) - Thiết lập terminal với Homebrew
2. [setup-app.sh](#setup-appsh) - Cài đặt ứng dụng với Homebrew

### Scripts sử dụng Nix
3. [setup-nix.sh](#setup-nixsh) - Cài đặt Nix package manager
4. [setup-terminal-nix.sh](#setup-terminal-nixsh) - Thiết lập terminal với Nix
5. [setup-apps-nix.sh](#setup-apps-nixsh) - Cài đặt ứng dụng với Nix

## 🎯 Yêu cầu

- macOS (hỗ trợ cả Intel và Apple Silicon)
- Quyền admin trên máy
- Kết nối internet

## 🚀 Hướng dẫn sử dụng

### Tùy chọn 1: Sử dụng Homebrew (Traditional)

#### setup-terminal.sh

Script này cài đặt và cấu hình các công cụ cơ bản cho terminal.

**Bao gồm:**
- Homebrew
- Zsh
- Oh My Zsh
- Git aliases

**Cách sử dụng:**

```bash
chmod +x setup-terminal.sh
./setup-terminal.sh
# Khởi động lại terminal sau khi hoàn tất
```

#### setup-app.sh

Script này cài đặt các ứng dụng và công cụ phát triển.

**Bao gồm:**
- NVM & Node.js 20
- Development tools (Maven, Protocol Buffers, pnpm, Bun)
- GUI Applications (VS Code, Spotify, Discord, etc.)
- CLI tools (NestJS CLI, Git tools)

**Cách sử dụng:**

```bash
chmod +x setup-app.sh
./setup-app.sh
```

### Tùy chọn 2: Sử dụng Nix (Recommended)

#### setup-nix.sh

Script cài đặt Nix package manager - một hệ thống quản lý package hiện đại.

**Ưu điểm của Nix:**
- ✅ Reproducible builds
- ✅ Không xung đột dependencies  
- ✅ Dễ dàng rollback
- ✅ Cross-platform
- ✅ Declarative configuration

**Cách sử dụng:**

```bash
chmod +x setup-nix.sh
./setup-nix.sh
# Khởi động lại terminal sau khi hoàn tất
```

#### setup-terminal-nix.sh

Thiết lập terminal environment với Nix.

**Bao gồm:**
- Zsh với Oh My Zsh
- Modern CLI tools (exa, bat, ripgrep, fd, fzf)
- Tmux configuration
- Useful aliases và functions
- Git configuration

**Cách sử dụng:**

```bash
chmod +x setup-terminal-nix.sh
./setup-terminal-nix.sh
```

#### setup-apps-nix.sh

Cài đặt development applications với Nix.

**Bao gồm:**
- NVM & Node.js
- Development tools (Maven, Protocol Buffers, Git)
- Terminal utilities (neovim, tmux, htop)
- GUI applications (VS Code, Firefox, etc.)
- Node.js packages (NestJS CLI, pnpm)

**Cách sử dụng:**

```bash
chmod +x setup-apps-nix.sh
./setup-apps-nix.sh
```

## 📌 Workflow khuyến nghị

### Với Homebrew:
```bash
# Bước 1: Thiết lập terminal
./setup-terminal.sh
# Khởi động lại terminal

# Bước 2: Cài đặt applications  
./setup-app.sh
```

### Với Nix (Recommended):
```bash
# Bước 1: Cài đặt Nix
./setup-nix.sh
# Khởi động lại terminal

# Bước 2: Thiết lập terminal environment
./setup-terminal-nix.sh

# Bước 3: Cài đặt applications
./setup-apps-nix.sh
```

## ⚠️ Lưu ý quan trọng

- **Quyền admin**: Scripts có thể yêu cầu nhập mật khẩu admin
- **Thời gian**: Quá trình cài đặt có thể mất 15-30 phút tùy tốc độ internet
- **Khởi động lại**: Luôn khởi động lại terminal sau mỗi script
- **Kiểm tra**: Một số ứng dụng GUI có thể cần cấu hình thêm sau cài đặt
- **Conflict**: Không nên mix Homebrew và Nix trong cùng một session

## 🎨 Tùy chỉnh

Bạn có thể chỉnh sửa các script để:
- Thêm/bỏ các ứng dụng theo nhu cầu
- Thay đổi cấu hình aliases và functions
- Điều chỉnh theme và plugin cho Oh My Zsh

## 🔄 So sánh Homebrew vs Nix

| Tính năng | Homebrew | Nix |
|-----------|----------|-----|
| **Ease of use** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Reproducibility** | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Package availability** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **System isolation** | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Cross-platform** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Learning curve** | ⭐⭐⭐⭐⭐ | ⭐⭐ |

## 🤝 Đóng góp

Contributions are welcome! Please:
- Fork repository
- Create feature branch
- Submit pull request với mô tả chi tiết

## 📄 License

MIT License - xem chi tiết trong file cấu hình repository của bạn.
