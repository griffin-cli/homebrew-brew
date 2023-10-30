# This file is automatically generated, do not edit directly.

class Griffin < Formula
  desc "CLI tool for pulling secrets and other config, with version control."
  homepage "https://github.com/griffin-cli/griffin-cli"
  version_scheme 1

  version "v0.1.2"

  url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.1.2/griffin-v0.1.2-darwin-x64.tar.xz"
  sha256 "9a6d0ad65b4c7118cbad51c73b9dcbed3cbea26b236950056a7db823bbbd76e7"

  on_macos do
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.1.2/griffin-v0.1.2-darwin-arm64.tar.xz"
      sha256 "dd63d9a6ca74683250d94dbbf8a5d57e91e4fc7237074e8a32d1344758bfd78a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.1.2/griffin-v0.1.2-linux-x64.tar.xz"
      sha256 "eabeb06ccf3f49da747888aa74a22dc3d6c1e55d28c983b08352f640a05c2152"
    end
    on_arm do
      url "https://github.com/griffin-cli/griffin-cli/releases/download/v0.1.2/griffin-v0.1.2-linux-arm64.tar.xz"
      sha256 "92512c4598f89c2894875b404c0979b4fe10752c34375e146561c98f38314dc4"
    end
  end

  def install
    inreplace "bin/griffin", /^CLIENT_HOME=/, "export GRIFFIN_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
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
