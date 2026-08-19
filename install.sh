#!/usr/bin/env bash
# One-command bootstrap for the `dotfiles` provisioning binary:
#
#   curl -fsSL https://raw.githubusercontent.com/retsohuang/homebrew-dotfiles/main/install.sh | bash
#
# Binary only. `dotfiles setup` — the profile pick, gh auth and cross-profile
# confirmation — stays outside this script so it keeps a real stdin.
# Hand-maintained: the release workflow never writes this file.

set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  # Under `curl … | bash` stdin is the script itself, so Homebrew's
  # press-RETURN prompt would hang. NONINTERACTIVE skips it; sudo still prompts
  # because it reads /dev/tty directly.
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # A fresh install is not on this shell's PATH yet.
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew refuses to load formulae from an untrusted third-party tap, and a
# bare machine's trust store starts empty. Tolerated failure: older Homebrew
# has no trust subsystem and no refusal either.
brew trust retsohuang/dotfiles || true

brew install retsohuang/dotfiles/dotfiles

printf '\nnow run: dotfiles setup\n'
