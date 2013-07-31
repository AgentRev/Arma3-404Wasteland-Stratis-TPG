#include "setup.sqf"
//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initializing Server Compile"];

//Main Mission Compiles
mission_ArmedHeli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_ArmedHeli.sqf";
mission_CivHeli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_CivHeli.sqf";
mission_APC = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_APC.sqf";
/*
mission_LightArmVeh = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightArmVeh.sqf";
mission_LightTank = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightTank.sqf";
mission_MBT = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_MBT.sqf";
mission_Outpost = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Outpost.sqf";
mission_RadarTruck = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_RadarTruck.sqf";
mission_SupplyDrop = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_SupplyDrop.sqf";
*/

//Side Mission Compiles
mission_AirWreck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_AirWreck.sqf";
mission_WepCache = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_WepCache.sqf";
mission_Truck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_Truck.sqf";
/*
mission_ReconVeh = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_ReconVeh.sqf";
*/

//Factory Compiles
createMissionLocation = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionLocation.sqf";
createClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compile preprocessFileLineNumbers "server\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\deleteClientMarker.sqf";
createSmallGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\midGroup.sqf";
createLargeGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\largeGroup.sqf";
createMissionVehicle = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionVehicle.sqf";
createSupplyDrop = compile preprocessFileLineNumbers "server\missions\factoryMethods\createSupplyDrop.sqf";
createCargoItem = compile preprocessFileLineNumbers "server\missions\factoryMethods\createCargoItem.sqf";
defendArea = compile preprocessFileLineNumbers "server\functions\defendArea.sqf";
removeNegativeScore = compile preprocessFileLineNumbers "server\functions\removeNegativeScore.sqf";

//Spawning Compiles
fn_replaceMagazines = compile preprocessFileLineNumbers "server\functions\fn_replaceMagazines.sqf";
fn_replaceWeapons = compile preprocessFileLineNumbers "server\functions\fn_replaceWeapons.sqf";
getBallMagazine = compile preprocessFileLineNumbers "server\functions\getBallMagazine.sqf";
checkHackedVehicles = compileFinal preprocessFileLineNumbers "server\functions\checkHackedVehicles.sqf";
vehicleRepair = compile preprocessFileLineNumbers "server\functions\vehicleRepair.sqf";
findClientPlayer = compileFinal preprocessFileLineNumbers "server\functions\findClientPlayer.sqf";
randomWeapons = compile preprocessFileLineNumbers "server\spawning\randomWeapon.sqf";
vehicleCreation = compile preprocessFileLineNumbers "server\spawning\vehicleCreation.sqf";
objectCreation = compile preprocessFileLineNumbers "server\spawning\objectCreation.sqf";
staticGunCreation = compile preprocessFileLineNumbers "server\spawning\staticGunCreation.sqf";
staticHeliCreation = compile preprocessFileLineNumbers "server\spawning\staticHeliCreation.sqf";
fn_refillbox = compile preprocessFileLineNumbers "server\functions\fn_refillbox.sqf";
fn_refilltruck = compile preprocessFileLineNumbers "server\functions\fn_refilltruck.sqf";
cleanVehicleWreck = compile preprocessFileLineNumbers "server\functions\cleanVehicleWreck.sqf";
hintBroadcast = compile preprocessFileLineNumbers "server\functions\hintBroadcast.sqf";

//Player Management
server_playerDied = compile preprocessFileLineNumbers "server\functions\serverPlayerDied.sqf";

if (isNil "TPG_fnc_MP") then { TPG_fnc_MP = BIS_fnc_MP };
if (isNil "TPG_fnc_MPexec") then { TPG_fnc_MPexec = BIS_fnc_MPexec };
