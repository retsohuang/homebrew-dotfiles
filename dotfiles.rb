class Dotfiles < Formula
  desc "Provisioning orchestrator for Retso's dotfiles (sync and bare-machine setup)"
  homepage "https://github.com/retsohuang/homebrew-dotfiles"
  version "0.0.0"
  url "https://github.com/retsohuang/homebrew-dotfiles/releases/download/v#{version}/dotfiles-darwin-arm64.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  def install
    bin.install "dotfiles"
  end

  test do
    assert_match "dotfiles", shell_output("#{bin}/dotfiles --version")
  end
end
