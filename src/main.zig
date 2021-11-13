const std = @import("std");
const ray = @cImport({
    @cInclude("raylib.h");
});

pub fn main() void {
    const screenWidth = 800;
    const screenHeight = 450;

    ray.InitWindow(screenWidth, screenHeight, "title");
    defer ray.CloseWindow();

    ray.SetTargetFPS(60);

    while (!ray.WindowShouldClose()) {
        ray.BeginDrawing();
        defer ray.EndDrawing();

        ray.ClearBackground(ray.RAYWHITE);
        ray.DrawCircleV(ray.Vector2{ .x = 20.0, .y = 20.0 }, 20.0, ray.DARKBLUE);
        drawCircleV(ray.Vector2{ .x = 60.0, .y = 20.0 }, 20.0, ray.DARKBLUE);
    }
}

// Not sure why ray.DrawCircleV doesn't work
fn drawCircleV(ballPosition: ray.Vector2, radius: f32, ballColor: ray.Color) void {
    return ray.DrawCircle(@floatToInt(i32, ballPosition.x), @floatToInt(i32, ballPosition.y), radius, ballColor);
}
