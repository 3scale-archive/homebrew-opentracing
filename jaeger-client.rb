class JaegerClient < Formula
  desc "C++ OpenTracing binding for Jaeger"
  homepage "https://jaegertracing.io/"
  url "https://github.com/jaegertracing/jaeger-client-cpp/archive/v0.3.0.tar.gz"
  sha256 "6cd2520f40048747fbf8d511f8b82e1f072d7af88f3040590dce839ed1bd6d8c"

  depends_on "cmake" => :build

  fails_with :gcc do
    cause "Segfaults when used"
  end

  def install
    mkdir ".build" do
      cmake_args = std_cmake_args + %w[
        -DBUILD_SHARED_LIBS=1
        -DBUILD_TESTING=OFF
      ]

      cc = ENV.cc
      cxx = ENV.cxx

      begin
        # cmake barfs on https://github.com/ruslo/hunter/wiki/error.no.toolchain.info
        # no idea how to make it work other than to get rid of Homebrew clang wrappers
        ENV["CC"] = "/usr/bin/clang"
        ENV["CXX"] = "/usr/bin/clang++"
        system "cmake", "..", *cmake_args
      ensure
        ENV["CC"] = cc
        ENV["CXX"] = cxx
      end

      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test jaeger-client-cpp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
