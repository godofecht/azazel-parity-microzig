// Azazel builds a consumer of microzig's flags parser (tools/flags, std-only),
// declared as a CUE model, on the 0.17 lane (microzig's real toolchain). Source
// staged by ./fetch.sh into vendor/ (git-ignored).
package build

toolchain: zig: {
	lanes: ["0.17"]
	preferred: "0.17"
}

flags: #Module & {
	kind: "module"
	root: "vendor/flags.zig"
}

consumer: #Module & {
	kind: "exe"
	root: "src/consumer.zig"
	deps: ["flags"]
}
