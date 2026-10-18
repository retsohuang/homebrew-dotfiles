class Dotfiles < Formula
  desc "Provisioning orchestrator for Retso's dotfiles (sync and bare-machine setup)"
  homepage "https://github.com/retsohuang/homebrew-dotfiles"
  version "0.2.11"
  url "https://github.com/retsohuang/homebrew-dotfiles/releases/download/v#{version}/dotfiles-darwin-arm64.tar.gz"
  sha256 "70537abf2b02c64879d3ce38fe16250eea078ed2112aa550cbb6de67cf9deda7"

  def install
    bin.install "dotfiles"
  end

  test do
    assert_match "dotfiles", shell_output("#{bin}/dotfiles --version")
  end
end
