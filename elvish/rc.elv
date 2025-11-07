# ~/.config/elvish/rc.elv

# Add /usr/local/bin, ~/.local/bin and ~/.gem/bin to PATH
set paths = [/usr/local/bin ~/.local/bin ~/.gem/bin $@paths]

# Load custom modules
use github.com/ezh/elvish-bash-completion/git
use github.com/ezh/elvish-bash-completion/helm
use github.com/ezh/elvish-bash-completion/kubectl

# Initialize Starship prompt (with Dracula theme support)
eval (starship init elvish)

# Keybindings
set edit:insert:binding[Ctrl-L] = { 
  clear > /dev/tty
  edit:redraw &full=$true
}

# thefuck integration (aliased as "ah")
try {
  eval (thefuck --alias ah --enable-experimental-instant-mode 2>/dev/null | slurp)
} catch {
  fn ah {
    echo "thefuck not installed. Install with: pip3 install thefuck"
  }
}

# Helper functions for git branch detection
fn git-main-branch {
  try {
    git branch --list main master 2>/dev/null | each {|b| put (str:trim-space $b | str:trim-prefix '* ') } | take 1 | one
  } catch {
    put main
  }
}

fn git-develop-branch {
  try {
    git branch --list develop devel development 2>/dev/null | each {|b| put (str:trim-space $b | str:trim-prefix '* ') } | take 1 | one
  } catch {
    put develop
  }
}

fn git-current-branch {
  git branch --show-current 2>/dev/null
}

# Helper to create git command aliases (DRY)
fn _git-alias {|name cmd|
  var cmd-str = (echo $@cmd | tr ' ' '|' | str:join '')
  eval 'fn '$name' {|@a| e:git '$cmd-str' $@a }'
}

# Git Aliases - Oh-My-Zsh style (simplified)
fn g {|@a| e:git $@a }
fn ga {|@a| e:git add $@a }
fn gaa {|@a| e:git add --all $@a }
fn gapa {|@a| e:git add --patch $@a }
fn gau {|@a| e:git add --update $@a }
fn gb {|@a| e:git branch $@a }
fn gba {|@a| e:git branch -a $@a }
fn gbd {|@a| e:git branch -d $@a }
fn gc {|@a| e:git commit $@a }
fn gcam {|@a| e:git commit -a -m $@a }
fn gcmsg {|@a| e:git commit -m $@a }
fn gco {|@a| e:git checkout $@a }
fn gcb {|@a| e:git checkout -b $@a }
fn gcm {|@a| e:git checkout (git-main-branch) $@a }
fn gd {|@a| e:git diff $@a }
fn gdca {|@a| e:git diff $@a }
fn gf {|@a| e:git fetch $@a }
fn gfa {|@a| e:git fetch $@a }
fn gl {|@a| e:git pull $@a }
fn glg {|@a| e:git log $@a }
fn glog {|@a| e:git log $@a }
fn glol {|@a| e:git log $@a }
fn glola {|@a| e:git log $@a }
fn gm {|@a| e:git merge $@a }
fn gp {|@a| e:git push $@a }
fn gpr {|@a| e:git pull $@a }
fn gr {|@a| e:git remote $@a }
fn gra {|@a| e:git remote $@a }
fn grb {|@a| e:git rebase $@a }
fn grbi {|@a| e:git rebase $@a }
fn grbm {|@a| e:git rebase (git-main-branch) $@a }
fn grh {|@a| e:git reset $@a }
fn grhh {|@a| e:git reset $@a }
fn grs {|@a| e:git restore $@a }
fn grst {|@a| e:git restore $@a }
fn gst {|@a| e:git status $@a }
fn gss {|@a| e:git status $@a }
fn gsta {|@a| e:git stash $@a }
fn gstp {|@a| e:git stash $@a }
fn gstl {|@a| e:git stash $@a }
fn gsw {|@a| e:git switch $@a }
fn gswc {|@a| e:git switch $@a }
fn ggp {|@a| e:git push origin (git-current-branch) $@a }
fn ggl {|@a| e:git pull origin (git-current-branch) $@a }
fn ggpush {|@a| e:git push origin (git-current-branch) $@a }
fn ggpull {|@a| e:git pull origin (git-current-branch) $@a }
fn gpsup {|@a| e:git push --set-upstream origin (git-current-branch) $@a }

# Simple funcs
fn reload { e:exec /usr/local/bin/elvish }

fn k {|@arg|
  try { kubecolor $@arg 
  } catch {
    kubectl $@arg
  }
}
edit:add-var k~ $k~
set edit:completion:arg-completer[k] = $kubectl:kubectl_completion~

# Custom command wrappers
fn ls {|@a|
  e:ls --color=auto -F $@a
}

fn pwd {|@a|
  e:pwd $@a | lolcat
}

fn cat {|@a|
  lolcat $@a
}
