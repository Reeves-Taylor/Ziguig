const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const gl_bindings = @import("zigglgen").generateBindingsModule(b, .{
        .api = .gl,
        .version = .@"4.1",
        .profile = .core,
        .extensions = &.{ .ARB_clip_control, .NV_scissor_exclusive },
    });

    const glfw_dep = b.dependency("glfw", .{
        .target = target,
        .optimize = optimize,
    });

    // createModule for internal use, addModule to export to dependents
    const root_mod = b.addModule("ZiguigWindow", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    root_mod.addImport("gl", gl_bindings);
    root_mod.linkLibrary(glfw_dep.artifact("glfw3"));
    root_mod.addIncludePath(glfw_dep.path("include"));
    const lib = b.addLibrary(.{
        .name = "ZiguigWindow",
        .linkage = .dynamic,
        .version = .{ .major = 0, .minor = 1, .patch = 0 },
        .root_module = root_mod,
    });

    b.installArtifact(lib);
}
