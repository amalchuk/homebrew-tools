class Softnet < Formula
  version "0.19.0"
  sha256 "1612e1296834aae0b6389650c7c5190add1ee8d71474e328691e67679ecda53c"

  url "https://github.com/openai/softnet/releases/download/#{version}/softnet.tar.gz"
  desc "Software networking with isolation for Tart"
  homepage "https://github.com/openai/softnet"

  depends_on :macos

  def install
    bin.install "softnet"
  end

  test do
    system bin/"softnet", "--help"
  end
end
