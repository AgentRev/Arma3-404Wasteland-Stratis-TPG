//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initializing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";

"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

// Amount of vehicle spawn markers on map
nbVehicleMarkers = compileFinal "118";
nbHeliMarkers = compileFinal "24";
nbBoatMarkers = compileFinal "12";

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Offroad_01_F"
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"B_Quadbike_01_F",
	"O_Quadbike_01_F",
	"I_Quadbike_01_F"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F"
];

//Boats List - Random Spawns
waterVehicles = 
[
	"B_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"I_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"O_Boat_Armed_01_hmg_F",
	"I_Boat_Armed_01_minigun_F"
];
                            
//Object List - Random Spawns.
objectList = 
[
	// "Land_Barrelwater_F",
	// "Land_Fireplace_F",
	// "Land_WoodenBox_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_3_F",
	"Land_Scaffolding_F",
	"Land_HBarrierBig_F",
	"B_supplyCrate_F",
	"Land_CargoBox_V1_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_4m_F",
	"Land_CncWall4_F",
	"Land_CncWall4_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncBarrierMedium4_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Small_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Long_F"
];

//Object List - Random Spawns.
staticWeaponsList = ["B_MK6"];

//Object List - Random Helis.
staticHeliList = ["O_Heli_Light_02_unarmed_F", "B_Heli_Light_01_F"];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	// "hgun_P07_F",
	// "hgun_Rook40_F",
	// "hgun_ACPC2_F",
	// "arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F",
	"arifle_Mk20C_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Katiba_F",
	"arifle_Katiba_C_F",
	"arifle_Katiba_GL_F",
	"arifle_MXC_F",
	"arifle_MX_F",
	"arifle_MX_GL_F",
	"arifle_MX_SW_F",
	"arifle_MXM_F",
	"srifle_EBR_F",
	"LMG_Mk200_F",
	"LMG_Zafir_F",
	"SMG_01_F",	// Vermin SBR
	"SMG_02_F"	// Scorpion EVO-4
];

vehicleAddition =
[
	"muzzle_snds_M"
	"muzzle_snds_H",
	"muzzle_snds_L",
	"muzzle_snds_B",
	"muzzle_snds_H_MG",
	"optic_MRCO",
	"optic_Arco",
	"optic_Hamr",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_Holosight",
	"acc_flashlight",
	"acc_pointer_IR",
	"Medikit",
	"FirstAidKit",
	"ToolKit"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
 
                
MissionSpawnMarkers =
[
	["Mission_1",false],
	["Mission_2",false],
	["Mission_3",false],
	["Mission_4",false],
	["Mission_5",false],
	["Mission_6",false],
	["Mission_7",false],
	["Mission_8",false],
	["Mission_9",false],
	["Mission_10",false],
	["Mission_11",false],
	["Mission_12",false],
	["Mission_13",false],
	["Mission_14",false],
	["Mission_15",false],
	["Mission_16",false],
	["Mission_17",false],
	["Mission_18",false],
	["Mission_19",false],
	["Mission_20",false]
];
