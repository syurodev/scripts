#!/bin/bash

# Script cài đặt và thiết lập Nix package manager

echo "🚀 Bắt đầu cài đặt Nix..."

# Kiểm tra và cài đặt Nix
if ! command -v nix &>/dev/null; then
    echo "📦 Đang cài đặt Nix..."
    sh <(curl -L https://nixos.org/nix/install)
    
    # Khởi tạo môi trường Nix
    if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
    fi
    
    echo "✅ Nix đã được cài đặt thành công!"
else
    echo "✅ Nix đã được cài đặt trước đó."
fi

# Thêm Nix vào shell profile
if ! grep -q "nix.sh" ~/.zshrc 2>/dev/null; then
    echo "🔧 Thêm Nix vào ~/.zshrc..."
    echo '' >> ~/.zshrc
    echo '# Nix package manager' >> ~/.zshrc
    echo 'if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then' >> ~/.zshrc
    echo '    . ~/.nix-profile/etc/profile.d/nix.sh' >> ~/.zshrc
    echo 'fi' >> ~/.zshrc
fi

if ! grep -q "nix.sh" ~/.bashrc 2>/dev/null; then
    echo "🔧 Thêm Nix vào ~/.bashrc..."
    echo '' >> ~/.bashrc
    echo '# Nix package manager' >> ~/.bashrc
    echo 'if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then' >> ~/.bashrc
    echo '    . ~/.nix-profile/etc/profile.d/nix.sh' >> ~/.bashrc
    echo 'fi' >> ~/.bashrc
fi

# Thiết lập Nix channels
echo "📡 Thiết lập Nix channels..."
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Tạo file cấu hình Nix
echo "⚙️  Tạo cấu hình Nix..."
mkdir -p ~/.config/nix
cat > ~/.config/nix/nix.conf << 'EOF'
experimental-features = nix-command flakes
max-jobs = auto
EOF

# Kiểm tra cài đặt
echo "🔍 Kiểm tra phiên bản Nix:"
nix --version

echo ""
echo "🎉 Cài đặt Nix hoàn tất!"
echo "⚡ Vui lòng khởi động lại terminal hoặc chạy:"
echo "   source ~/.zshrc"
echo ""
echo "📝 Tiếp theo, bạn có thể chạy setup-apps-nix.sh để cài đặt các ứng dụng."