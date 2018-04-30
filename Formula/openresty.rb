# Quite nasty, but it allows to extend existing formula without copying it.
Openresty = Formula["openresty/brew/openresty"].class
Openresty.class_eval do
  depends_on "nginx-opentracing" => :build
  depends_on "opentracing" => :build
  conflicts_with "openresty/brew/openresty", :because => "this extends the openresty formula"

  option "with-dynamic-modules", "Compile OpenTracing as Nginx dynamic module"

  def system(cmd, *args)
    case cmd
    when "./configure"
      nginx_opentracing = Formula["nginx-opentracing"].pkgshare
      args << "--add-#{build.with?("dynamic-modules") ? "dynamic-module" : "module"}=#{nginx_opentracing}"
      args.find { |arg| arg.start_with?("--with-cc-opt=") } << " -I#{Formula["opentracing"].opt_include}"
      args.find { |arg| arg.start_with?("--with-ld-opt=") } << " -L#{Formula["opentracing"].opt_lib}"
    end

    super
  end
end
