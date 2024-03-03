class Isx < Formula
  desc "isxcode organization-specific development tools"
  homepage "https://github.com/isxcode/isx-cli"
  url "https://github.com/isxcode/isx-cli/releases/download/v1.1.0/isx_darwin_arm64"
  version "1.1.0"
  sha256 "0b16fb5bc6579e71a8a186a691e6b6c10b25c1fc339775621d4c34f4e340a1de"
  license "Apache-2.0"

  # depends_on "cmake" => :build

  checksums = {
    "darwin-arm64" => "0b16fb5bc6579e71a8a186a691e6b6c10b25c1fc339775621d4c34f4e340a1de",
    # "darwin-intel" => ""
    "linux-arm64" => "https://github.com/isxcode/isx-cli/releases/download/v1.1.0/isx_linux_amd64",
    # "linux-intel" => ""
  }

  on_macos do
    on_arm do
      url "https://github.com/isxcode/isx-cli/releases/download/v#{version}/isx_darwin_arm64"
      sha256 checksums["darwin-arm64"]
    end
    # on_intel do
    #   url "https://github.com/isxcode/isx-cli/releases/download/v#{version}/isx_darwin_intel"
    #   sha256 checksums["darwin-intel"]
    # end
  end

  on_linux do
    on_arm do
      url "https://github.com/isxcode/isx-cli/releases/download/v#{version}/isx_linux_arm64"
      sha256 checksums["linux-amd64"]
    end
        # on_intel do
    #   url "https://github.com/isxcode/isx-cli/releases/download/v#{version}/isx_linux_intel"
    #   sha256 checksums["darwin-intel"]
    # end
  end


  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    arch = Hardware::CPU.intel? ? "intel" : Hardware::CPU.arch.to_s if OS.mac?
    kernel = OS.mac? ? "darwin" : "linux"
    bin.install "isx_#{kernel}_#{arch}" => "isx"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test isx`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_match "https://github.com/isxcode/isx-cli", shell_output("#{bin}/isx -h")
  end
end