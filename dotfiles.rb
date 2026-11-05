class Dotfiles < Formula
  desc "Provisioning orchestrator for Retso's dotfiles (sync and bare-machine setup)"
  homepage "https://github.com/retsohuang/homebrew-dotfiles"
  version "0.8.5"
  url "https://github.com/retsohuang/homebrew-dotfiles/releases/download/v#{version}/dotfiles-darwin-arm64.tar.gz"
  sha256 "2e8afd667a314149eba5e3803ac4f4fd870acf60c1f643ee93906ae4c8cd9f29"

  def install
    bin.install "dotfiles"
  end

  test do
    assert_match "dotfiles", shell_output("#{bin}/dotfiles --version")
  end
end
