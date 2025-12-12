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

# Thiết lập NVM
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >>~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >>~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >>~/.zshrc

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Cài đặt Node.js 22
echo "Cài đặt Node.js 22..."
nvm install 22
nvm use 22
echo "Node.js 22 đã được cài đặt."

# Cài đặt các ứng dụng bổ sung
echo "Cài đặt các ứng dụng bổ sung..."

install_app thebrowsercompany-dia
install_app font-jetbrains-mono
install_app spotify
install_app discord
install_app zalo
install_app alcove
install_app aldente
install_app sourcetree
install_app termius
install_app font-jetbrains-mono-nerd-font
install_app dbeaver-community
install_app another-redis-desktop-manager
install_app playcover-community
install_app visual-studio-code
install_app zed
install_app yaak
install_app openvpn-connect
install_app antigravity
install_app datagrip
install_app intellij-idea

# Cài đặt Protocol Buffers
echo "Đang cài đặt Protocol Buffers..."
brew install protobuf
echo "Protocol Buffers đã được cài đặt."

# Kiểm tra phiên bản protoc
echo "Phiên bản Protocol Buffers:"
protoc --version


echo "Đang cài đặt tree..."
brew install tree
echo "tree đã được cài đặt."


# Cài đặt Java 8 (Azul Zulu - native ARM64 cho Apple Silicon)
echo "Đang cài đặt Java 8 (Azul Zulu)..."
brew install --cask zulu@8
echo "Java 8 đã được cài đặt."

# Thiết lập Java 8 environment
if ! grep -q "export JAVA_8_HOME=" ~/.zshrc; then
    echo 'export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)' >>~/.zshrc
    echo 'export JAVA_HOME=$JAVA_8_HOME' >>~/.zshrc
fi

# Cài đặt maven
echo "Đang cài đặt maven..."
brew install maven
echo "maven đã được cài đặt."

# Cài đặt Go
echo "Đang cài đặt Go..."
brew install go
echo "Go đã được cài đặt."

# Thiết lập Go environment
if ! grep -q "export GOPATH=" ~/.zshrc; then
    echo 'export GOPATH=$HOME/go' >>~/.zshrc
    echo 'export PATH=$PATH:$GOPATH/bin' >>~/.zshrc
fi

# Cài đặt Rust
echo "Đang cài đặt Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "Rust đã được cài đặt."

# Load Rust environment
source "$HOME/.cargo/env"

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
echo "Phiên bản Java:"
java -version
echo "Phiên bản maven:"
mvn -version
echo "Phiên bản Go:"
go version
echo "Phiên bản Rust:"
rustc --version
echo "Phiên bản Cargo:"
cargo --version

echo "Cài đặt hoàn tất!"
echo "Vui lòng khởi động lại terminal hoặc chạy 'source ~/.zshrc' để áp dụng các thay đổi."
