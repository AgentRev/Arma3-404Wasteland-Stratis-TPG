//	@file Version: 1.0
//	@file Name: staticHeliSpawning.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_position","_markerName","_marker","_hint","_newPos","_countActual", "_i", "_doSpawnWreck", "_heliMarkers", "_spawnType"];
_counter = 0;
_countActual = 0;

_heliMarkers = [];

for "_i" from 1 to (call nbHeliMarkers) do
{
	_heliMarkers set [(_i - 1), _i];
};

while {_counter < 8} do // 8 helis spawn at the beginning
{
	_selectedMarker = _heliMarkers call BIS_fnc_selectRandom;
	_heliMarkers = _heliMarkers - [_selectedMarker];
	
	_spawnType = staticHeliList call BIS_fnc_selectRandom;
	_position = getMarkerPos format ["heliSpawn_%1", _selectedMarker];
	_newPos = [_position, 0, 50, 10, 0, 60 * (pi / 180), 0, _spawnType] call findSafePos;
	[0, _newPos, _spawnType] call staticHeliCreation;
	
	currentStaticHelis set [count currentStaticHelis, _selectedMarker];
	
	_counter = _counter + 1;
	_countActual = _countActual + 1;
	/*              
	_markerName = format["marker%1",_counter];
	_marker = createMarkerLocal [_markerName, _newPos];
	_markerName createMarkerLocal "mil_dot";
	_markerName createMarkerLocal [1.25, 1.25];
	_markerName createMarkerLocal "ColorRed";
	*/
};

diag_log format["WASTELAND SERVER - %1 Static helis Spawned",_countActual];

/*
{diag_log format["Heli %1 = %2",_forEachIndex, _x];} forEach currentStaticHelis;
for "_i" from 1 to (call nbHeliMarkers) do {
    _doSpawnWreck = true;
    
    { // Check if current iteration already exists as a live heli...
    	if (_i == _x) then {
			_doSpawnWreck = false;
        };
    } forEach currentStaticHelis;
    
    if (_doSpawnWreck) then {
    	_position = getMarkerPos format ["heliSpawn_%1", _i];
    	_newPos = [_position, 25, 50, 1, 0, 60 * (pi / 180), 0] call findSafePos;
		[1, _newPos] call staticHeliCreation;
        
    	_markerName = format["marker%1",_i];
		_marker = createMarker [_markerName, _newPos];
		_marker setMarkerType "dot";
		_marker setMarkerSize [1.25, 1.25];
		_marker setMarkerColor "ColorBlue";
    };
};
*/