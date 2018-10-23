require 'formula'

class Libvncserver < Formula
  desc "LibVNCServer: A library for easy implementation of a VNC server."
  homepage 'https://github.com/LibVNC/libvncserver'
  url 'https://github.com/LibVNC/libvncserver/archive/LibVNCServer-0.9.11.tar.gz'
  sha256 '193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894'

  depends_on 'libjpeg-turbo'

  def install
    system "./configure", "--with-jpeg=#{HOMEBREW_PREFIX}/opt/jpeg-turbo",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
