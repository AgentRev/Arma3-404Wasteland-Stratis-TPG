//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4"];

_group = _this select 0;
_pos = _this select 1;

// Leader
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
removeUniform _leader;
removeVest _leader;
removeBackpack _leader;
removeAllWeapons _leader;
removeAllItems _leader;
removeAllAssignedItems _leader;
_leader addUniform "U_B_CombatUniform_mcam";
_leader addVest "V_PlateCarrier1_rgr";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addWeapon "arifle_TRG21_F";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "RPG32_F";
_leader addWeapon "launch_RPG32_F";
_leader addMagazine "RPG32_F";



// Rifleman
_man2 = _group createunit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
removeUniform _man2;
removeVest _man2;
removeBackpack _man2;
removeAllWeapons _man2;
removeAllItems _man2;
removeAllAssignedItems _man2;
_man2 addUniform "U_B_CombatUniform_mcam_tshirt";
_man2 addVest "V_PlateCarrier1_rgr";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addWeapon "arifle_TRG20_F";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";

// Rifleman
_man3 = _group createunit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
removeUniform _man3;
removeVest _man3;
removeBackpack _man3;
removeAllWeapons _man3;
removeAllItems _man3;
removeAllAssignedItems _man3;
_man3 addUniform "U_B_CombatUniform_mcam_tshirt";
_man3 addVest "V_PlateCarrier1_rbr";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "arifle_TRG20_F";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";

// Rifleman
_man4 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
removeUniform _man4;
removeVest _man4;
removeBackpack _man4;
removeAllWeapons _man4;
removeAllItems _man4;
removeAllAssignedItems _man4;
_man4 addUniform "U_B_CombatUniform_mcam_tshirt";
_man4 addVest "V_PlateCarrier1_rgr";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "arifle_TRG20_F";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";

{
	_x allowFleeing 0;
	_x addRating 9999999;
	_x addEventHandler ["Killed", {(_this select 1) call removeNegativeScore; [_this select 0] call server_playerDied}];
} forEach units _group;

_leader = leader _group;
[_group, _pos] call defendArea;
