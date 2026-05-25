# typed: false
# frozen_string_literal: true

# Homebrew formula for obs-cli
# Install with: brew tap cdavis-code/obs-websocket && brew install obs-cli
class ObsCli < Formula
  desc "CLI tool for controlling OBS Studio via the obs-websocket v5.x protocol"
  homepage "https://github.com/cdavis-code/obs_websocket_workspace"
  version "5.7.0+2"
  license "MIT"

  url "https://github.com/cdavis-code/obs_websocket_workspace/archive/refs/tags/v5.7.0+2.tar.gz"
  sha256 "38bd74eeb3aad8d097e1fb04812c4a7069265d45c4e384da85f538dd62d2e40a"

  # Development / HEAD install: brew install --head obs-cli
  head "https://github.com/cdavis-code/obs_websocket_workspace.git", branch: "main"

  depends_on "dart-sdk" => :build

  def install
    cd "packages/obs_cli" do
      inreplace "pubspec.yaml", "resolution: workspace\n", ""
      system "dart", "pub", "get"
      system "dart", "compile", "exe",
             "bin/obs.dart",
             "-o", "obs-cli"
      bin.install "obs-cli"
    end
  end

  test do
    assert_match "usage", shell_output("#{bin}/obs-cli --help 2>&1 || true")
  end
end
