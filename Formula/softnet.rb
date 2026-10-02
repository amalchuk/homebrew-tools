class Softnet < Formula
  url "https://github.com/openai/softnet/releases/download/0.23.0/softnet.tar.gz"
  sha256 "b5daa4e5efaef3c2716f872dcda3961a35b2bddcdf03fe630ac3db0ab8156f3e"
  desc "Software networking with isolation for Tart"
  homepage "https://github.com/openai/softnet"

  depends_on macos: :sequoia

  def install
    bin.install "softnet"
  end

  test do
    system bin/"softnet", "--help"
  end
end
