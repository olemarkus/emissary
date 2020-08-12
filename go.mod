module github.com/datawire/ambassador

go 1.13

// If you're editing this file, there's a few things you should know:
//
//  1. Avoid the `replace` command as much as possible.  Go only pays
//     attention to the `replace` command when it appears in the main
//     module, which means that if the `replace` command is required
//     for the compile to work, then anything using ambassador.git as
//     a library needs to duplicate that `replace` in their go.mod.
//     We don't want to burden our users with that if we can avoid it
//     (since we encourage them to use the gRPC Go libraries when
//     implementing plugin services), and we don't want to deal with
//     that ourselves in apro.git.
//
//     The biggest reason we wouldn't be able to avoid it is if we
//     need to pull in a library that has a `replace` in its
//     go.mod--just as us adding a `replace` to our go.mod would
//     require our dependents to do the same, our dependencies adding
//     a `replace` requires us to do the same.  And even then, if
//     we're careful we might be able to avoid it.
//
//  2. If you do add a `replace` command to this file, always include
//     a version number to the left of the "=>" (even if you're
//     copying the command from a dependnecy and the dependency's
//     go.mod doesn't have a version on the left side).  This way we
//     don't accidentally keep pinning to an older version after our
//     dependency's `replace` goes away.  Sometimes it can be tricky
//     to figure out what version to put on the left side; often the
//     easiest way to figure it out is to get it working without a
//     version, run `go mod vendor`, then grep for "=>" in
//     `./vendor/modules.txt`.  If you don't see a "=>" line for that
//     replacement in modules.txt, then that's an indicator that we
//     don't really need that `replace`, maybe replacing it with a
//     `require` (or not; see the notes on go-autorest below).
//
//  3. If you do add a `replace` command to this file, you must also
//     add it to the go.mod in apro.git (see above for explanation).
//
//  4. We used to use complex hacks to manage the Kubernetes library
//     versions (since the Kubernetes folks made it such a nightmare),
//     but recent versions of Kubernetes 1.y.z now have useful
//     "v0.y.z" git tags that Go understands, so it's actually quite
//     reasonable now.  If you find yourself having to do any hacks
//     with k8s.io library versions (like doing a `replace` for a
//     dozen different k8s.io/ packages), stop, and ask someone for
//     advice.
//
//  5. Use `make go-mod-tidy` instead of `go mod tidy`.  Unlike normal
//     `go mod tidy`, it will make sure we're not missing anything
//     that's needed for `make generate`.

require (
	git.lukeshu.com/go/libsystemd v0.5.3
	github.com/Masterminds/semver v1.4.2
	github.com/Masterminds/sprig v2.17.1+incompatible
	github.com/Masterminds/squirrel v1.4.0 // indirect
	github.com/aokoli/goutils v1.1.0 // indirect
	github.com/asaskevich/govalidator v0.0.0-20200428143746-21a406dcc535 // indirect
	github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869
	github.com/census-instrumentation/opencensus-proto v0.2.1
	github.com/cncf/udpa/go v0.0.0-20200324003616-bae28a880fdb
	github.com/containerd/containerd v1.3.4 // indirect
	github.com/datawire/pf v0.0.0-20180510150411-31a823f9495a
	github.com/dgrijalva/jwt-go v3.2.0+incompatible
	github.com/ecodia/golang-awaitility v0.0.0-20180710094957-fb55e59708c7
	github.com/envoyproxy/protoc-gen-validate v0.3.0-java.0.20200609174644-bd816e4522c1
	github.com/fsnotify/fsnotify v1.4.9
	github.com/go-openapi/validate v0.19.5
	github.com/golang/protobuf v1.4.2
	github.com/google/go-cmp v0.4.0
	github.com/google/shlex v0.0.0-20181106134648-c34317bd91bf
	github.com/google/uuid v1.1.1
	github.com/gookit/color v1.2.3
	github.com/gorilla/websocket v1.4.1
	github.com/hashicorp/consul/api v1.3.0
	github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
	github.com/lib/pq v1.7.0 // indirect
	github.com/mholt/archiver/v3 v3.3.0
	github.com/miekg/dns v1.1.6
	github.com/mitchellh/mapstructure v1.1.2
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/pkg/browser v0.0.0-20180916011732-0a3d74bf9ce4
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.6.0 // indirect
	github.com/prometheus/client_model v0.2.0
	github.com/rubenv/sql-migrate v0.0.0-20200616145509-8d140a17f351 // indirect
	github.com/sirupsen/logrus v1.6.0
	github.com/spf13/cobra v1.0.0
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.6.1
	github.com/xeipuuv/gojsonschema v1.2.0 // indirect
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9
	golang.org/x/net v0.0.0-20200520004742-59133d7f0dd7
	golang.org/x/sys v0.0.0-20200420163511-1957bb5e6d1f
	google.golang.org/genproto v0.0.0-20200115191322-ca5a22157cba
	google.golang.org/grpc v1.27.0
	google.golang.org/protobuf v1.23.0
	gopkg.in/natefinch/lumberjack.v2 v2.0.0
	gopkg.in/yaml.v2 v2.3.0
	helm.sh/helm/v3 v3.2.4
	k8s.io/api v0.18.4
	k8s.io/apiextensions-apiserver v0.18.4
	k8s.io/apimachinery v0.18.4
	k8s.io/cli-runtime v0.18.4
	k8s.io/client-go v0.18.4
	k8s.io/helm v2.16.9+incompatible
	rsc.io/letsencrypt v0.0.3 // indirect
	sigs.k8s.io/controller-runtime v0.6.1
	sigs.k8s.io/controller-tools v0.3.1-0.20200517180335-820a4a27ea84
	sigs.k8s.io/yaml v1.2.0
	github.com/census-instrumentation/opencensus-proto v0.2.1
	github.com/cncf/udpa/go v0.0.0-20200313221541-5f7e5dd04533
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	github.com/golang/protobuf v1.4.2
	github.com/google/go-cmp v0.4.0
	github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4
	github.com/stretchr/testify v1.5.1
	google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55
	google.golang.org/grpc v1.27.0
	google.golang.org/protobuf v1.23.0
)

// We need to inherit this from helm.sh/helm/v3
replace (
	github.com/docker/docker v0.0.0-00010101000000-000000000000 => github.com/moby/moby v0.7.3-0.20190826074503-38ab9da00309
	github.com/docker/docker v1.4.2-0.20181221150755-2cb26cfe9cbf => github.com/moby/moby v0.7.3-0.20190826074503-38ab9da00309
)

// The issue doesn't trigger with the current versions of our
// dependencies, but if you ever get an error message like:
//
//     /path/to/whatever.go.go:7:2: ambiguous import: found package github.com/Azure/go-autorest/autorest in multiple modules:
//            github.com/Azure/go-autorest v10.8.1+incompatible (/home/lukeshu/go/pkg/mod/github.com/!azure/go-autorest@v10.8.1+incompatible/autorest)
//            github.com/Azure/go-autorest/autorest v0.9.0 (/home/lukeshu/go/pkg/mod/github.com/!azure/go-autorest/autorest@v0.9.0)
//
// then uncomment the `replace` line below, adjusting the version
// number to the left of the "=>" to match the error message.
//
// The go-autorest one is a little funny; we don't actually use that
// module; we use the nested "github.com/Azure/go-autorest/autorest"
// module, which split off from it some time between v11 and v13; and
// we just need to tell it to consider v13 instead of v11 so that it
// knows to use the nested module (instead of complaining about
// "ambiguous import: found package in multiple modules").  We could
// do this with
//
//     require github.com/Azure/go-autorest v13.3.2+incompatible
//
// but `go mod tidy` would remove it and break the build.  We could
// inhibit `go mod tidy` from removing it by importing a package from
// it in `./pkg/ignore/pin.go`, but there are actually no packages in
// it to import; it's entirely nested modules.
//
replace github.com/Azure/go-autorest v10.8.1+incompatible => github.com/Azure/go-autorest v13.3.2+incompatible
