#!/bin/bash

# Script thiết lập terminal environment với Nix

echo "🚀 Bắt đầu thiết lập terminal với Nix..."

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

# Cài đặt Zsh thông qua Nix
echo "🐚 Cài đặt Zsh..."
install_package zsh

# Thiết lập Zsh làm shell mặc định
ZSH_PATH=$(which zsh)
if [[ $SHELL != "$ZSH_PATH" ]]; then
    echo "🔧 Đang thiết lập Zsh làm shell mặc định..."
    if ! grep -q "$ZSH_PATH" /etc/shells; then
        echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    chsh -s "$ZSH_PATH"
    echo "✅ Zsh đã được thiết lập làm shell mặc định."
else
    echo "✅ Zsh đã là shell mặc định."
fi

# Cài đặt Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🎨 Cài đặt Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "✅ Oh My Zsh đã được cài đặt."
else
    echo "✅ Oh My Zsh đã được cài đặt."
fi

# Cài đặt các terminal utilities cần thiết
echo "🛠️  Cài đặt terminal utilities..."
install_package git
install_package zsh

# Thiết lập các alias và configuration
echo "⚙️  Thiết lập cấu hình shell..."

# Tạo backup của .zshrc nếu cần
if [ -f ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
fi

# Thêm cấu hình vào .zshrc
cat >> ~/.zshrc << 'EOF'

# ========== NIX CONFIGURATION ==========
# Nix package manager
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
    . ~/.nix-profile/etc/profile.d/nix.sh
fi

# ========== ALIASES ==========
# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# Utility aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias h='history'
alias c='clear'

# Git config aliases
alias set-git-config='git config --global user.name "vupt" && git config --global user.email "vupt@overate-vntech.com"'
alias set-git-local='git config user.name "vupt" && git config user.email "vupt@overate-vntech.com"'

# ========== FUNCTIONS ==========
# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

EOF


# Thiết lập git configuration toàn cục
echo "🔧 Thiết lập Git configuration..."
git config --global init.defaultBranch main
git config --global pull.rebase false

# Kiểm tra các công cụ đã cài đặt
echo ""
echo "🔍 Kiểm tra các công cụ đã cài đặt:"
echo "Zsh: $(zsh --version 2>/dev/null || echo 'Không có')"
echo "Git: $(git --version 2>/dev/null || echo 'Không có')"

echo ""
echo "🎉 Thiết lập terminal hoàn tất!"
echo "⚡ Vui lòng khởi động lại terminal để áp dụng các thay đổi."
echo ""
echo "📝 Các tính năng đã được thiết lập:"
echo "   ✅ Zsh shell với Oh My Zsh"
echo "   ✅ Basic Git aliases và functions"
echo "   ✅ Git configuration"
echo ""
echo "🔧 Aliases có sẵn:"
echo "   set-git-config  - Cấu hình git toàn cục (--global)"
echo "   set-git-local   - Cấu hình git cho repo hiện tại (local)"
echo ""
echo "🚀 Tiếp theo, bạn có thể chạy setup-apps-nix.sh để cài đặt các ứng dụng phát triển."