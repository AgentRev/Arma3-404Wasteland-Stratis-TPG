
//	@file Version: 1.1
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, modded by AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args: markerPos [, vehicleType]

if(!X_Server) exitWith {};

private ["_markerPos","_pos","_type","_num","_vehicleType","_vehicle"];

_markerPos = _this select 0;

if (count _this > 1) then
{
	_vehicleType = _this select 1;
	
	if (_vehicleType in utilityVehicles) then { _type = 0 };
	if (_vehicleType in lightVehicles) then { _type = 1 };
	if (_vehicleType in mediumVehicles) then { _type = 2 };
	if (_vehicleType in waterVehicles) then { _type = 3 };
}
else
{
	_num = floor (random 100);
	
	if (_num < 100) then { _vehicleType = utilityVehicles call BIS_fnc_selectRandom; _type = 0 };
	if (_num < 70) then { _vehicleType = lightVehicles call BIS_fnc_selectRandom; _type = 1 };
	if (_num < 25) then { _vehicleType = mediumVehicles call BIS_fnc_selectRandom; _type = 2 };
};

_pos = [
			_markerPos,	                                  // Base position
			0,                                            // Min distance
			( if (_type == 3) then { 20 } else { 30 } ),  // Max distance
			( if (_type == 1) then { 2 } else { 5 } ),	  // Safe radius
			( if (_type == 3) then { 2 } else { 0 } ),	  // Water mode
			60 * (pi / 180),                              // Max slope
			0,                                            // Shore mode
			_vehicleType                                  // Vehicle type
		]
		call findSafePos;

//Vehicle Initialization
_vehicle = createVehicle [_vehicleType, _pos, [], 0, "None"];
_vehicle setVariable [call vChecksum, true, false];

if (_type == 3) then { _vehicle setPosASL [_pos select 0, _pos select 1, 0] }
else { _vehicle setPosATL [_pos select 0, _pos select 1, 1.5] };

[_vehicle, 900, 1800, 3600, 500, 0, false, _markerPos] execVM "server\functions\vehicle.sqf";

//Clear Vehicle Inventory
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;

//Set Vehicle Attributes
_vehicle setFuel (0.50);
_vehicle setDamage (random 0.50);

// Compensation for quadbikes & pickups having their max speed halved when wheel damage is over 20%
if (_type in [0,1]) then
{
	_vehicle setHit ["wheel_1_1_steering", 0];
	_vehicle setHit ["wheel_1_2_steering", 0];
	_vehicle setHit ["wheel_2_1_steering", 0];
	_vehicle setHit ["wheel_2_2_steering", 0];
};

_vehicle setDir (random 360);

if (_type == 2) then { _vehicle setVehicleAmmo (random 1.0) }; // For smokes

if (_vehicleType isKindOf "Boat_Armed_01_base_F") then
{
	private ["_vehicleCfg", "_turretsCfg", "_turretsCount", "_turretPath", "_turret"];
	_vehicleCfg = configFile >> "CfgVehicles" >> _vehicleType;
	
	//_vehicle setVehicleAmmo 0;
	
	{
		_vehicle removeMagazinesTurret [_x, [-1]];
	} forEach getArray (_vehicleCfg >> "magazines");
	
	_turretsCfg = configFile >> "CfgVehicles" >> _vehicleType >> "Turrets";
	_turretsCount = count _turretsCfg;
	_turretPath = 0;
	
	for "_t" from 0 to (_turretsCount - 1) do 
	{
		_turret = _turretsCfg select _t;
		
		if (getNumber (_turret >> "hasGunner") > 0) then
		{
			{
				_vehicle removeMagazinesTurret [_x, [_turretPath]];
			} forEach getArray (_turret >> "magazines");
			
			_turretPath = _turretPath + 1;
		};
	};
	
	switch (true) do
	{
		case (_vehicleType isKindOf "Boat_Armed_01_minigun_base_F"):
		{
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red", [1]];
			_vehicle setVehicleAmmo 0.25;
		};
		default
		{
			_vehicle addMagazineTurret ["200Rnd_127x99_mag_Tracer_Green", [1]];
			_vehicle setVehicleAmmo 0.50;
		};
	};
	
	for "_i" from 0 to (floor (random 3.0) - 1) do
	{
		_vehicle addMagazineTurret ["SmokeLauncherMag_boat", [-1]];
	};
	
	sleep 0.1;	
	reload _vehicle;
};

_vehicle disableTIEquipment true;

if (_type != 3) then { [_vehicle] call randomWeapons };

//Set original posistion then add to vehicle array

_vehicle setVelocity [0,0,0];
