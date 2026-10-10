class Dotfiles < Formula
  desc "Provisioning orchestrator for Retso's dotfiles (sync and bare-machine setup)"
  homepage "https://github.com/retsohuang/homebrew-dotfiles"
  version "0.2.6"
  url "https://github.com/retsohuang/homebrew-dotfiles/releases/download/v#{version}/dotfiles-darwin-arm64.tar.gz"
  sha256 "01976f55d5ec34959c7eaf32092ade225b637f1757e54d86787c82cbff73fdcc"

  def install
    bin.install "dotfiles"
  end

  test do
    assert_match "dotfiles", shell_output("#{bin}/dotfiles --version")
  end
end
