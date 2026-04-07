class LanesmithCli < Formula
  desc "Bridge daemon for LaneSmith — run terminal commands from the sandboxed app"
  homepage "https://github.com/bennyyy999/LaneSmith-CLI"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bc12f40a066f4db520b0cda99d496b12a512fb426c614754cc7d0f91345b1ac8"
    elsif Hardware::CPU.intel?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "03e755426a1fc0886c638fdc84eb3780309aea8958082d1c29faf7b07bde2d09"
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
