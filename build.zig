const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "gargantuan",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    // const dep_luau = b.dependency("luau", .{ .target = target, .optimize = optimize });
    // exe.root_module.addImport("luau", dep_luau.module("luau"))

    b.installArtifact(exe);

    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run the application");
    if (b.args != null) run_exe.addArgs(b.args.?);
    run_step.dependOn(&run_exe.step);
}
