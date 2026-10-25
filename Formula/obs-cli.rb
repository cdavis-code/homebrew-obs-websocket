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
      sha256 "4e62657a10ef96fc65219f7187e905ff4147f35f834875475ab43f8863b8d2ee"
    else
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-cli-darwin-amd64"
      sha256 "46aec4d3b5ee085b133d608d2bcc1639262fefbc8b0b1a6d42ed2224642f985f"
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
