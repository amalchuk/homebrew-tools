class Softnet < Formula
  url "https://github.com/openai/softnet/releases/download/0.19.0/softnet.tar.gz"
  sha256 "1612e1296834aae0b6389650c7c5190add1ee8d71474e328691e67679ecda53c"
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
