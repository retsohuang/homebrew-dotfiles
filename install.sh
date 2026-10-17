#!/usr/bin/env bash
# One-command bootstrap for the `dotfiles` provisioning binary:
#
#   curl -fsSL https://raw.githubusercontent.com/retsohuang/homebrew-dotfiles/main/install.sh | bash
#
# Binary only. `dotfiles setup` — the profile pick, gh auth and cross-profile
# confirmation — stays outside this script so it keeps a real stdin.
# Hand-maintained: the release workflow never writes this file.

set -euo pipefail

# Under `curl … | bash` bash reads the script from stdin as it runs, and any
# command that also reads stdin swallows the lines after it. Wrapping the body
# in a function makes bash parse the whole file before anything runs.
main() {
  # shellcheck disable=SC2016 # written to .zprofile unexpanded
  local shellenv='eval "$(/opt/homebrew/bin/brew shellenv)"'
  local path_added=0

  if ! command -v brew >/dev/null 2>&1; then
    # Under `curl … | bash` stdin is the script itself, so Homebrew's
    # press-RETURN prompt would hang. NONINTERACTIVE skips it; sudo still prompts
    # because it reads /dev/tty directly.
    NONINTERACTIVE=1 /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # A fresh install is not on this shell's PATH yet.
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Nor on the login shell's, which this piped script cannot change. The
    # stow task later backs this file up and links the repo's .zprofile.
    if ! grep -qsF "$shellenv" "$HOME/.zprofile"; then
      printf '\n%s\n' "$shellenv" >>"$HOME/.zprofile"
    fi
    path_added=1
  fi

  # Homebrew refuses to load formulae from an untrusted third-party tap, and a
  # bare machine's trust store starts empty. Tolerated failure: older Homebrew
  # has no trust subsystem and no refusal either.
  brew trust retsohuang/dotfiles </dev/null || true

  brew install retsohuang/dotfiles/dotfiles </dev/null

  if [[ "$path_added" -eq 1 ]]; then
    printf '\nnow open a new terminal and run: dotfiles setup\n'
  else
    printf '\nnow run: dotfiles setup\n'
  fi
}

main "$@"
