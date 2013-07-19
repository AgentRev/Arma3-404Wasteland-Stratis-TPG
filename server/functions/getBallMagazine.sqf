//	@file Version: 1.0
//	@file Name: getBallMagazine.sqf
//	@file Author: AgentRev
//	@file Created: 30/06/2012 15:06

private ["_mag", "_index"];

// Fix case
_mag = configName (configFile >> "CfgMagazines" >> _this);

_index = ["_Tracer", _mag] call fn_findString;

if (_index != -1) then
{
	_mag = [_mag, 0, _index - 1] call BIS_fnc_trimString;
};

_mag
