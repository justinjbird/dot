## sets the environment for login shells, it contains "set it and forget it" type of parameters
## such as update $PATH

## Common settings
source ~/.cprofile

# >>> oh my posh >>>
eval "$(oh-my-posh init bash --config '~/.ohmyposh/amro-custom.json')"
# <<< oh my posh <<<

## Warning
echo '## Remember! This is no longer supported and you should be using zsh. ##'
