return {
    enableClient = true, -- disable to create your own client interface
    engineOn = true, -- If true, the engine will be on upon taking the vehicle out.
    debugPoly = false,

    --- called every frame when player is near the garage and there is a separate drop off marker
    ---@param coords vector3
    drawDropOffMarker = function(coords)
        DrawMarker(36, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 242, 0, 48, 255, false, true, 0, false, nil, nil, false)
    end,

    --- called every frame when player is near the garage to draw the garage marker
    ---@param coords vector3
    drawGarageMarker = function(coords)
        DrawMarker(36, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 20, 246, 12, 255, false, true, 0, false, nil, nil, false)
    end,
}