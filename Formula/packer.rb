class Packer < Formula
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.16.2.tar.gz"
  sha256 "de0fb9c389dee6acc24d07ae2af02a3f6c30710cba474646325371cf0d62bc78"
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://github.com/hashicorp/packer"

  depends_on "go" => :build

  def fetch
    system "go", "mod", "download"
  end

  def install
    ENV["CGO_ENABLED"] = "0"

    ldflags = %W[
      -X github.com/hashicorp/packer/version.GitCommit=#{tap.user}
      -X github.com/hashicorp/packer/version.GitDescribe=#{version}
      -X github.com/hashicorp/packer/version.Version=#{version}
      -X github.com/hashicorp/packer/version.VersionPrerelease=
      -X github.com/hashicorp/packer/version.VersionMetadata=
    ]
    tags = "netcgo" if OS.mac?

    system "go", "build", *std_go_args(ldflags:, tags:)
  end

  test do
    system bin/"packer", "--version"
  end
end
