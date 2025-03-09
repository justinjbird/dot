# >>> docker >>>
New-Alias docker podman
# <<< docker

# >>> dbt >>>
function Set-VenvDbt { & ~/.venv/dbt/Scripts/Activate.ps1 }
New-Alias -Name set-venv-dbt -Value Set-VenvDbt
# <<< dbt <<<

# >>> git >>>
function List-GitUnpushed {
  clear
  $path = '~/code'
  $directories = (Get-ChildItem $path -Directory)
  foreach ($directory in $directories) {
    $null = (git -C $directory fetch)
    Write-Host "Unpushed branches at $($directory):"
    git -C $directory unpushed
  }
  Write-Host "Git unpushed done."
}
# <<< git <<<

# >>> homebrew >>>
$env:PATH = "/opt/homebrew/bin" + $env:PATH
$env:PATH = "/opt/homebrew/sbin" + $env:PATH

function Update-BrewFunction { & brew update; & brew upgrade; & brew cleanup; & brew doctor }
New-Alias -Name update-brew -Value Update-BrewFunction

function Update-BrewfileFunction { & brew file update; & brew cleanup }
New-Alias -Name update-brewfile -Value Update-BrewfileFunction

function Clean-BrewFunction {
    Write-Host "Running brew doctor..."
    & brew doctor
    Write-Host "Running brew cleanup..."
    & brew cleanup
    Write-Host "Running brew doctor again..."
    & brew doctor
}
New-Alias -Name clean-brew -Value Clean-BrewFunction

function Sort-BrewfileFunction {
    $brewfilePath = "/Users/justin/.config/brewfile/Brewfile"
    $brewfileJustinMBA = "/Users/justin/.config/brewfile/Brewfile.Justin-MacBookAirM2.local"
    $brewfileJustinMS = "/Users/justin/.config/brewfile/Brewfile.Justin-MacStudioM1.local"
    
    Get-Content $brewfilePath | Sort-Object -Descending | Set-Content $brewfilePath
    Get-Content $brewfileJustinMBA | Sort-Object -Descending | Set-Content $brewfileJustinMBA
    Get-Content $brewfileJustinMS | Sort-Object -Descending | Set-Content $brewfileJustinMS
}
New-Alias -Name sort-brewfile -Value Sort-BrewfileFunction
# <<< homebrew <<<

# >>> python >>>
New-Alias -Name pip -Value pip3
New-Alias -Name python -Value python3

function Set-VenvFunction { & ./.venv/Scripts/Activate.ps1 }
New-Alias -Name set-venv -Value Set-VenvFunction

function Create-VenvFunction {
    python -m venv .venv
    Set-VenvFunction
}
New-Alias -Name create-venv -Value Create-VenvFunction

function Get-RequirementsFunction { pip freeze > requirements.txt }
New-Alias -Name get-requirements -Value Get-RequirementsFunction

function Install-VenvFunction {
    Set-VenvFunction
    pip install -r requirements.txt
}
New-Alias -Name install-venv -Value Install-VenvFunction

function Quit-VenvFunction { deactivate }
New-Alias -Name quit-venv -Value Quit-VenvFunction
# <<< python <<<

# >>> shell >>>
function Get-AliasesFunction { Get-Alias | Format-Table -AutoSize }
New-Alias -Name get-aliases -Value Get-AliasesFunction
# <<< shell <<<

# >>> oh my posh >>>
oh-my-posh init pwsh --config '~/.ohmyposh/amro-custom.json' | Invoke-Expression
# <<< oh my posh <<<

# >>> sqlpackage >>>
$env:PATH = "/Users/justin/.sqlpackage:" + $env:PATH
# <<< sqlpackage <<<

# >>> vscode >>>
$env:PATH = "/Applications/Visual Studio Code.app/Contents/Resources/app/bin:" + $env:PATH
# <<< vscode <<<