//! This is the windowing library for Ziguig. It provides a window that will later be piped into the renderer.
//! It also provides helper functions for input and other window related things.
//! This library is meant to be beginner friendly, including the source code, so even beginners can understand how it works and learn from it.
//! Some things may be explained that most developers would consider common knowledge, but it is meant to help beginners understand how things work
//! and learn from it.
//! This library is built on opengl, which is a cross platform library for rendering graphics, which is opensource and is very mature.
//! The windowing library is built on top of glfw, which is a cross platform library for creating windows and handling input,
//! which is also opensource and very mature.

const std = @import("std"); // Standard library
const Io = std.Io; // Easier access to the Io module.
const gl = @import("gl"); // GLAD library for loading OpenGL function pointers.
const builtin = @import("builtin");
const glfw = @cImport({
    @cInclude("GLFW/glfw3.h");
}); // Include glfw, the windowing library and input handling library. This is a C library, so we use @cImport to include it.

pub var procs: gl.ProcTable = undefined; // A global variable for the OpenGL function pointers.

pub const Window = struct {
    handle: *glfw.GLFWwindow,
    framebuffer_size: Size,
    monitor: ?*glfw.GLFWmonitor,
}; // A global variable for the window, this is not ideal but it is simple and works for this library, it will be used in the input functions and other functions that need to access the window.

const WindowError = error{
    WindowNotInitialized,
    GLFWInitializationFailed,
    WindowCreationFailed,
    GLADInitializationFailed,
};

pub const Size = struct {
    width: i32,
    height: i32,
}; // A global variable for the framebuffer size, this is used in the framebuffer size callback to store the current size of the framebuffer, which is used in the renderer to set the viewport and other things that depend on the window size.

/// The initialization function for the glfw library.
/// This is required to setup many internal things for the windowing library.
pub fn init_glfw() !void { // A ? before a type means that it can be null, useful for optional paramaters.

    // Check if glfw is initialized
    if (glfw.glfwInit() == 0) {
        std.debug.print("Failed to initialize GLFW\n", .{}); // print to stderr that glfw has failed in some way.
        return WindowError.GLFWInitializationFailed; // Return an error if glfw failed to initialzize.
    }

    // Sets up compatibility for macOS if being used. This is required to use OpenGL 4.1 on macOS, which is the latest version of OpenGL that is supported on macOS, since it is deprecated there.
    if (isMacOS()) {
        glfw.glfwWindowHint(glfw.GLFW_OPENGL_FORWARD_COMPAT, glfw.GLFW_TRUE); // Required for macOS to use OpenGL 4.1 or any OpenGL version above 3.2.
    }

    // Window hints for glfw to know the version of OpenGL we want to use.
    glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MAJOR, 4);
    glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MINOR, 1);
    glfw.glfwWindowHint(glfw.GLFW_OPENGL_PROFILE, glfw.GLFW_OPENGL_CORE_PROFILE);
}

/// Function for creating a window and context for OpenGL rendering.
pub fn createWindow(title: [*c]const u8, width: i32, height: i32, monitor: ?*glfw.GLFWmonitor, share: ?*glfw.GLFWwindow, vsync: bool) !Window {
    const windowHandle = glfw.glfwCreateWindow(width, height, title, monitor, share); // Creates a window with the specified width, height, title,
    // monitor and share parameters. The monitor and share parameters are optional and can be null.
    if (windowHandle == null) {
        std.debug.print("Failed to create GLFW window\n", .{});
        return WindowError.WindowCreationFailed; // Return an error if the window failed to create.
    }
    var window = Window{
        .handle = windowHandle.?,
        .framebuffer_size = Size{ .width = width, .height = height },
        .monitor = monitor,
    }; // Monitor and share are optional paramaters, they are used for fullscreen and sharing resources between windows.

    // Check if the window was created successfully.
    glfw.glfwMakeContextCurrent(window.handle); // Makes the window the current context for OpenGL.
    glfw.glfwSwapInterval(if (vsync) 1 else 0); // Enable vsync if the vsync parameter is true, otherwise disable it.
    window.framebuffer_size = .{ .width = width, .height = height };
    return window;
}

/// Initialization function for the GLAD library.
pub fn init_glad() !void {
    if (!procs.init(glfw.glfwGetProcAddress)) {
        std.debug.print("Failed to initialize OpenGL function pointers\n", .{});
        return WindowError.GLADInitializationFailed;
    }
    gl.makeProcTableCurrent(&procs);
}

/// Deinitialization function for the windowing library, this should be called
///  when the program is closing to free up resources and prevent memory leaks.
pub fn deinit(window: Window) void {
    glfw.glfwDestroyWindow(window.handle); // Destroys the window, this is important to free up resources and prevent memory leaks.
    glfw.glfwTerminate(); // Terminates glfw, this is important to free up resources and prevent memory leaks. This must be done last because other programs depend on it.
}

/// isMacOS is a helper function to check if the current operating system is macOS, which is required for some compatibility reasons for OpenGL.
pub fn isMacOS() bool {
    return builtin.os.tag == .macos; // Returns true if the current operating system is macOS, false otherwise.
}
/// Wrapper function for glfwWindowShouldClose to make it easier to check if a window should close.
pub fn windowShouldClose(window: *glfw.GLFWwindow) bool {
    return glfw.glfwWindowShouldClose(window) != 0;
}

/// pollEvents is a wrapper function for glfwPollEvents to make it easier to use.
pub fn pollEvents() void {
    glfw.glfwPollEvents(); // Polls for events, this is required to update the window and handle input and other events.
}

/// getFramebufferSize is a helper function to get the current size of the framebuffer, this is used in the renderer
///  to set the viewport and other things that depend on the window size.
pub fn getFramebufferSize(window: Window) Size {
    return window.framebuffer_size; // Returns the current size of the framebuffer, this is used in the renderer to set the viewport and other things
    // that depend on the window size.
}
