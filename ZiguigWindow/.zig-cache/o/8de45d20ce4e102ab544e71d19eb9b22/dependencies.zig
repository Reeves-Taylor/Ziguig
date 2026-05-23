pub const packages = struct {
    pub const @"glfw-0.3.0-YPzX96IuBQAxnlG-CIYgD6I-I47XwiJHRmjkKP--t_zv" = struct {
        pub const build_root = "/home/scisoors/Ziguig/ZiguigWindow/zig-pkg/glfw-0.3.0-YPzX96IuBQAxnlG-CIYgD6I-I47XwiJHRmjkKP--t_zv";
        pub const build_zig = @import("glfw-0.3.0-YPzX96IuBQAxnlG-CIYgD6I-I47XwiJHRmjkKP--t_zv");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "glfw_c", "glfw_c-3.4.0-_9LYGAqqGQCrRETIkV6i6xZK-JPXkGp0lUkPadI2flTL" },
        };
    };
    pub const @"glfw_c-3.4.0-_9LYGAqqGQCrRETIkV6i6xZK-JPXkGp0lUkPadI2flTL" = struct {
        pub const build_root = "/home/scisoors/Ziguig/ZiguigWindow/zig-pkg/glfw_c-3.4.0-_9LYGAqqGQCrRETIkV6i6xZK-JPXkGp0lUkPadI2flTL";
        pub const build_zig = @import("glfw_c-3.4.0-_9LYGAqqGQCrRETIkV6i6xZK-JPXkGp0lUkPadI2flTL");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "xcode_frameworks", "xcode_frameworks-1.0.0-28XBAdiWqgWY-PYYteApyjkn2YrBynlIUVLHfGgxYMec" },
            .{ "vulkan_headers", "vulkan_headers-1.4.310-serkODrKzgClkas6HfUAOvpPu7oEwUyFYOFIo9U7lBvu" },
            .{ "wayland_headers", "wayland_headers-1.23.90-zEDAaSnXCQA5_Ep0A31wKTeEejpxesPAxzFKtFkVaWut" },
            .{ "x11_headers", "x11_headers-1.8.12-evSsQYjhQQALR-Xc8fAJqFSLZ8A8bjbNl_j2vAS_3w2c" },
        };
    };
    pub const @"vulkan_headers-1.4.310-serkODrKzgClkas6HfUAOvpPu7oEwUyFYOFIo9U7lBvu" = struct {
        pub const available = false;
    };
    pub const @"wayland_headers-1.23.90-zEDAaSnXCQA5_Ep0A31wKTeEejpxesPAxzFKtFkVaWut" = struct {
        pub const available = false;
    };
    pub const @"x11_headers-1.8.12-evSsQYjhQQALR-Xc8fAJqFSLZ8A8bjbNl_j2vAS_3w2c" = struct {
        pub const available = false;
    };
    pub const @"xcode_frameworks-1.0.0-28XBAdiWqgWY-PYYteApyjkn2YrBynlIUVLHfGgxYMec" = struct {
        pub const available = false;
    };
    pub const @"zigglgen-0.5.0-ziggltzDLwA0Gk0Pj6QMij1j6Z_jkvGEtGKBM6-YlI_s" = struct {
        pub const build_root = "/home/scisoors/Ziguig/ZiguigWindow/zig-pkg/zigglgen-0.5.0-ziggltzDLwA0Gk0Pj6QMij1j6Z_jkvGEtGKBM6-YlI_s";
        pub const build_zig = @import("zigglgen-0.5.0-ziggltzDLwA0Gk0Pj6QMij1j6Z_jkvGEtGKBM6-YlI_s");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "zigglgen", "zigglgen-0.5.0-ziggltzDLwA0Gk0Pj6QMij1j6Z_jkvGEtGKBM6-YlI_s" },
    .{ "glfw", "glfw-0.3.0-YPzX96IuBQAxnlG-CIYgD6I-I47XwiJHRmjkKP--t_zv" },
};
