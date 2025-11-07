# Elvish Configuration

Your Elvish shell is now configured with:

## ✅ Starship Prompt with Dracula Theme (Fish-style)

**Starship** is installed at `~/.local/bin/starship` and provides a clean Fish-like prompt with Dracula colors.

### Prompt Format:
```bash
# Normal (in git repo, clean)
➜ myproject git:(main) 

# With changes (dirty)
➜ myproject git:(feature) ✗ 

# Error state (last command failed)
➜ myproject git:(main) ✗ 

# Outside git repo
➜ documents 
```

### Colors Used:
- **Green Arrow** (#50fa7b) - Success (turns **red** #ff5555 on error)
- **Cyan** (#8be9fd) - Directory path
- **Purple** (#bd93f9) - git: label and parentheses
- **Red** (#ff5555) - Branch name
- **Yellow** (#f1fa8c) - Dirty indicator (✗)

Configuration file: `~/.config/starship.toml`

## ✅ Oh-My-Zsh Style Git Aliases

All the essential git aliases are available:

### Most Common:
- `g` - git
- `ga` - git add
- `gaa` - git add --all
- `gst` - git status
- `gss` - git status -s
- `gc` - git commit -v
- `gcam` - git commit -a -m
- `gcmsg` - git commit -m
- `gco` - git checkout
- `gcb` - git checkout -b
- `gcm` - git checkout main/master (auto-detects)
- `gd` - git diff
- `gdca` - git diff --cached
- `gf` - git fetch
- `gfa` - git fetch --all --prune
- `gl` - git pull
- `gp` - git push
- `gpr` - git pull --rebase
- `gm` - git merge
- `gr` - git remote
- `gra` - git remote add
- `grb` - git rebase
- `grbi` - git rebase -i
- `grbm` - git rebase main/master
- `grh` - git reset
- `grhh` - git reset --hard
- `grs` - git restore
- `grst` - git restore --staged
- `gsw` - git switch
- `gswc` - git switch -c
- `gsta` - git stash push
- `gstp` - git stash pop
- `gstl` - git stash list

### Smart Branch Aliases:
- `ggp` - git push origin [current-branch]
- `ggl` - git pull origin [current-branch]
- `ggpush` - git push origin [current-branch]
- `ggpull` - git pull origin [current-branch]  
- `gpsup` - git push --set-upstream origin [current-branch]

### Pretty Logs:
- `glg` - git log --stat
- `glog` - git log --oneline --decorate --graph
- `glol` - git log with nice formatting and relative dates
- `glola` - git log with nice formatting, all branches

## 📝 Usage

Just restart your Elvish shell or run:
```elvish
reload
```

Then use the aliases:
```elvish
gst           # Check status
gaa           # Add all files  
gcmsg "fix"   # Commit with message
ggp           # Push to current branch
```

## ✅ What's Configured

### Files Created/Modified:
- `~/.config/elvish/rc.elv` - Main Elvish configuration with git aliases
- `~/.config/starship.toml` - Starship prompt with Dracula colors
- `~/.local/bin/starship` - Starship binary

### Features:
✅ **Starship** prompt with powerline symbols  
✅ **Dracula** color scheme (purple, pink, cyan, green, orange)  
✅ **60+ Git aliases** matching Oh-My-Zsh style  
✅ Smart branch detection (auto-detects main/master)  
✅ Current branch shortcuts (ggp, ggl, gpsup)

## 🚀 Quick Start

1. Open a new terminal with Elvish
2. The Starship prompt should appear with Dracula colors
3. Try some git commands:
   ```elvish
   gst              # git status
   gcb feature      # git checkout -b feature
   gaa              # git add --all
   gcmsg "update"   # git commit -m "update"
   ggp              # git push origin [current-branch]
   ```

## 🎨 Custom Command Wrappers

### Colorful Commands (with Rainbow 🌈):
- `ls` - List with colors and file type indicators
- `pwd` - Print working directory with **rainbow colors** (via lolcat)
- `cat` - Display files with **rainbow colors** (via lolcat)

✅ **lolcat is installed and working!**

## ⌨️ Keybindings

- **Ctrl-L** - Clear the screen (like in bash/zsh)

## 🔧 Command Correction

- **`ah`** - Corrects your previous command using thefuck

**Installation (if not already installed):**
```bash
pip3 install thefuck
```

**Usage:**
```bash
# Type wrong command
gti status

# Then type:
ah
# It will correct it to: git status
```

## 🔧 Customization

### Starship Theme
Edit `~/.config/starship.toml` to customize your prompt further.

### Git Aliases  
Edit `~/.config/elvish/rc.elv` to add more aliases or modify existing ones.

### Add More Aliases
Just add functions like:
```elvish
fn my-alias {|@a| some-command $@a }
```

## 📚 Documentation

- [Starship](https://starship.rs/)
- [Elvish](https://elv.sh/)
- [Dracula Theme](https://draculatheme.com/)

