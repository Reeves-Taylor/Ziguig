const std = @import("std");
const window = @import("ZiguigWindow");

pub fn main(init: std.process.Init) !void {
    try window.init_glfw();
    const ziguig_window = try window.createWindow("Ziguig", 800, 600, null, null, true);
    try window.init_glad();
    try std.Io.File.stdout().writeStreamingAll(init.io, "Hello, Ziguig!\n");
    while (!window.windowShouldClose(ziguig_window.handle)) {
        window.pollEvents();
    }
    window.deinit(ziguig_window);
}
