//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Description: The main init.
//	@file Args:
#include "setup.sqf"
//if (isnil "RE") then {[] execVM "\ca\Modules\MP\data\scripts\MPframework.sqf"};

StartProgress = false;
enableSaving[false,false];

X_Server = false;
hitStateVar = false;
versionName = "v1.08g Beta";

if (isServer) then { X_Server = true };

true spawn {
	if(!isDedicated) then {
		titleText ["Please wait for your player to setup", "BLACK", 0];
		waitUntil {!isNull player};
		client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0);}];
	};
};

// Server & Client Functions
generateKey = compileFinal preprocessFileLineNumbers "server\antihack\generateKey.sqf";
fn_vehicleInit = compile preprocessFileLineNumbers "server\functions\fn_vehicleInit.sqf";
findSafePos = compile preprocessFileLineNumbers "server\functions\findSafePos.sqf";
removeNegativeScore = compile preprocessFileLineNumbers "server\functions\removeNegativeScore.sqf";
detachTowedObject = compile preprocessFileLineNumbers "server\functions\detachTowedObject.sqf";

if (isNil "fn_findString") then { fn_findString = compileFinal preprocessFileLineNumbers "server\functions\fn_findString.sqf" };
if (isNil "fn_filterString") then { fn_filterString = compileFinal preprocessFileLineNumbers "server\functions\fn_filterString.sqf" };

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "briefing.sqf";

if (!isDedicated) then {
	waitUntil {!isNull player};

	//Wipe Group.
	if(count units group player > 1) then
	{  
		diag_log "Player Group Wiped";
		[player] join grpNull;
	};

	[] execVM "client\init.sqf";
};

if(X_Server) then {
	diag_log format ["############################# %1 #############################", missionName];
	#ifdef __DEBUG__
	diag_log format ["T%1,DT%2,F%3", time, diag_tickTime, diag_frameno];
	#endif
    diag_log format["WASTELAND SERVER - Initializing Server"];
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

"requestDetachTowedObject" addPublicVariableEventHandler { [_this select 1] call detachTowedObject };

[] execVM "addons\proving_Ground\init.sqf";
[0] execVM "addons\scripts\DynamicWeatherEffects.sqf";

execVM "server\functions\adjustBuildings.sqf";
