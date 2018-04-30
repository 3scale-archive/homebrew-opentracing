# homebrew-opentracing

Homebrew OpenResty OpenTracing suppoort Formulas 

You'll need to have the openresty/nginx tap available, becasue this tap just extends that one.

```shell
brew tap openresty/nginx
brew tap 3scale/opentracing
brew install 3scale/opentracing/openresty --with-dynamic-modules
brew install jaeger-client
```

