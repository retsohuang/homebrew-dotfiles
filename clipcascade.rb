class Clipcascade < Formula
  desc "Retso's fork of the ClipCascade desktop clipboard-sync client"
  homepage "https://github.com/retsohuang/ClipCascade"
  url "https://github.com/retsohuang/ClipCascade/releases/download/v3.2.0-retso.1/ClipCascade-3.2.0-retso.1-darwin-arm64.tar.gz"
  version "3.2.0-retso.1"
  sha256 "594c00ace138b504afdc7cf9eceb3e4dc45940f477a22637096f1740320853cd"
  license "GPL-3.0-only"

  depends_on arch: :arm64
  depends_on :macos

  def install
    prefix.install "ClipCascade.app"
  end

  test do
    assert_predicate prefix/"ClipCascade.app/Contents/MacOS/ClipCascade", :executable?
  end
end
