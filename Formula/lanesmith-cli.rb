class LanesmithCli < Formula
  desc "Bridge daemon for LaneSmith — run terminal commands from the sandboxed app"
  homepage "https://github.com/bennyyy999/LaneSmith-CLI"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3fbb00061e931f93015fd7ae86bcc43081a872fd373d6f268bf6fbca806433af"
    elsif Hardware::CPU.intel?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f59f7fcf91c3141eef2240328fbadffbf81ee03ef5144f3f0b62d4150acd2777"
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
