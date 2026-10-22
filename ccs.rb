class Ccs < Formula
  desc "Multi-provider profile manager for Claude Code (fork sharing ~/.claude/rules)"
  homepage "https://github.com/retsohuang/ccs"
  url "https://github.com/retsohuang/ccs/archive/refs/tags/v8.10.0-retso.4.tar.gz"
  version "8.10.0-retso.4"
  sha256 "72d7f7174fa825897bd16e9e8805ac8cd3dec107fac2ecacdf03404468a2b0fb"
  license "MIT"

  depends_on "bun" => :build
  depends_on "node"

  def install
    system "bun", "install"
    system "bun", "run", "build:all"
    system "bun", "install", "--production", "--ignore-scripts"

    libexec.install "dist", "lib", "scripts", "config", ".claude", "node_modules", "package.json"

    {
      "ccs"       => "dist/ccs.js",
      "ccs-droid" => "dist/bin/droid-runtime.js",
      "ccsd"      => "dist/bin/droid-runtime.js",
      "ccs-codex" => "dist/bin/codex-runtime.js",
      "ccsx"      => "dist/bin/codex-runtime.js",
      "ccsxp"     => "dist/bin/ccsxp-runtime.js",
    }.each do |name, target|
      bin.install_symlink libexec/target => name
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccs --version")
  end
end
