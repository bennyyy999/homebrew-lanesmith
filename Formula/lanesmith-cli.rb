class LanesmithCli < Formula
  desc "Bridge daemon for LaneSmith — run terminal commands from the sandboxed app"
  homepage "https://github.com/bennyyy999/LaneSmith-CLI"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "00cbb342ad6debd14b5f05d1ca6466828eab1a6744e6db219638605543d3ccd5"
    elsif Hardware::CPU.intel?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3f706f9b5caa0539fe0605ede651c8e98c021b447cdd62e12dcfa018e27d9eb5"
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
