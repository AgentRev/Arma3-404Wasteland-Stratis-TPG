//	@file Version: 1.0
//	@file Name: boatSpawning.sqf
//	@file Author: AgentRev
//	@file Created: 08/06/2013 17:48
//	@file Args:

if(!X_Server || !enableBoats) exitWith {};

private ["_counter"];

_counter = 0;

for "_i" from 1 to (call nbBoatMarkers) do
{
	[getMarkerPos format ["boatSpawn_%1", _i], waterVehicles call BIS_fnc_selectRandom] call vehicleCreation;
	_counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Boats Spawned",_counter];