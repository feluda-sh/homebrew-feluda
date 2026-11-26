class Feluda < Formula
  desc "Terminal UI for the Feluda AI code reviewer"
  homepage "https://github.com/feluda-sh/cli"
  version "1.0.0-beta.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.1/feluda-aarch64-apple-darwin.tar.xz"
      sha256 "b95117f103e6992818ed7c140b871646e7f2e9b138900f4a93d5e6a6c7490829"
    end
    if Hardware::CPU.intel?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.1/feluda-x86_64-apple-darwin.tar.xz"
      sha256 "ca45b18471d25038e82da9b25b191388861b1fedf76db65310794b1bc95dbc3c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.1/feluda-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ad834d815155cbfd934c8fe86b0d74ec66327efdc191d378254446b81a2f28e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/feluda-sh/feluda-releases/releases/download/v1.0.0-beta.1/feluda-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4cea85964c133140d883316380a9370bc8a292e563bb66666954290b22320900"
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
