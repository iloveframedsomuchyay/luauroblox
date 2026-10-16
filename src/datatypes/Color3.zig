const std = @import("std");

const Color3 = struct {
    r: f16 = 0.0,
    g: f16 = 0.0,
    b: f16 = 0.0,

    fn fromRGB(r: ?f16, g: ?f16, b: ?f16) Color3 {
        return .{
            (r orelse 0) / 255,
            (g orelse 0) / 255,
            (b orelse 0) / 255,
        };
    }

    fn fromHSV(h: ?f16, s: ?f16, v: ?f16) Color3 {
        var i = std.math.floor(h * 6);
        const f = h * 6 - i;
        const p = v * (1 - s);
        const q = v * (1 - f * s);
        const t = v * (1 - (1 - f) * s);

        i %= 6.0;

        if (i == 0) return .{ v, t, p };
        if (i == 1) return .{ q, v, p };
        if (i == 2) return .{ p, v, t };
        if (i == 3) return .{ t, p, v };
        return .{ v, p, q };
    }

    fn lerp(self: *Color3, goal: *Color3, alpha: f16) Color3 {
        return .{
            self.r + (goal.r - self.r) * alpha,
            self.g + (goal.g - self.g) * alpha,
            self.b + (goal.b - self.b) * alpha,
        };
    }

    fn add(self: *Color3, other: *Color3) Color3 {
        return .{
            self.r + other.r,
            self.g + other.g,
            self.b + other.b,
        };
    }

    fn sub(self: *Color3, other: *Color3) Color3 {
        return .{
            self.r - other.r,
            self.g - other.g,
            self.b - other.b,
        };
    }

    fn mul(self: *Color3, other: *Color3) Color3 {
        return .{
            self.r * other.r,
            self.g * other.g,
            self.b * other.b,
        };
    }

    fn div(self: *Color3, other: *Color3) Color3 {
        return .{
            self.r / other.r,
            self.g / other.g,
            self.b / other.b,
        };
    }

    fn eq(self: *Color3, other: *Color3) bool {
        return (self.r == other.r) &
            (self.g == other.g) &
            (self.b == other.b);
    }

    fn lt(self: *Color3, other: *Color3) bool {
        return (self.r < other.r) &
            (self.g < other.g) &
            (self.b < other.b);
    }
};
