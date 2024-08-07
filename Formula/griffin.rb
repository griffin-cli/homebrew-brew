# This file is automatically generated, do not edit directly.

class Griffin < Formula
  desc "CLI tool for pulling secrets and other config, with version control."
  homepage "https://github.com/griffin-cli/griffin-cli"
  version_scheme 1

  version "v2.0.9"

  url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.9/griffin-v2.0.9-darwin-x64.tar.xz"
  sha256 "8969bf7b5bd042bc68fbc081628767fac19ab14e1d7a67373f42d7171842c05d"

  on_macos do
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.9/griffin-v2.0.9-darwin-arm64.tar.xz"
      sha256 "fdf5a4fdc4f31964d21991aca477ae08db23afafa0971e57d6e1ab4fa2d3ea19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.9/griffin-v2.0.9-linux-x64.tar.xz"
      sha256 "1339897ae6cb9a3a91d9656c6315d5babcbbc128ab75f81cf28a76a4709575d8"
    end
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.9/griffin-v2.0.9-linux-arm64.tar.xz"
      sha256 "48958466998212651c60929558f531117f8ad093ddb9250eb7840504e7d68b1e"
    end
  end

  def install
    inreplace "bin/griffin", /^CLIENT_HOME=/, "export GRIFFIN_OCLIF_CLIENT_HOME=#{libexec/"dist"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/griffin"
  end

  def caveats; <<~EOS
    Enable autocomplete for zsh by running

      $ griffin autocomplete zsh

    If you're using bash, run

      $ griffin autocomplete bash
  EOS
  end

  test do
    system bin/"griffin", "version"
  end
end
