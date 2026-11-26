class Feluda < Formula
  desc "Terminal UI for the Feluda AI code reviewer"
  homepage "https://github.com/feluda-sh/cli"
  version "1.0.0-beta.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.2/feluda-aarch64-apple-darwin.tar.xz"
      sha256 "bbf803c080505751eb566932c2f0f5aef44c7c3f7f89d1c9375dac211f26b30b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.2/feluda-x86_64-apple-darwin.tar.xz"
      sha256 "0c13adb586f0a900d0cfef29c56e03aab29e52d7643a80a8f274989538b75521"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.2/feluda-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "08bfbc0e50b3fe534d6ce613f03bf4df4b120d10210c9c732cc09856cef2df36"
    end
    if Hardware::CPU.intel?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.2/feluda-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3de358216a961cabafc8edaf32440aef37a052df411a6aba83b48bd51d6fd17b"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "feluda"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "feluda"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "feluda"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "feluda"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
