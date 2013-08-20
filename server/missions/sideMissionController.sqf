//	@file Version: 1.0
//	@file Name: sideMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "setup.sqf"
#include "sideMissions\sideMissionDefines.sqf";

private ["_SMarray","_SModds","_SMindexes","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission"];

diag_log format["WASTELAND SERVER - Started Side Mission State"];

//Side Mission Array
/*
	[mission_ReconVeh,"mission_ReconVeh"]
	[mission_Truck,"mission_Truck"]
*/

_SMarray =
[
	[mission_Truck,"mission_Truck"],
	[mission_WepCache,"mission_WepCache"],
	[mission_AirWreck,"mission_AirWreck"]
];

_SModds =
[
	1,
	1.5,
	1.5
];

_SMindexes = [];

{
	_SMindexes set [_forEachIndex, _forEachIndex];
} forEach _SModds;

_lastMission = "nomission";
while {true} do
{
	//Select Mission
    _randomIndex = [_SMindexes, _SModds] call fn_selectRandomWeighted;
	_mission = _SMarray select _randomIndex select 0;
    _missionType = _SMarray select _randomIndex select 1;

	//Select new mission if the same
    /*if (_missionType == _lastMission) then
    {
        _newMissionArray = _SMarray;
        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
        _randomIndex = (random (count _newMissionArray - 1));
        _missionType = _newMissionArray select _randomIndex select 1;
        _mission = _newMissionArray select _randomIndex select 0;   
    };*/
    
	_missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New Side Mission: %1",_missionType];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 minutes</t>", sideMissionDelayTime / 60, sideMissionColor, subTextColor];
	[_hint] call hintBroadcast;
    _lastMission = _missionType;
	waitUntil{sleep 0.1; scriptDone _missionRunning};
    sleep 5;
};