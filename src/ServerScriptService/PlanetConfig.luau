
local PlanetTypes = require(script.Parent.PlanetTypes)


return {

	["Earth"] = {
		Angle = 0,
		Speed = 0.2,
		Distance = 32,
		BobSpeed = 0.2,
		Target = "Sun",

	}:: PlanetTypes.Planet,

	["Moon"] = {
		Angle = 0,
		Speed = 1,
		Distance = 8,
		BobSpeed = 1,
		Target = "Earth",

	}:: PlanetTypes.Planet,

	["Sun"] = {

	}:: PlanetTypes.Planet,

}
