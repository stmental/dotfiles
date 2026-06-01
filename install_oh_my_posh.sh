#!/bin/bash
set -e

echo "[1/6] Installing dependencies..."
sudo apt update -y
sudo apt install -y unzip wget

echo "[2/6] Installing Oh My Posh binary..."
sudo wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 \
    -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "[3/6] Installing themes system-wide..."
sudo mkdir -p /usr/share/oh-my-posh/themes
sudo wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip \
    -O /usr/share/oh-my-posh/themes/themes.zip
sudo unzip -o /usr/share/oh-my-posh/themes/themes.zip -d /usr/share/oh-my-posh/themes >/dev/null
sudo rm /usr/share/oh-my-posh/themes/themes.zip
sudo chmod 644 /usr/share/oh-my-posh/themes/*.json

echo "[4/6] Installing ASCII-only PuTTY-safe theme..."
sudo tee /usr/share/oh-my-posh/themes/ascii-server.omp.json >/dev/null <<'EOF'
{
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        {
          "type": "session",
          "style": "plain",
          "foreground": "#00afff",
          "properties": {
            "display_host": true,
            "display_user": true,
            "postfix": " "
          }
        },
        {
          "type": "path",
          "style": "plain",
          "foreground": "#5fd700",
          "properties": {
            "style": "full",
            "prefix": "",
            "postfix": " "
          }
        },
        {
          "type": "git",
          "style": "plain",
          "foreground": "#ffaf00",
          "properties": {
            "display_status": true,
            "display_stash_count": false,
            "display_upstream_icon": false,
            "prefix": "git:",
            "postfix": " "
          }
        }
      ]
    }
  ],
  "final_space": true
}
EOF

echo "[5/6] Enabling Oh My Posh system-wide..."
sudo tee /etc/profile.d/oh-my-posh.sh >/dev/null <<'EOF'
#!/bin/sh
# System-wide Oh My Posh initialization
eval "$(oh-my-posh init bash --config /usr/share/oh-my-posh/themes/ascii-server.omp.json)"
EOF

sudo chmod +x /etc/profile.d/oh-my-posh.sh

echo "[6/6] Installation complete!"
echo "Reconnect your SSH session to see your new ASCII-only prompt."
