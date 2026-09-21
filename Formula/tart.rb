class Tart < Formula
  version "2.32.1"
  sha256 "8554ab4f7fc12afe52f9b7e3093a935673cbac737a83973d2db7a0683c814529"

  url "https://github.com/openai/tart/releases/download/#{version}/tart.tar.gz"
  desc "Run macOS and Linux VMs on Apple Hardware"
  homepage "https://github.com/openai/tart"

  depends_on macos: :ventura

  depends_on "amalchuk/tools/softnet"

  def install
    prefix.install "tart.app"
    bin.install_symlink prefix/"tart.app/Contents/MacOS/tart" => "tart"
    generate_completions_from_executable(bin/"tart", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tart --version")
  end
end
