//	@file Version: 1.0
//	@file Name: timeAcceleration.sqf
//	@file Author: AgentRev
//	@file Created: 29/06/2013 20:02

if (!isServer) exitWith {};

private ["_refreshSettings", "_scriptHandle", "_oldRefreshTime", "_timeJump", "_overcast"];

_refreshSettings = false;

startHour = 13;
startMinute = 15;
timeMultiplier = 1.0;
refreshTime = 5; // in minutes

if (loadFile "scripts\timeSettings.sqf" != "") then
{
	_refreshSettings = true;
};

setDate [date select 0, date select 1, date select 2, startHour, startMinute];

while { true } do
{
	if (_refreshSettings) then
	{
		_scriptHandle = execVM "scripts\timeSettings.sqf";
		waitUntil {scriptDone _scriptHandle};
	};
	
	sleep (refreshTime*60);
	
	if (timeMultiplier != 1.0) then
	{
		_timeJump = date;
		_timeJump set [4, (_timeJump select 4) + ((_refreshTime * timeMultiplier) - _refreshTime)];
		setDate _timeJump;
	};
};
