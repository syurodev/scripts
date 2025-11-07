#!/bin/bash

# Kiểm tra xem Zsh đã được cài đặt chưa
if ! command -v zsh &>/dev/null; then
    echo "Zsh chưa được cài đặt. Vui lòng cài đặt Zsh trước."
    exit 1
fi

# Lấy đường dẫn Zsh
ZSH_PATH=$(which zsh)
echo "Tìm thấy Zsh tại: $ZSH_PATH"

# Thiết lập Zsh làm shell mặc định
if [[ $SHELL != "$ZSH_PATH" ]]; then
    echo "Đang thiết lập Zsh làm shell mặc định..."

    # Kiểm tra xem Zsh đã có trong /etc/shells chưa
    if ! grep -q "$ZSH_PATH" /etc/shells; then
        sudo sh -c "echo $ZSH_PATH >> /etc/shells"
    fi

    chsh -s "$ZSH_PATH"
    echo "Zsh đã được thiết lập làm shell mặc định."
else
    echo "Zsh đã là shell mặc định."
fi

# Alias để thiết lập local git config
if ! grep -q "alias set-git-local=" ~/.zshrc; then
    echo "alias set-git-local='git config user.name \"vupt\" && git config user.email \"vupt@overate-vntech.com\"'" >>~/.zshrc
fi

if ! grep -q "alias set-git-local=" ~/.bashrc; then
    echo "alias set-git-local='git config user.name \"vupt\" && git config user.email \"vupt@overate-vntech.com\"'" >>~/.bashrc
fi

echo "Thiết lập hoàn tất. Vui lòng khởi động lại terminal và chạy setup-app.sh"
