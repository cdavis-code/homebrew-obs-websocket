# typed: false
# frozen_string_literal: true

# Homebrew formula for obs-mcp
# Install with: brew tap cdavis-code/obs-websocket && brew install obs-mcp
class ObsMcp < Formula
  desc "MCP server for controlling OBS Studio via the obs-websocket v5.x protocol"
  homepage "https://github.com/cdavis-code/obs_websocket_workspace"
  version "5.7.2+2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-mcp-darwin-arm64"
      sha256 "ba9f406e3158a1c19ae275961847f49aa5ff50f0c38fee90c5858109c7ef601a"
    else
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-mcp-darwin-amd64"
      sha256 "c90bd5925fbd13eab926ff12a75d7c9a2717ac523f6dc34fd0b6160b24ba51a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-mcp-linux-arm64"
      sha256 "4fd11c093c8750864dde9f8d7ae9f7edaf2668713f1af4ab4fe6af06e93118fa"
    else
      url "https://github.com/cdavis-code/obs_websocket_workspace/releases/download/v#{version}/obs-mcp-linux-amd64"
      sha256 "0975b2e7a8fb763a5fc1c3a53f2538172a1c642ff35201aeee537de9bc141c29"
    end
  end

  # Development / HEAD install: brew install --head obs-mcp
  head "https://github.com/cdavis-code/obs_websocket_workspace.git", branch: "main"

  def install
    bin.install Dir["*"].first => "obs-mcp"
  end

  test do
    assert_match "usage", shell_output("#{bin}/obs-mcp --help 2>&1 || true")
  end
end
