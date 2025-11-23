# dot-zsh

Personal Zsh configuration for macOS with zinit plugins, Starship prompt, fzf-backed history search, safe defaults, and a curated Homebrew bundle.

## What's inside
- Zsh config (`.zshrc`) loading Starship, zinit, Oh My Zsh libs/plugins (git, history, directories, extract, docker completions, aws-vault completions), and custom scripts.
- Environment defaults (`.zshenv`): PATH for Go/Rust/node toolchains, FZF defaults, Starship config path, large history sizes, notification thresholds.
- Prompt options: Starship config (`starship.toml`) plus optional themes (`themes/myfishymod.zsh-theme`, `themes/spaceship.zsh-theme`).
- Custom scripts (`script/*.zsh`):
  - `fzf.zsh`: Ctrl-R history search via fzf.
  - `alias.zsh`: safe rm (use `trash`), `cat` -> `bat`, `ls` -> `eza` (`ll`/`la`), brew deps helper, `code` -> `cursor`.
  - `xenv.zsh`: nodenv + direnv hooks.
  - `notifier.zsh`: desktop notification when a command exceeds `NOTIFICATION_THRESHOLD`.
  - `decode.zsh`: `en64`/`de64` helpers.
  - `copilot.zsh`: `cs` wrapper for `gh copilot suggest -t shell`.
  - `aitools.zsh`: `ai memory` sets up per-repo `AI_MEMORY.md` storage/symlinks (configure via `AI_MEMORY_PATH`).
  - Optional helpers for AWS/kubectl are present but commented out in `.zshrc`.
- Completion: `complete/_aws-vault` wired through zinit.
- Keybindings: `DefaultKeyBinding.dict` for macOS Home/End behavior.
- Package bundle: `Brewfile` for CLI tools (zsh, fzf, eza, ripgrep, bat, starship, shellfirm, nodenv, direnv, awscli, etc.) and common casks (iTerm2, Rectangle, Docker, Alfred, etc.).
- Vim setup: installs `amix/vimrc` basic runtime.

## Prerequisites
- macOS with Git and curl available.
- Homebrew is required (zsh and other tools are installed via the Brewfile). If you don't have it, step 2 below will install it to `/opt/homebrew`.

## Install
1. Clone into `~/.zsh`:
   ```sh
   git clone git@github.com:SunnyNiu/dot-zsh.git ~/.zsh
   ```
2. Install Homebrew (if missing) and all required packages (including zsh):
   ```sh
   sh ~/.zsh/brew.sh
   ```
   If Homebrew is already installed and you just want the bundle, run:
   ```sh
   brew bundle --file ~/.zsh/Brewfile
   ```
3. Run the installer:
   ```sh
   sh ~/.zsh/install.sh
   ```
   - Installs zinit to `~/.zinit`.
   - Fixes insecure completion permissions (`compaudit | xargs chmod g-w`).
   - Backs up existing `~/.zshrc`/`~/.zshenv` to `.backup`, creates `~/.z`, and symlinks `.zshrc`, `.zshenv`, `.hushlogin`, `.huskyrc`, `.bat.conf`, `.global_gitignore` (sets as global excludesfile). Links `DefaultKeyBinding.dict` into `~/Library/KeyBindings`.
   - Installs basic `amix/vimrc` runtime.
   - Sets `git config --global pull.ff only`.
4. Start a new shell (or `exec zsh`) to load everything.

## Optional setup
- SSH key:
  ```sh
  sh ~/.zsh/ssh.sh
  ```
  Generates an RSA key, configures `~/.ssh/config`, adds to agent/keychain, and copies the public key to the clipboard.

## Daily use tips
- History search: press Ctrl-R for fzf-backed history (`script/fzf.zsh`).
- Safe defaults: `rm`/`safe-rm` are blocked; use `trash` or `/bin/rm`. `cat` -> `bat`, `ls` -> `eza` (`ll`/`la`).
- AI memory: `ai memory` creates/opens a per-repo `AI_MEMORY.md` under `$AI_MEMORY_PATH` (default `~/.ai-memory`) and symlinks `.augment-guidelines`/`CLAUDE.md`/`GEMINI.md` to it.
- Notifications: commands longer than `$NOTIFICATION_THRESHOLD` seconds (default 120) trigger `terminal-notifier` unless matching `$NOTIFICATION_BLACKLIST`.
- Git: global excludes at `~/.global_gitignore`; `pull.ff only` enforced.

## Customize
- Secrets/local tweaks: add them in `~/.zshenv.local` (sourced if present).
- Prompt: edit `~/.zsh/starship.toml` or switch to `themes/myfishymod.zsh-theme` by enabling it in `.zshrc`.
- Node/Python/Ruby envs: nodenv/direnv hooks live in `script/xenv.zsh`; uncomment other local scripts in `.zshrc` as needed (AWS/k8s helpers, custom theme).
- AI memory location: set `AI_MEMORY_PATH` in your environment.

## File map
- `~/.zsh/.zshrc` - main shell config and zinit plugin setup.
- `~/.zsh/.zshenv` - environment vars, PATH, history sizing, Starship config path.
- `~/.zsh/script/*.zsh` - custom functions/aliases/hooks (see above).
- `~/.zsh/starship.toml` - Starship prompt config.
- `~/.zsh/themes/` - optional prompt themes.
- `~/.zsh/complete/_aws-vault` - aws-vault completion.
- `~/.zsh/Brewfile` - Homebrew bundle.
- `~/.zsh/DefaultKeyBinding.dict` - macOS keybinding overrides.

## Maintenance
- Update plugins: `zinit self-update && zinit update --parallel`.
- Update tools: edit `~/.zsh/Brewfile`, then `brew bundle --file ~/.zsh/Brewfile`.
