
//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

_obj addEventHandler ["hit", {(_this select 0) setDamage 0;}];
_obj addEventHandler ["dammaged", {(_this select 0) setDamage 0;}];

switch (_Objtype) do
{
	case "Land_Barrelwater_F": {
		_obj setVariable["water",20,true];
	};
	case "Land_WoodenBox_F": {
		_obj setVariable["food",20,true];
	};
	case "B_supplyCrate_F": {
		_obj addMagazineCargoGlobal ["16Rnd_9x21_Mag", 10];
		_obj addItemCargoGlobal ["FirstAidKit", 10];
		_obj addWeaponCargoGlobal ["Binocular", 3];
		_obj addItemCargoGlobal ["ItemGPS", 3];
		_obj addItemCargoGlobal ["NVGoggles", 3];
		_obj addItemCargoGlobal ["Medikit", 2];
		_obj addItemCargoGlobal ["ToolKit", 2];
	};
};

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];