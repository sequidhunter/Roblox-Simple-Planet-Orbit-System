local RunService = game:GetService("RunService")
local PlanetConfig = require(script.PlanetConfig)
local PlanetTypes = require(script.PlanetTypes)

local Planets = workspace.Planets

local ActivePlanets: {PlanetTypes.ActivePlanet} = {}


local function PlanetOrbit(dt)
	
	
	for i,planet in pairs(ActivePlanets) do


		if not planet.Instance or not planet.Target then 
			continue 
		end

		local radius = planet.Target.Size.X + planet.Distance
		local height = planet.Target.Size.Y + planet.Distance

		planet.Angle = (planet.Angle + dt * planet.Speed % math.pi * 2)

		local x = math.cos(planet.Angle)*radius
		local y = math.sin(planet.Angle*planet.Speed)*height
		local z = math.sin(planet.Angle)*radius


		local goalCFrame = planet.Target.CFrame * CFrame.new(x,y,z) 

		local lookAt = CFrame.lookAt(goalCFrame.Position,planet.Target.Position)

		planet.Instance.CFrame = planet.Instance.CFrame:Lerp(lookAt,0.1)


	end

end

for name, data:PlanetTypes.Planet in pairs(PlanetConfig) do

	local planet = Planets:FindFirstChild(name)

	if planet then
		table.insert(ActivePlanets,{
			Instance = planet,
			Target = Planets:FindFirstChild(data.Target or ""),
			Distance = data.Distance,
			Speed = data.Speed,
			BobSpeed = data.BobSpeed ,
			Angle = 0,
			
			
		})
	end

end

RunService.Heartbeat:Connect(function(dt)
	PlanetOrbit(dt)
end)