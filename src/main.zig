const std = @import("std");

const Color3 = @import("datatypes/Color3.zig");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"Gargantuan"});

    const color = Color3{ .r = 1, .g = 0.75, .b = 0.5 };
    std.debug.print("Color3: {}", .{color});
}
