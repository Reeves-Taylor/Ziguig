const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const mod = b.addModule("ZiguigWindow", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });

    const glfw = b.dependency("glfw_zig", .{
        .target = target,
        .optimize = optimize,
    });

    const gl_bindings = @import("zigglgen").generateBindingsModule(b, .{
        .api = .gl,
        .version = .@"4.1",
        .profile = .core,
        .extensions = &.{ .ARB_clip_control, .NV_scissor_exclusive },
    });
    mod.linkLibrary(glfw.artifact("glfw"));
    mod.addImport("gl", gl_bindings);
    const libZiguigWindow = b.addLibrary(.{ .name = "ZiguigWindow", .linkage = .dynamic, .version = .{ .major = 0, .minor = 1, .patch = 0 }, .root_module = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    }) });
    b.installArtifact(libZiguigWindow);
}
