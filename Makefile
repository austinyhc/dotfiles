DOTFILES_DIR := $(HOME)/workspace/dotfiles
TPM_DIR := $(HOME)/.tmux/plugins/tpm

.PHONY: all tmux git tpm install_plugins clean help

all: tmux tpm install_plugins

tmux:
	@echo "📦 Stowing tmux config into $(HOME)..."
	stow --target=$(HOME) -d $(DOTFILES_DIR) tmux

git:
	@echo "📦 Stowing git config into $(HOME)..."
	stow --target=$(HOME) -d $(DOTFILES_DIR) git

tpm:
	@if [ ! -d "$(TPM_DIR)" ]; then \
		echo "⬇️  Cloning TPM (Tmux Plugin Manager)..."; \
		git clone https://github.com/tmux-plugins/tpm $(TPM_DIR); \
	else \
		echo "✅ TPM already installed at $(TPM_DIR)"; \
	fi

install_plugins:
	@echo "🔧 Installing tmux plugins..."
	@$(TPM_DIR)/bin/install_plugins

clean:
	@echo "🧹 Unstowing tmux config..."
	stow -D --target=$(HOME) -d $(DOTFILES_DIR) tmux
	stow -D --target=$(HOME) -d $(DOTFILES_DIR) git

help:
	@echo "Available targets:"
	@echo "  make tmux             # Stow tmux config"
	@echo "  make git              # Stow git config"
	@echo "  make tpm              # Install TPM if missing"
	@echo "  make install_plugins  # Force tmux plugin install"
	@echo "  make all              # Full setup: stow, TPM, plugin install"
	@echo "  make clean            # Unstow tmux config"

