//	@file Name: admins.sqf

if(!X_Server) exitWith {};

// Admin menu access levels

// Moderators: manage players, remove hacked vehicles
moderators = compileFinal
'[
	"76561197972525595", // Ace22
	"76561198040488338", // Dreadd
	"76561198066050269", // SgtRazor
	"76561198054519003", // Merritt
	"76561197963855460", // Krom
	"76561197990900702", // ATEXANnHISGUN
	"78681197997819398", // Mr_Blonde_Ops
	"76561197965395122", // Tactical Turtle
	"76561197967458634", // KrakerJak
	"76561198011230347", // SmokenScion
	"76561198005227288", // AgentRev
	"76561197999005626", // Cleric
	"76561197960385895"  // Image
]';

// Administrators: manage players, remove hacked vehicles, show player tags
administrators = compileFinal
'[
	
]';

// Server Administrators: access to everything
serverAdministrators = compileFinal 
'[
	"76561197960681540", // Nuckle
	"76561197974470207", // Hub
	"76561197988128131"  // Dex71
]';

// [compile format ["moderators = compileFinal '%1'; administrators = compileFinal '%2'; serverAdministrators = compileFinal '%3'", call moderators, call administrators, call serverAdministrators], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;

publicVariable "moderators"; 
publicVariable "administrators";
publicVariable "serverAdministrators";
