#!/bin/bash

echo "Bắt đầu cài đặt các AI agents..."

# Kiểm tra xem npm đã được cài đặt chưa
if ! command -v npm &>/dev/null; then
    echo "npm chưa được cài đặt. Vui lòng cài đặt Node.js và npm trước."
    exit 1
fi

# Cài đặt Google Gemini CLI
echo "Đang cài đặt Google Gemini CLI..."
npm install -g @google/gemini-cli
if [ $? -eq 0 ]; then
    echo "✓ Google Gemini CLI đã được cài đặt thành công."
else
    echo "✗ Lỗi khi cài đặt Google Gemini CLI."
fi

# Cài đặt OpenAI Codex
echo "Đang cài đặt OpenAI Codex..."
npm i -g @openai/codex
if [ $? -eq 0 ]; then
    echo "✓ OpenAI Codex đã được cài đặt thành công."
else
    echo "✗ Lỗi khi cài đặt OpenAI Codex."
fi

# Cài đặt Claude CLI
echo "Đang cài đặt Claude CLI..."
curl -fsSL https://claude.ai/install.sh | bash
if [ $? -eq 0 ]; then
    echo "✓ Claude CLI đã được cài đặt thành công."
else
    echo "✗ Lỗi khi cài đặt Claude CLI."
fi

echo ""
echo "Hoàn tất cài đặt các AI agents!"
