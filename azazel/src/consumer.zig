//! Consumer of microzig's flags parser: defines a Flags struct (with the
//! required `default` decl) and parses CLI args, forcing the generic
//! flags.parse to instantiate and compile.
const std = @import("std");
const flags = @import("flags");

const Flags = struct {
    verbose: bool = false,
    name: []const u8 = "world",
    pub const default: Flags = .{};
};

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const parsed = try flags.parse(Flags, arena.allocator(), &[_][]const u8{ "prog", "--name=zaza" });
    std.debug.print("microzig flags: name={s} verbose={}\n", .{ parsed[0].name, parsed[0].verbose });
}
