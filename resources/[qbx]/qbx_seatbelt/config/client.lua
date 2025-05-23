return {
    keybind = 'B', -- Keybind to toggle seatbelt (https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)
	useMPH = false, -- Use MPH instead of KMH
	minSpeedUnbuckled = 35.0, -- Minimum speed to fly through windscreen when seatbelt is off
	minSpeedBuckled = 180.0, -- Minimum speed to fly through windscreen when seatbelt is on
    harness = {
        disableFlyingThroughWindscreen = true, -- Disable flying through windscreen when harness is on
        minSpeed = 200.0 -- If the above is set to false, minimum speed to fly through windscreen when harness is on
    }
}