# homebrew-dotfiles

Homebrew tap for `dotfiles`, the provisioning CLI that syncs and sets up Retso's machines.

Binaries only — the source repository stays private. Each release here carries a prebuilt
arm64 macOS binary, published by the release workflow in the source repository.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/retsohuang/homebrew-dotfiles/main/install.sh | bash
```

Then run `dotfiles setup`.

Already have Homebrew? `brew install retsohuang/dotfiles/dotfiles` installs the binary
directly.
