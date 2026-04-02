class LanesmithCli < Formula
  desc "Bridge daemon for LaneSmith — run terminal commands from the sandboxed app"
  homepage "https://github.com/bennyyy999/LaneSmith-CLI"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "75c80f521f68e3f1b5ed3a727a6fedc7ed890e0746f5c4b03f1fb2ea12bd8de6"
    elsif Hardware::CPU.intel?
      url "https://github.com/bennyyy999/homebrew-lanesmith/releases/download/v#{version}/lanesmith-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e1ff3446764dc7368d36b2f7f69b8a1e23d11c8a7a9a077038a85bc253d97b1d"
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
