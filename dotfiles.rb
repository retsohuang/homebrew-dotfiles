class Dotfiles < Formula
  desc "Provisioning orchestrator for Retso's dotfiles (sync and bare-machine setup)"
  homepage "https://github.com/retsohuang/homebrew-dotfiles"
  version "0.1.3"
  url "https://github.com/retsohuang/homebrew-dotfiles/releases/download/v#{version}/dotfiles-darwin-arm64.tar.gz"
  sha256 "db1fe0ee9b0425479cc840fe31826046594d002f665213a0e35207ba7e6fe0ad"

  def install
    bin.install "dotfiles"
  end

  test do
    assert_match "dotfiles", shell_output("#{bin}/dotfiles --version")
  end
end
