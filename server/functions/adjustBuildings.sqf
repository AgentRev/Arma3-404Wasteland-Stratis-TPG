//	@file Version: 1.0
//	@file Name: adjustBuildings.sqf
//	@file Author: AgentRev
//	@file Created: 05/07/2013 21:14

// Disable lighthouse beams
{
	_x setHit ["Light_1_hitpoint", 1];
	_x setHit ["Light_2_hitpoint", 1];
	_x setHit ["Light_3_hitpoint", 1];
} forEach nearestObjects [[0,0], ["Land_LightHouse_F"], 99999];

// Make fuel stations invulnerable
{
	_x addEventHandler ["HandleDamage", {false}];
} forEach nearestObjects [[0,0], ["Land_FuelStation_Feed_F", "Land_FuelStation_Shed_F"], 99999];
