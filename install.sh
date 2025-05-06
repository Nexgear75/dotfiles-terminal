#!/bin/bash

set -e

echo "🔧 Installation des outils..."

# Détection OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
    sudo apt install -y tmux fish alacritty git curl
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install tmux fish alacritty
else
    echo "OS non supporté"
    exit 1
fi

echo "📁 Configuration des fichiers..."

# Créer les répertoires de config si nécessaires
mkdir -p ~/.config/alacritty ~/.config/fish

# Copier ou linker les fichiers
cp -f ./alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp -f ./fish/config.fish ~/.config/fish/config.fish
cp -f ./tmux/.tmux.conf ~/.tmux.conf

# Changer le shell par défaut
if ! echo $SHELL | grep -q "fish"; then
    echo "🔄 Changement de shell par défaut vers fish..."
    chsh -s $(which fish)
fi

echo "✅ Configuration terminée !"

