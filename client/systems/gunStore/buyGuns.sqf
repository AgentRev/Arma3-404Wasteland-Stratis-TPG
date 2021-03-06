//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

if (!isNil "storePurchaseActive" && {typeName storePurchaseActive == typeName true} && {storePurchaseActive}) exitWith {};
if (gunStoreCart > player getVariable "cmoney") exitWith { hint "You do not have enough money" };

private ["_name"];

//Initialize Values
if (isNil "storePurchaseActive" || {typeName storePurchaseActive != typeName {}}) then { storePurchaseActive = true };
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;

_notEnoughSpace = "You do not have enough space for ""%1"""; 
_alreadyHaveType = "You already have a weapon of this type, please unequip it before purchasing ""%1"""; 

switch (_switch) do 
{
	//Buy To Player
	case 0: 
	{
		for "_x" from 0 to (_size - 1) do
		{
			_itemText = _cartlist lbText _x;
			//0 = Primary, 1 = SideArm, 2 = Secondary, 3 = HandGun Mags, 4 = MainGun Mags, 5 = Binocular, 7 =Compass Slots
			_playerSlots = [player] call BIS_fnc_invSlotsEmpty; 
			
			{
				_name = _x select 0;
				
				if (_itemText == _name) then
				{
					_class = _x select 1;
					_type = getNumber (configFile >> "CfgWeapons" >> _class >> "type");
					
					if ((!([_class, 1] call isWeaponType) || primaryWeapon player == "") && 
					    {!([_class, 2] call isWeaponType) || handgunWeapon player == ""} &&
					    {!([_class, 4] call isWeaponType) || secondaryWeapon player == ""}) then
					{
						player addWeapon _class;
					}
					else
					{
						if ([player, _class, "backpack"] call fn_fitsInventory) then
						{
							(unitBackpack player) addWeaponCargoGlobal [_class, 1];
						}
						else
						{
							gunStoreCart = gunStoreCart - (_x select 2);
							hint format [_alreadyHaveType,_name];
						};
					};
				};
			} forEach (call weaponsArray);

			{
				_name = _x select 0;
				
				if (_itemText == _name) then
				{
					_class = _x select 1;
					
					if ([player, _class] call fn_fitsInventory) then
					{
						player addMagazine _class;
					}
					else
					{
						gunStoreCart = gunStoreCart - (_x select 2);
						hint format [_notEnoughSpace,_name];
					};
				}
			} forEach (call ammoArray);

			{
				_name = _x select 0;
				
				if (_itemText == _name) then
				{
					_class = _x select 1;
					
					switch (_x select 3) do
					{
						case "binoc":
						{
							if ([player, _class] call isAssignableBinocular) then
							{
								player addWeapon _class;
							}
							else
							{
								if ([player, _class, "backpack"] call fn_fitsInventory) then
								{
									(unitBackpack player) addWeaponCargoGlobal [_class, 1];
								}
								else
								{
									gunStoreCart = gunStoreCart - (_x select 2);
									hint format [_notEnoughSpace,_name];
								};
							};
						};
						case "item":
						{
							if ([player, _class] call fn_fitsInventory) then
							{
								player addItem _class;
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format [_notEnoughSpace,_name];
							};
						};
						case "bpack":
						{
							if (backpack player == "") then
							{
								player addBackpack _class;
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format["You already have a backpack, please drop it before buying a new one"]; 
							};
						};
						case "vest":
						{
							if (vest player == "") then
							{
								player addVest _class;
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format["You already have a vest, please drop it before buying a new one"]; 
							};
						};
						case "uni":
						{
							if (uniform player == "") then
							{
								switch (_name) do
								{
									case "Ghillie Suit": 
									{
										switch (faction player) do
										{
											case "BLU_F": { player addUniform "U_B_GhillieSuit" };
											case "OPF_F": { player addUniform "U_O_GhillieSuit" };
											default       { player addUniform "U_I_GhillieSuit" };
										};
									};
									case "Wetsuit": 
									{
										switch (faction player) do
										{
											case "BLU_F": { player addUniform "U_B_Wetsuit" };
											case "OPF_F": { player addUniform "U_O_Wetsuit" };
											default       { player addUniform "U_I_Wetsuit" };
										};
									};
									case "Default Uniform": 
									{
										switch (faction player) do
										{
											case "BLU_F": { player addUniform "U_B_CombatUniform_mcam" };
											case "OPF_F": { player addUniform "U_O_CombatUniform_ocamo" };
											default       { player addUniform "U_I_CombatUniform" };
										};
									};
									default
									{
										player addUniform _class;
									};
								};
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format["You already have an uniform, please drop it before buying a new one"]; 
							};
						};
						case "hat":
						{
							if (headgear player == "") then
							{
								player addHeadgear _class;
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format["You already have headgear, please drop it before buying a new one"]; 
							};
						};
						case "gogg":
						{
							if (goggles player == "") then
							{
								player addGoggles _class;
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format["You already have goggles, please drop them before buying new ones"]; 
							};
						};
						case "mag":
						{
							if ([player, _class] call fn_fitsInventory) then
							{
								player addMagazine _class;
							}
							else
							{
								gunStoreCart = gunStoreCart - (_x select 2);
								hint format [_notEnoughSpace,_name];
							};
						};
					};
				};
			} forEach ((call accessoriesArray) + (call gearArray));
		};

		player setVariable["cmoney",_playerMoney - gunStoreCart,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
};

if (isNil "storePurchaseActive" || {typeName storePurchaseActive != typeName {}}) then { storePurchaseActive = false };
