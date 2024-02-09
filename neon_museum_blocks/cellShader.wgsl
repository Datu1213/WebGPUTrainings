@group(0) @binding(0) var<uniform> grid: vec2f;
@group(0) @binding(1) var<uniform> cellIndex: vec2f;

@vertex
fn vertexMain(@location(0) pos: vec2f) -> @builtin(position) vec4f { 
    // Treat the left bottom corner as Cell(0, 0). 
    // And in this case, you could simplize code as 
    // "return vec4f((pos - (2 * (grid / 2 - cellIndex) - 1)) / grid, 0, 1);"
    let x = (pos.x - (2 * (grid.x / 2 - cellIndex.x) - 1)) / grid.x;
    let y = (pos.y - (2 * (grid.y / 2 - cellIndex.y) - 1)) / grid.y;
    return vec4f(x, y, 0, 1); // Return input's position in clip space.
}

@fragment
fn fragmentMain() -> @location(0) vec4f { // Return color of input position.
    return vec4f(1, 0, 0, 1); // Standard red.
}
