# BOOTSTRAP DEVELOPMENT ENVIRONMENT

# Apple Settings:
### Dock
- Dock Size: Slider at 33%
- Position: Left
- Enable "Minimize windows into application icon"
- Disable "Show recent applications in Dock" 

### Keyboards 
Change modifiers:
- Option --> Command
- Command --> Option

Shortcuts:
- Disable most defaults to free up key combos
- Especially under "mission control"

Internal Keyboard:
- Key Repeat: Slider at 100% fast
- Delay Until Repeater: Slider at 100% short
- Change "Press Globe (fn)" to "Do Nothing"

### Trackpad
- Disable "Look up & data detectors"
- Disable "Force Click and haptic feedback"
- Click = "Firm"
- Tracking Speed: Slider at about 33%
- Scroll & Zoom Disable "Zoom in or out"
- Scroll & Zoom Disable "Smart zoom"

### Mouse
- Both sliders at 100%
- Download [Scroll Reverser](https://github.com/pilotmoon/Scroll-Reverser)
	- Enable "Reverse Vertical"
	- Enable "Reverse Mouse"

### Battery
- Turn display off after: 15 min
- Disable "Optimize video streaming while on battery"

----

# Apple Store Things:
- 1Password, scan QR code from phone
- Slack

# Apps from the web:
- Download Chrome through Safari.
- Chrome default browser, sync profiles after 1password set up
- Dropbox
- Discord
- Spotify

----

# Setting up Dev Environment:
### Dotfiles 
- `cp .vimrc $HOME/.vimrc`
- `cp .zshrc $HOME/.zshrc`

### Homebrew
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### OS Helpers
- [Karabiner](https://karabiner-elements.pqrs.org/)
  - Simple modifications (all devices)
    - caps_lock --> grace_accent_and_tilde 

- [Rectangle](https://github.com/rxhanson/Rectangle)
  - `brew install --cask rectangle`
  - Settings > Import > [RectangleConfig.json](./RectangleConfig.json)

- [Scroll Reverser](https://github.com/pilotmoon/Scroll-Reverser)
  - Enable "Reverse Vertical"
  - Enable "Reverse Mouse"

### Git
- `brew install git`
- git config --global init.defaultBranch main
- `mkdir ~/workspace`
- add ~/workspace/.gitconfig_personal from dotfiles
- generate ssh key:  `ssh-keygen -t ed25519 -C "${PERSONAL_GITHUB_EMAIL}"`
- start ssh-agent:  `eval "$(ssh-agent -s)"`
- create ssh config: `vim ~/.ssh/config`
- add to ssh config:
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
- add the public key to github account
- if adding multiple git accounts, the .git-credentials file in each account repo (workspace, company_name, etc) is just one line:
`https://{{username}}:{{PAT}}@github.com`

### Python
- Install `pyenv` build dependencies
- `brew install openssl readline sqlite3 xz zlib`
- Historically, I have installed pyenv from source. 
- Going to try through homebrew and see if things have improved
- `brew install pyenv`
- `pyenv install --list`
- `pyenv install $PYTHON_VERSION`
- so far so good...
- `brew install pyenv-virtualenv`
- maybe in the future `venv` will just be default?

### Javascript
- Installing Node Version Manager 
- Historically, I have also installed nvm from source.
- Going to try through Homebrew...
- `brew install fnm`
- `fnm completions --shell`
- Install long term stable version
- Install globals like typescript yarn
- `npm install --global yarn`


# IDEs
### PyCharm
- Add pyenv interpreter
- Copy configs to application dir...
  - `cp "./ide/pycharm/bc_keymap.xml "$HOME/Library/Application Support/Jetbrains/PyCharm/bc_keymap.xml`
- Old pycharm configs in dropbox for reference

Plugins:
- Key Promoter X
- AWS Toolkit

### VS Code
- Copy configs to application dir...
  - `cp "./ide/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"`
  - `cp "./ide/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"`

Plugins:
- Docker
- Javascript: ES7 + React/Redux/React-Native Snippets by dsznajder
- Javascript: Auto Import - ES6, TS, JSX, TSX by steoates
- Javascript: Turbo Console Log by ChakrounAnas
- Jupyter
- Jupyter Keymap
- Hashicorp Terraform
- Prettier
- Python
- Python Environment Manager by Don Jayamanne
- Python Quick Logger by Brian Crant
- Remote - Containers

### CLIs

- autoconf
- awscli
- bash-completion
- ca-certificates
- coreutils
- csvkit
- docker
- docker-buildx
- docker-completion
- ffmpeg
- fnm
- helm
- jq
- mcfly
- mp4box
- npam
- openssl
- rust
- telnet
- terragrunt
- tfenv
- tfsec
- tldr
- tree
- wget
- vlc
- zsh-completions
- zstd

`brew install atom awscli aws-cdk csvkit ffmpeg jq mcfly npam telnet tree wget`

# TODO: Probably could make most of this a shell script 
