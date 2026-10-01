class Packer < Formula
  url "https://github.com/hashicorp/packer/archive/refs/tags/v1.16.1.tar.gz"
  sha256 "4256f078ac9f5c6b154b2b56ced4be77ef8326387002d30596dd7ac39960142c"
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
