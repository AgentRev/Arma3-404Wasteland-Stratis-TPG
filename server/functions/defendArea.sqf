/*
 =======================================================================================================================
Script: BIN_taskDefend.sqf v1.3a (defendArea.sqf)
Author(s): Binesi, AgentRev
Partly based on original code by BIS

Description:
Group will guard/patrol the position and surrounding area.

Parameter(s):
_this select 0: group (Group)
_this select 1: defense position (Array)
    
Returns:
Boolean - success flag

Example(s):
[group this, getPos this] call defendArea;
=======================================================================================================================
*/

if (!isServer) exitWith {};

private ["_grp", "_pos", "_wp1"];

_grp = _this select 0;
_pos = _this select 1;

_grp setBehaviour "SAFE";
//_grp enableAttack false;
_grp allowFleeing 0;

_wp1 = _grp addWaypoint [_pos, 0];
_wp1 setWaypointType "GUARD";

[_grp, 1] setWaypointStatements ["true",
"
	[this, thislist] spawn
	{
		sleep 60;
		{doStop _x} forEach (_this select 1);
		(group (_this select 0)) setCurrentWaypoint [_grp, 1];
		{_x doMove getPos _x} forEach (_this select 1);
	};
"];

{
	// Prevent units from wandering too far and from going prone
	[_x, _pos] spawn
	{
		private ["_unit", "_unitPos", "_targetPos", "_doMove"];
		_unit = _this select 0;
		_targetPos = _this select 1;
		
		while { alive _unit } do
		{
			if ((toUpper behaviour _unit) in ["COMBAT","STEALTH"]) then
			{
				if (stance _unit == "PRONE") then
				{
					_unit setUnitPos "MIDDLE";
				};
			}
			else
			{
				if (unitPos _unit == "MIDDLE") then
				{
					_unit setUnitPos "AUTO";
				};
			};
			
			sleep 1;
			
			_unitPos = [(getPos _unit) select 0, (getPos _unit) select 1];
			
			if (_unitPos distance _targetPos > 50) then
			{
				_doMove = [[5 + random 40, 0], ([_targetPos, _unitPos] call BIS_fnc_dirTo) + (random 90) - 45] call BIS_fnc_rotateVector2D;
				_unit doMove ([_targetPos, _doMove] call BIS_fnc_vectorAdd);
				sleep 3;
			};
		};
	};
} forEach units _grp;

true