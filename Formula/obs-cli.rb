# typed: false
# frozen_string_literal: true

# Homebrew formula for obs-cli
# Install with: brew tap cdavis-code/obs-websocket && brew install obs-cli
class ObsCli < Formula
  desc "CLI tool for controlling OBS Studio via the obs-websocket v5.x protocol"
  homepage "https://github.com/cdavis-code/obs_websocket_workspace"
  version "5.7.2+2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-cli-darwin-arm64"
      sha256 "e142affbb5bef8290bec017c6e032197b3fe5120d15916d7cb5e64e175c044bc"
    else
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-cli-darwin-amd64"
      sha256 "f0e406fb77063b821d7b4e57197661d796416ebde06461563e6e01d23aaa7f9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-cli-linux-arm64"
      sha256 "717286e81a8dc5bd5944ed1b04f3ba15af0e1afe3449eb654729ee80b3a7df82"
    else
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-cli-linux-amd64"
      sha256 "3ca45965d3638cded6ff57dd1ed72db9ea5f3403e216491d6d6eed2bc5e3f9d5"
    end
  end

  # Development / HEAD install: brew install --head obs-cli
  head "https://github.com/cdavis-code/obs_websocket_workspace.git", branch: "main"

  def install
    bin.install Dir["*"].first => "obs-cli"
  end

  test do
    assert_match "usage", shell_output("#{bin}/obs-cli --help 2>&1 || true")
  end
end
