//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0, "Form"];
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
_man2 = _group createunit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 0, "Form"];
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
_man3 = _group createunit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 0, "Form"];
removeUniform _man3;
removeVest _man3;
removeBackpack _man3;
removeAllWeapons _man3;
removeAllItems _man3;
removeAllAssignedItems _man3;
_man3 addUniform "U_B_CombatUniform_mcam_tshirt";
_man3 addVest "V_PlateCarrier1_rgr";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "arifle_TRG20_F";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";

// Rifleman
_man4 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 40, 0], [], 0, "Form"];
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

// Rifleman
_man5 = _group createunit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 0, "Form"];
removeUniform _man5;
removeVest _man5;
removeBackpack _man5;
removeAllWeapons _man5;
removeAllItems _man5;
removeAllAssignedItems _man5;
_man5 addUniform "U_B_CombatUniform_mcam_tshirt";
_man5 addVest "V_PlateCarrier1_rgr";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addWeapon "arifle_TRG20_F";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addMagazine "30Rnd_556x45_Stanag";

// Rifleman
_man6 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 0, "Form"];
removeUniform _man6;
removeVest _man6;
removeBackpack _man6;
removeAllWeapons _man6;
removeAllItems _man6;
removeAllAssignedItems _man6;
_man6 addUniform "U_B_CombatUniform_mcam_tshirt";
_man6 addVest "V_PlateCarrier1_rgr";
_man6 addMagazine "30Rnd_556x45_Stanag";
_man6 addWeapon "arifle_TRG20_F";
_man6 addMagazine "30Rnd_556x45_Stanag";
_man6 addMagazine "30Rnd_556x45_Stanag";

// Grenadier
_man7 = _group createunit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 0, "Form"];
removeUniform _man7;
removeVest _man7;
removeBackpack _man7;
removeAllWeapons _man7;
removeAllItems _man7;
removeAllAssignedItems _man7;
_man7 addUniform "U_B_CombatUniform_mcam_vest";
_man7 addVest "V_PlateCarrier1_rgr";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addWeapon "arifle_TRG21_GL_F";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";

{
	_x addrating 9999999;
	_x addEventHandler ["Killed",
	{
		(_this select 1) call removeNegativeScore;
	}];
} forEach units _group;

_leader = leader _group;
[_group, _pos] call defendArea;
