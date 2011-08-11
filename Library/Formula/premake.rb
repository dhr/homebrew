require 'formula'

class Premake < Formula
  url 'http://downloads.sourceforge.net/project/premake/Premake/4.4/premake-4.4-beta3-src.zip'
  md5 '1f0e00f137f1a635ce8b578223997218'
  homepage 'http://industriousone.com/premake'
  version '4.4'

  def install
    # Linking against stdc++-static causes a library not found error on 10.7
    inreplace 'build/gmake.macosx/Premake4.make', '-lstdc++-static ', ''
    system "make -C build/gmake.macosx"

    # Premake has no install target, but its just a single file that is needed
    bin.install "bin/release/premake4"
  end
end
