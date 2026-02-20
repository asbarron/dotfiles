if status is-interactive
    # Commands to run in interactive sessions can go here
    status --is-interactive; and rbenv init - fish | source
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

# Add custom paths
fish_add_path /usr/local/bin
fish_add_path ~/.local/bin
fish_add_path ~/.gem/bin

# Initialize Starship prompt
if type -q starship
    starship init fish | source
end

# Git helper and aliases
function git-main-branch
    git branch --list main master 2>/dev/null | head -1 | string trim | string replace '* ' ''
    or echo "main"
end

function git-develop-branch
    git branch --list develop devel development 2>/dev/null | head -1 | string trim | string replace '* ' ''
    or echo "develop"
end

function git-current-branch
    git branch --show-current 2>/dev/null
end
function g; git $argv; end
function ga; git add $argv; end
function gaa; git add --all $argv; end
function gapa; git add --patch $argv; end
function gau; git add --update $argv; end
function gb; git branch $argv; end
function gba; git branch -a $argv; end
function gbd; git branch -d $argv; end
function gc; git commit $argv; end
function gcam; git commit -a -m $argv; end
function gcmsg; git commit -m $argv; end
function gco; git checkout $argv; end
function gcb; git checkout -b $argv; end
function gd; git diff $argv; end
function gdca; git diff --cached $argv; end
function gf; git fetch $argv; end
function gfa; git fetch --all --prune $argv; end
function gl; git pull $argv; end
function glg; git log --stat $argv; end
function glog; git log --oneline --decorate --graph $argv; end
function glol; git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" $argv; end
function glola; git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all $argv; end
function gm; git merge $argv; end
function gp; git push $argv; end
function gpr; git pull --rebase $argv; end
function gr; git remote $argv; end
function gra; git remote add $argv; end
function grb; git rebase $argv; end
function grbi; git rebase -i $argv; end
function grh; git reset $argv; end
function grhh; git reset --hard $argv; end
function grs; git restore $argv; end
function grst; git restore --staged $argv; end
function gst; git status $argv; end
function gss; git status -s $argv; end
function gsta; git stash push $argv; end
function gstp; git stash pop $argv; end
function gstl; git stash list $argv; end
function gsw; git switch $argv; end
function gswc; git switch -c $argv; end

# Dynamic branch-based commands
function gcm -d "Checkout main/master branch"
    git checkout (git-main-branch) $argv
end

function grbm -d "Rebase onto main/master branch"
    git rebase (git-main-branch) $argv
end

function ggp -d "Push to origin current branch"
    git push origin (git-current-branch) $argv
end

function ggl -d "Pull from origin current branch"
    git pull origin (git-current-branch) $argv
end

function ggpush -d "Push to origin current branch"
    git push origin (git-current-branch) $argv
end

function ggpull -d "Pull from origin current branch"
    git pull origin (git-current-branch) $argv
end

function gpsup -d "Push and set upstream to origin current branch"
    git push --set-upstream origin (git-current-branch) $argv
end

