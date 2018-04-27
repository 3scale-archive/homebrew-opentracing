class NginxOpentracing < Formula
  desc "NGINX plugin for OpenTracing"
  homepage "https://github.com/opentracing-contrib/nginx-opentracing"
  url "https://github.com/opentracing-contrib/nginx-opentracing/archive/v0.3.0.tar.gz"
  sha256 "2d2b8784a09c7bb4ae7f8a76ab679c54a683b8dda26db2f948982de0ad44c7a5"
  bottle :unneeded
  depends_on "opentracing" => :build

  def install
    pkgshare.install Dir["opentracing/*"]
  end

  test do
    File.exist? pkgshare/"opentracing"/"config"
  end
end
