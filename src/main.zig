const std = @import("std");
const window = @import("window");

pub fn main(init: std.process.Init) !void {
    try window.init_glfw();
    try window.createWindow("Ziguig", 800, 600, null, null, true);
    try window.init_glad();
    try std.Io.File.stdout().writeStreamingAll(init.io, "Hello, Ziguig!", 0);
}
