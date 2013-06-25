//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]
if (!isServer) exitWith {};
private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_box = _this select 0;
_selectedBox = _this select 1;

switch (_selectedBox) do
{
    case "mission_Side_USLaunchers": // Used in the airwreck side mission
	{
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;

		// Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["launch_NLAW_F",2];
		_currBox addWeaponCargoGlobal ["launch_RPG32_F",2];
		_currBox addWeaponCargoGlobal ["launch_Titan_F",2];
		
		// Add ammunition
		_currBox addMagazineCargoGlobal ["NLAW_F",4];
		_currBox addMagazineCargoGlobal ["RPG32_F",4];
		_currBox addMagazineCargoGlobal ["Titan_AA",4];
		_currBox addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",3];
		_currBox addMagazineCargoGlobal ["DemoCharge_Remote_Mag",3];
    };
    case "mission_Side_USSpecial": // Used in the airwreck side mission
	{
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["arifle_MX_SW_F",2];
		_currBox addWeaponCargoGlobal ["LMG_Mk200_F",2];
		_currBox addWeaponCargoGlobal ["LMG_Zafir_F",1];
		_currBox addWeaponCargoGlobal ["arifle_MXM_F",2];
		_currBox addWeaponCargoGlobal ["srifle_EBR_F",2];
		_currBox addWeaponCargoGlobal ["hgun_Rook40_F",3];
		_currBox addWeaponCargoGlobal ["hgun_ACPC2_F",3];
		
		_currBox addItemCargoGlobal ["NVGoggles",5];
		_currBox addWeaponCargoGlobal ["Binocular",5];

		_currBox addMagazineCargoGlobal ["16Rnd_9x21_Mag",20];
		_currBox addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",15];
		_currBox addMagazineCargoGlobal ["20Rnd_762x51_Mag",10];
		_currBox addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",8];
		_currBox addMagazineCargoGlobal ["200Rnd_65x39_cased_Box",8];
		_currBox addMagazineCargoGlobal ["150Rnd_762x51_Box",4];
    };
};
