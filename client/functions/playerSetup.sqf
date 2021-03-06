//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_player = _this;
//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

_player addEventHandler ["HandleDamage", {false}];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";

{
    if (["NVGoggles", _x] call fn_findString == 0) exitWith
    {
        _player unassignItem _x;
        _player removeItem _x;
    };
} forEach assignedItems _player;

removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;

switch (playerSide) do
{
    case BLUFOR:
    {
		_player addUniform "U_B_CombatUniform_mcam";
		_player addVest "V_PlateCarrier2_rgr";
		_player addHeadgear "H_HelmetB";
    };

    case OPFOR:
    {
        _player addUniform "U_O_CombatUniform_ocamo";
		_player addVest "V_HarnessO_brn";
		_player addHeadgear "H_HelmetO_ocamo";
    };
	
	default
    {
		_player addUniform "U_I_CombatUniform";
		_player addVest "V_PlateCarrierIA2_dgtl";
		_player addHeadgear "H_HelmetIA";
    };
};

_player addBackpack "B_Kitbag_Base";
_player addMagazine "16Rnd_9x21_Mag";
_player addMagazine "16Rnd_9x21_Mag";
_player addMagazine "16Rnd_9x21_Mag";
_player addItem "FirstAidKit";
_player addWeapon "hgun_P07_F";
_player selectWeapon "hgun_P07_F";

_player addrating 9999999;

thirstLevel = 100;
hungerLevel = 100;

//_player setVariable["cmoney",100,true];
_player setVariable["canfood",0,false];
_player setVariable["medkits",0,false];
_player setVariable["water",0,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 0, false];
//_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;
