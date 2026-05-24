# Matt Ryan's Dotfiles

A grossly opinionated set of system configurations, 
optimized for Linux while aiming to run on macOS.

## 🚀 Quick Start

```bash
git clone https://github.com/rattlion/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make
```

## 📋 Prerequisites

- **Git** - for cloning the repository
- **Make** - for running installation scripts
- **Zsh** - recommended shell (will be configured automatically)
- **curl/wget** - for downloading additional tools

### macOS Requirements
```bash
# Install Xcode command line tools
xcode-select --install

# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Linux Requirements
```bash
# Arch
sudo pacman -S git make zsh curl

# Ubuntu/Debian
sudo apt update && sudo apt install git make zsh curl

# RHEL/CentOS/Fedora
sudo yum install git make zsh curl
# or on newer versions:
sudo dnf install git make zsh curl
```

## 🎯 What's Included

### Shell Configuration
- **Zsh setup** with custom prompt and aliases
- **Environment variables** and PATH management
- **Completion system** for modern tools
- **Custom functions** and utilities

### Development Tools
- **Git configuration** with useful aliases and settings
- **Editor configurations** (primarily vim)
- **Development aliases** and shortcuts
- **Language-specific configurations**

### System Utilities
- **Custom scripts** in `bin/` added to PATH
- **System aliases** for common tasks

## 📁 Repository Structure

```
~/.dotfiles/
├── bin/                   # Custom scripts (added to PATH)
├── topic/                 # E.g. nvim
│   ├── *.zsh              # Loaded into environment
│   ├── path.zsh           # Loaded first (PATH setup)
│   ├── completion.zsh     # Loaded last (autocomplete)
│   ├── *.symlink          # Symlinked to $HOME
│   └── *.template         # Copied to $HOME (for customization)
├── Makefile               # Installation automation
└── README.md              # This file
```

## 🔧 Installation Details

The installation process:

2. **Symlinks** `*.symlink` files to your home directory
3. **Copies** `*.template` files to your home directory
4. **Loads** all `*.zsh` files into your shell environment
5. **Adds** `bin/` directory to your PATH

### Example Transformations
- `git/gitconfig.dot_template` → `~/.gitconfig` (copied)
- `zsh/zshrc.symlink` → `~/.zshrc` (symlinked)
- `bin/myip` → Available globally as `myip` command

## 🛠️ Customization

### Templates
Files ending in `.dot_template` are copied (not symlinked) so you can customize them:

```bash
# Edit your personal git config
vim ~/.gitconfig

# Add untracked or generally device specific configs to ~/.secretrc
vim ~/.secretrc
```

### Adding New Configurations

1. **Create a topic directory**: `mkdir ~/.dotfiles/newtool/`
2. **Add configuration files**:
   - `newtool/newtoolrc.symlink` - will be symlinked as `~/.newtoolrc`
   - `newtool/config.zsh` - any .zsh file will be loaded in your shell
   - `newtool/aliases.zsh` - it can be helpful to separate them logically

3. **Reinstall**: `cd ~/.dotfiles && make`

## 🔄 Updating

```bash
cd ~/.dotfiles
git pull origin main
make clean    # Remove old symlinks
make install  # Reinstall with updates
```

## 🚨 Troubleshooting

### Common Issues

**Installation fails with "Permission denied"**
```bash
# Fix script permissions
chmod +x ~/.dotfiles/script/install
chmod +x ~/.dotfiles/script/uninstall
```

**Zsh not loading configurations**
```bash
# Reload zsh configuration
source ~/.zshrc

# Or restart your terminal
```

**Symlinks pointing to wrong location**
```bash
# Edit the filenames accordingly
cd ~/.dotfiles
# mv /topic/config.zsh /topic/config.symlink
# Clean and reinstall
make clean
make install
```

### Getting Help

1. Check existing [GitHub Issues](https://github.com/rattlion/dotfiles/issues)
2. Create a new issue with:
   - Your OS and version
   - Error messages
   - Steps to reproduce

## 🧹 Uninstallation

```bash
cd ~/.dotfiles
make uninstall
```

This will:
- Remove all symlinks created by the dotfiles
- Restore backed up files (if available)
- Leave your system in its pre-dotfiles state

## 🙏 Acknowledgments

Several years ago this project started out as a fork of 
[Zach Holman's](https://github.com/holman/) excellent 
[dotfiles](http://github.com/holman/dotfiles) which at the time was a fork of 
[Ryan Bates'](http://github.com/ryanb). I've been updating this set since 2012.
