#!/bin/bash

# Kiểm tra và cài đặt Homebrew
if ! command -v brew &> /dev/null
then
    echo "Cài đặt Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew đã được cài đặt."
fi

# Cài đặt Zsh thông qua Homebrew
echo "Cài đặt Zsh..."
brew install zsh
echo "Zsh đã được cài đặt."

# Thiết lập Zsh làm shell mặc định
if [[ $SHELL != "/opt/homebrew/bin/zsh" ]]; then
    echo "Đang thiết lập Zsh làm shell mặc định..."
    sudo sh -c "echo /opt/homebrew/bin/zsh >> /etc/shells"
    chsh -s /opt/homebrew/bin/zsh
    echo "Zsh đã được thiết lập làm shell mặc định."
else
    echo "Zsh đã là shell mặc định."
fi

# Cài đặt Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Cài đặt Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Oh My Zsh đã được cài đặt."
else
    echo "Oh My Zsh đã được cài đặt."
fi

echo "Phần 1 đã hoàn tất. Vui lòng khởi động lại terminal và chạy etup-app.sh