## sets the environment for interactive shells, it contains "set it and forget it" type of parameters
## like $PROMPT, aliases, and functions you would like to have in both login and interactive shells.

## Aliases

# >>> dbt >>>
alias set-venv-dbt='source ~/.venv/dbt/bin/activate'
# <<< dbt <<<

# >>> docker >>>
alias docker=podman
# <<< docker <<<

# >>> dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# <<< dotfiles

# >>> homebrew >>>
alias update-brew='brew update ; brew upgrade ; brew cleanup ; brew doctor' ## updates brew stuff
alias push-brewfile='brew file update ; brew cleanup' ## installs from brewfile
alias clean-brew='echo brew doctor... ; brew doctor ; echo brew cleanup... ; brew cleanup ; echo brew doctor... ; brew doctor'
alias sort-brewfile='sort "/Users/justin/.config/brewfile/Brewfile" -r -o "/Users/justin/.config/brewfile/Brewfile" ; `
                 sort "/Users/justin/.config/brewfile/Brewfile.Justin-MacBookAirM2.local" -r -o "/Users/justin/.config/brewfile/Brewfile.Justin-MacBookAirM2.local" ; `
                 sort "/Users/justin/.config/brewfile/Brewfile.Justin-MacStudioM1.local" -r -o "/Users/justin/.config/brewfile/Brewfile.Justin-MacStudioM1.local"'
# <<< homebrew <<<

# >>> python >>>
alias pip=pip3
alias python=python3
alias set-venv='source .venv/bin/activate'
alias create-venv='python -m venv .venv ; set-venv'
alias get-requirements='pip freeze > requirements.txt'
alias install-venv='source .venv/bin/activate ; pip install -r requirements.txt'
alias quit-venv='deactivate'
# <<< python <<<

# >>> shell >>>
alias get-aliases='print -i -o -rl -- ${(k)aliases}'
# <<< shell <<<

# >>> variables
HOSTNAME=$(hostname)
# <<< variables

# >>> functions >>>
function git-check-unpushed() {
    BASE_DIR=~/code
    for dir in "$BASE_DIR"/*/; do
        if [ -d "$dir/.git" ]; then
            echo "[debug] Unpushed branches in $dir:"
            git -C "$dir" unpushed
        else
            echo "[debug] Skipping $dir (not a git repository)"
        fi
    done
}
# <<< functions <<<