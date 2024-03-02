# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Isx < Formula
    desc "isxcode organization-specific development tools"
    homepage "https://github.com/isxcode/isx-cli"
    url "https://github.com/isxcode/isx-cli/releases/download/v1.1.0/isx_darwin_arm64"
    version "1.1.0"
    sha256 "0b16fb5bc6579e71a8a186a691e6b6c10b25c1fc339775621d4c34f4e340a1de"
    license "Apache-2.0"
  
    # depends_on "cmake" => :build
  
    def install
      # Remove unrecognized options if they cause configure to fail
      # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
      # system "./configure", "--disable-silent-rules", *std_configure_args
      bin.install "isx_darwin_arm64" => "isx"
      # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    end
  
    # test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test isx`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      # system "false"
    # end
  end
  