#!/bin/bash

# Hàm cài đặt ứng dụng với thông báo
install_app() {
    echo "Đang cài đặt $1..."
    brew install --cask $1
    echo "$1 đã được cài đặt."
}

# Cài đặt NVM
echo "Cài đặt NVM..."
brew install nvm
echo "NVM đã được cài đặt."

# Thiết lập NVM
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Cài đặt Node.js 20
echo "Cài đặt Node.js 20..."
nvm install 20
nvm use 20
echo "Node.js 20 đã được cài đặt."

# Cài đặt các ứng dụng bổ sung
echo "Cài đặt các ứng dụng bổ sung..."

install_app trae
install_app cursor
install_app font-jetbrains-mono
install_app postman
install_app spotify
install_app arc
install_app discord
install_app zalo
install_app alcove
install_app aldente
install_app github-copilot-for-xcode
install_app steam
install_app sourcetree
install_app github
install_app termius
install_app datagrip
install_app webstorm
install_app intellij-idea
install_app font-jetbrains-mono-nerd-font
install_app jetbrains-toolbox
install_app dbeaver-community
install_app mongodb-compass
install_app another-redis-desktop-manager
install_app playcover-community
install_app visual-studio-code

echo "Đang cài đặt Docker..."
brew install docker
echo "Docker đã được cài đặt."

# Cài đặt Protocol Buffers
echo "Đang cài đặt Protocol Buffers..."
brew install protobuf
echo "Protocol Buffers đã được cài đặt."

# Kiểm tra phiên bản protoc
echo "Phiên bản Protocol Buffers:"
protoc --version

# Cài đặt pnpm
echo "Đang cài đặt pnpm..."
brew install pnpm
echo "pnpm đã được cài đặt."

# Cài đặt bun
echo "Đang cài đặt bun..."
curl -fsSL https://bun.sh/install | bash
echo "bun đã được cài đặt."

# Cài đặt NestJS CLI
echo "Đang cài đặt NestJS CLI..."
npm install -g @nestjs/cli
echo "NestJS CLI đã được cài đặt."

# Kiểm tra phiên bản
echo "Phiên bản Node.js:"
node --version
echo "Phiên bản npm:"
npm --version
echo "Phiên bản pnpm:"
pnpm --version
echo "Phiên bản bun:"
bun --version
echo "Phiên bản NestJS CLI:"
nest --version

echo "Cài đặt hoàn tất!"
echo "Vui lòng khởi động lại terminal hoặc chạy 'source ~/.zshrc' để áp dụng các thay đổi."

echo "Lưu ý: Đừng quên cài đặt thêm ThinkBuddy!"
