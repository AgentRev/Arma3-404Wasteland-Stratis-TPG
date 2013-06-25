//	@file Name: admins.sqf

if(!X_Server) exitWith {};

// Admin menu access levels 

// Moderators: manage players, remove hacked vehicles
moderators = compileFinal
'[
	// Put player UIDs here
]';

// Administrators: manage players, remove hacked vehicles, show player tags
administrators = compileFinal
'[
	// Put player UIDs here
]';

// Server Administrators: access to everything
serverAdministrators = compileFinal
'[
	// Put player UIDs here
]';

// [compile format ["moderators = compileFinal '%1'; administrators = compileFinal '%2'; serverAdministrators = compileFinal '%3'", call moderators, call administrators, call serverAdministrators], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;

publicVariable "moderators";
publicVariable "administrators";
publicVariable "serverAdministrators";
