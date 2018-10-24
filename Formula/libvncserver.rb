# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libvncserver < Formula
  desc "LibVNCServer/LibVNCClient are cross-platform C libraries that allow you to easily implement VNC server or client functionality in your program."
  homepage "https://github.com/LibVNC/libvncserver"
  url "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-0.9.11.tar.gz"
  sha256 "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"

  depends_on "cmake" => :build
  depends_on "libjpeg-turbo"
  depends_on "openssl"
  depends_on "sdl"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    ohai std_cmake_args
    args = std_cmake_args + %W[
      -DLIBVNCSERVER_WITH_WEBSOCKETS=OFF
      .
    ]
    ohai args
    system "cmake", *args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libvncserver`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
