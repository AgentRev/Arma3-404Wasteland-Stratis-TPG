
//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;
_Objtype = objectList call BIS_fnc_selectRandom;
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

_obj addEventHandler ["handledamage", {false}];

switch (_Objtype) do
{
	case "Land_Barrelwater_F":
	{
		_obj setVariable["water",20,true];
	};
	case "Land_WoodenBox_F":
	{
		_obj setVariable["food",20,true];
	};
	case "I_supplyCrate_F":
	{
		clearMagazineCargoGlobal _obj;
		clearWeaponCargoGlobal _obj;
		clearItemCargoGlobal _obj;
		
		_obj addMagazineCargoGlobal ["16Rnd_9x21_Mag", 10];
		_obj addItemCargoGlobal ["FirstAidKit", 10];
		_obj addWeaponCargoGlobal ["Binocular", 5];
		_obj addItemCargoGlobal ["NVGoggles", 5];
		_obj addItemCargoGlobal ["ItemGPS", 5];
		_obj addItemCargoGlobal ["Medikit", 4];
		_obj addItemCargoGlobal ["ToolKit", 2];
	};
};

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
