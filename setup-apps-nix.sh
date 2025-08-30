#!/bin/bash

# Script cài đặt các ứng dụng thông qua Nix

echo "🚀 Bắt đầu cài đặt các ứng dụng với Nix..."

# Kiểm tra Nix có được cài đặt chưa
if ! command -v nix &>/dev/null; then
    echo "❌ Nix chưa được cài đặt. Vui lòng chạy setup-nix.sh trước."
    exit 1
fi

# Load Nix environment
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
    . ~/.nix-profile/etc/profile.d/nix.sh
fi

# Hàm cài đặt package với thông báo
install_package() {
    echo "📦 Đang cài đặt $1..."
    if nix-env -iA nixpkgs.$1; then
        echo "✅ $1 đã được cài đặt."
    else
        echo "⚠️  Không thể cài đặt $1, có thể package không tồn tại trong nixpkgs."
    fi
}

# Hàm cài đặt từ GitHub release hoặc script
install_external() {
    case $1 in
        "nvm")
            echo "📦 Đang cài đặt NVM..."
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
            echo "✅ NVM đã được cài đặt."
            ;;
        "bun")
            echo "📦 Đang cài đặt Bun..."
            curl -fsSL https://bun.sh/install | bash
            echo "✅ Bun đã được cài đặt."
            ;;
        *)
            echo "⚠️  Không biết cách cài đặt $1"
            ;;
    esac
}

# Cài đặt NVM và Node.js
install_external nvm

# Load NVM và cài đặt Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if command -v nvm &>/dev/null; then
    echo "🟢 Đang cài đặt Node.js 22..."
    nvm install 22
    nvm use 22
    echo "✅ Node.js 22 đã được cài đặt."
fi

# Cài đặt các development tools
echo "🛠️  Cài đặt development tools..."
install_package protobuf
install_package maven
install_package pnpm

# Cài đặt Bun
install_external bun

# Cài đặt GUI applications (những ứng dụng có sẵn trong nixpkgs)
echo "🖱️  Cài đặt GUI applications..."
# Một số ứng dụng phổ biến có trong nixpkgs
install_package firefox
install_package vscode

# Lưu ý: Nhiều GUI apps từ Homebrew cask không có sẵn trong nixpkgs
echo "⚠️  Lưu ý: Một số ứng dụng GUI cần cài thủ công:"
echo "   - Arc Browser, Spotify, Discord, Zalo"
echo "   - Steam, GitHub Desktop, Termius"
echo "   - DBeaver, MongoDB Compass, etc."
echo "   - Bạn có thể dùng nixpkgs.unfree hoặc cài thủ công"

# Cài đặt các Node.js packages toàn cục
if command -v npm &>/dev/null; then
    echo "📦 Đang cài đặt NestJS CLI..."
    npm install -g @nestjs/cli
    echo "✅ NestJS CLI đã được cài đặt."
fi

# Thêm alias cấu hình Git cho repo hiện tại
if ! grep -q "alias set-git-local=" ~/.zshrc 2>/dev/null; then
    echo "🔧 Thêm Git alias vào ~/.zshrc..."
    echo "" >> ~/.zshrc
    echo "# Git config aliases" >> ~/.zshrc
    echo "alias set-git-config='git config --global user.name \"vupt\" && git config --global user.email \"vupt@overate-vntech.com\"'" >> ~/.zshrc
    echo "alias set-git-local='git config user.name \"vupt\" && git config user.email \"vupt@overate-vntech.com\"'" >> ~/.zshrc
fi

# Kiểm tra phiên bản các công cụ đã cài đặt
echo ""
echo "🔍 Kiểm tra phiên bản các công cụ:"
echo "Node.js: $(node --version 2>/dev/null || echo 'Không có')"
echo "npm: $(npm --version 2>/dev/null || echo 'Không có')"
echo "pnpm: $(pnpm --version 2>/dev/null || echo 'Không có')"
echo "Bun: $(bun --version 2>/dev/null || echo 'Không có')"
echo "NestJS CLI: $(nest --version 2>/dev/null || echo 'Không có')"
echo "Maven: $(mvn -version 2>/dev/null | head -n1 || echo 'Không có')"
echo "Protocol Buffers: $(protoc --version 2>/dev/null || echo 'Không có')"

echo ""
echo "🎉 Cài đặt ứng dụng hoàn tất!"
echo "⚡ Vui lòng khởi động lại terminal hoặc chạy:"
echo "   source ~/.zshrc"
echo ""
echo "📝 Lưu ý: Đừng quên cài đặt thêm ThinkBuddy và các ứng dụng khác nếu cần!"
echo ""
echo "🔧 Aliases có sẵn:"
echo "   set-git-config  - Cấu hình git toàn cục (--global)"  
echo "   set-git-local   - Cấu hình git cho repo hiện tại (local)"