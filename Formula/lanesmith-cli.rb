class LanesmithCli < Formula
  desc "Bridge daemon for LaneSmith — run terminal commands from the sandboxed app"
  homepage "https://github.com/bennyyy999/LaneSmith-CLI"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bennyyy999/LaneSmith-CLI/releases/download/v#{version}/lanesmith-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d43270c90a3e2195890e2ae4f32057ef5349c1871fd5fc0874ab6d9a41c89848"
    elsif Hardware::CPU.intel?
      url "https://github.com/bennyyy999/LaneSmith-CLI/releases/download/v#{version}/lanesmith-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3175c39349a24be8a6e0b93fa9393e4f66782766f00dca021a64cce61a10dadb"
    end
  end

  def install
    bin.install "lanesmith-cli"
  end

  service do
    run [opt_bin/"lanesmith-cli", "start"]
    keep_alive true
    log_path var/"log/lanesmith-cli.log"
    error_log_path var/"log/lanesmith-cli-error.log"
  end

  test do
    assert_match "lanesmith-cli", shell_output("#{bin}/lanesmith-cli --version")
  end
end
