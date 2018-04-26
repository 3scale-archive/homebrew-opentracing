class Opentracing < Formula
  desc "OpenTracing API for C++"
  homepage "http://opentracing.io"
  url "https://github.com/opentracing/opentracing-cpp/archive/v1.3.0.tar.gz"
  sha256 "06dc5f9740d27dc4684399e491211be46a8069a10277f25513dadeb71199ce4c"
  depends_on "cmake" => :build

  def install
    mkdir ".build" do
      cmake_args = std_cmake_args + %w[
        -DBUILD_SHARED_LIBS=1
        -DBUILD_TESTING=OFF
      ]
      system "cmake", "..", *cmake_args
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test opentracing-cpp`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
