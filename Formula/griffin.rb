# This file is automatically generated, do not edit directly.

class Griffin < Formula
  desc "CLI tool for pulling secrets and other config, with version control."
  homepage "https://github.com/griffin-cli/griffin-cli"
  version_scheme 1

  version "v2.0.8"

  url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.8/griffin-v2.0.8-darwin-x64.tar.xz"
  sha256 "3490d210dcbf7846ce09957c89bd9f1815f03e01b612afd75cef474dabec0386"

  on_macos do
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.8/griffin-v2.0.8-darwin-arm64.tar.xz"
      sha256 "eb23766c2ad5887b8799a3659fd81534ff12bb25e634b2a9f6e9c7137c525bdb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.8/griffin-v2.0.8-linux-x64.tar.xz"
      sha256 "163e5620155d90661cede1c0c8e0eedf93722017ced0720c2381e769199349d1"
    end
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v2.0.8/griffin-v2.0.8-linux-arm64.tar.xz"
      sha256 "3593561b762b41d3fbbfbb6450f6ce93583bea2a32540d0665094fb8c59f92e2"
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
