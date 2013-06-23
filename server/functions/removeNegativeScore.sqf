//	@file Version: 1.0
//	@file Name: removeNegativeScore.sqf
//	@file Author: AgentRev
//	@file Created: 16/06/2013 12:34

private "_player";
_player = _this select 0;

if (isPlayer _player) then
{
	[[[_player], { if (isPlayer (_this select 0)) then { (_this select 0) addScore 2 } }], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;
};
