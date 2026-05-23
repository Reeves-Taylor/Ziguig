pub const packages = struct {
    pub const @"../ZiguigWindow" = struct {
        pub const build_root = "/home/scisoors/Ziguig/../ZiguigWindow";
        pub const deps: []const struct { []const u8, []const u8 } = &.{};
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "window", "../ZiguigWindow" },
};
