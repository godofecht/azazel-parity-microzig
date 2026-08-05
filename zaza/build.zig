const std = @import("std");
// microzig's flags parser consumed through the standard Zig build graph Zaza is
// built on. flags is std-only, so Zaza's C/C++ target DSL does not apply.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const flags = b.createModule(.{ .root_source_file = b.path("vendor/flags.zig"), .target = target, .optimize = optimize });
    const exe = b.addExecutable(.{ .name = "flags_consumer", .root_module = b.createModule(.{ .root_source_file = b.path("src/main.zig"), .target = target, .optimize = optimize }) });
    exe.root_module.addImport("flags", flags);
    b.installArtifact(exe);
    const run = b.addRunArtifact(exe);
    b.step("run", "Build the flags consumer and run it").dependOn(&run.step);
}
