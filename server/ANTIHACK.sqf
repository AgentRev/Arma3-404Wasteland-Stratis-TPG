private["_array", "_player", "_hackType", "_hackValue"];
	
SADTOYCATS =
{
	// diag_log "ANTI-HACK 0.6.4 starting...";
	if (isServer) exitWith {};
	
	_commonPaths = ["used for hacking", "wuat\screen.sqf", "scripts\defaultmenu.sqf", "menu\initmenu.sqf", "scr\exec.sqf", "scripts\exec.sqf", "menu\exec.sqf", "wuat\exec.sqf", "crinkly\keymenu.sqf", "scripts\ajmenu.sqf", "startup.sqf", "wookie_wuat\startup.sqf", "@DevCon\DevCon.pbo", "addons\@DevCon\DevCon.pbo", "DevCon.pbo", "ShadowyFaze\exec.sqf", "jestersMENU\exec.sqf"];
	
	{
		_contents = format["%1", loadFile _x];
		
		if (_contents != "") then 
		{
				// diag_log "ANTI-HACK 0.6.4: hacker?!";
 
				hackFlag = [player, "hack menu", _x];
				publicVariableServer "hackFlag";
				sleep 5;
				
				for "_i" from 0 to 99 do
				{
					(findDisplay _i) closeDisplay 0;
				};
		};
	} forEach _commonPaths;
	
	// diag_log "ANTI-HACK 0.6.4: Starting loops!";
	
	[] spawn
	{
		private["_sleepVariableCheck", "_badPublicVariables"];
		_sleepVariableCheck = 30;
		_badPublicVariables = ["abcd", "abcdefGEH", "abox1", "activeITEMlist", "activeITEMlistanzahl", "addgun", "aesp", "antiantiantiantih4x", "antiloop", "ARGT_JUMP", "atext", "battleHIGH_vehpub", "BIS_fnc_3dCredits_n", "boost", "bowen", "bowonky", "byebyezombies", "cargod", "changebackpack", "changestats", "ChangingBullets_xx", "ctrl_onKeyDown", "dayzRespawn2", "dayzRespawn3", "dayzSetDate", "dayzSetFix", "DAYZ_CA1_Lollipops", "dayz_godmode", "debugConsoleIndex", "debug_simple", "debug_star_colorful", "delaymenu", "DEV_ConsoleOpen", "dontAddToTheArray", "drawic", "dwarden", "enamearr", "ESP", "fffffffffff", "firstrun", "footSpeedIndex", "footSpeedKeys", "fuckmegrandma", "g0d", "g0dmode", "gluemenu", "god", "godall", "godlol", "hacks", "hangender", "HaxSmokeOn", "HDIR", "helpmenu", "HMDIR", "hotkeymenu", "i", "iBeFlying", "igodokxtt", "img", "InfiniteAmmo", "infi_STAR_exec", "inf_ammo_loop_infiSTAR", "initarr", "initarr2", "initarr3", "inv", "invall", "j", "keymenu", "keymenu2", "letmeknow", "Listw", "list_wrecked", "lmzsjgnas", "LOKI_GUI_Key_Color", "mahcaq", "maphalf", "mapm", "marker", "markPos", "mehatingjews", "mk2", "monky", "monkytp", "Monky_funcs_inited", "Monky_hax_toggled", "moptions", "morphtoanimals", "musekeys", "MV", "MY_KEYDOWN_FNC", "namePlayer", "nb", "nd", "omgwtfbbq", "p", "pathtoscrdir", "pbx", "pic", "playerDistanceScreen", "playericons", "playershield", "plrshldblckls", "plrshldblcklst", "pm", "pos", "ptags", "pu", "qofjqpofq", "qopfkqpofqk", "reinit", "rem", "rSPAWN", "rspwn", "sbp", "sbpc", "scode", "selecteditem", "shnmenu", "skinmenu", "slag", "smag", "spawnitems1", "spawnweapons1", "surrmenu", "swpn", "TAG_onKeyDown", "take1", "tempslag", "TentS", "testIndex", "theKeyControl", "thingtoattachto", "toggle_keyEH", "TTT5OptionNR", "Ug8YtyGyvguGF", "unitList", "unitsmenu", "v", "veh", "vehicleg0dv3_BushWookie", "vehiclegooov3ood_BushWookie", "ViLayer", "VL", "vm", "vspeed", "weapFun", "wierdo", "wl", "wuat_fpsMonitor", "xdistance", "xtags", "xtags_star_xx", "xyzaa", "xZombieBait", "zeus", "zeusmode", "zombieDistanceScreen", "zombieshield", "_fcukupstar"];

		
		// diag_log "ANTI-HACK 0.6.4: Detection of hack variables started!";
		
		while { true } do
		{
			{
				if !(isNil _x) exitWith 
				{
					// diag_log "ANTI-HACK 0.6.4: Found a hack variable!";
					
					player globalChat "[ANTI-HACK] This user has cheating scripts.";
					hackFlag = [player, "hacked variable", _x];
					publicVariableServer "hackFlag";
					sleep 5;
					
					for "_i" from 0 to 99 do
					{
						(findDisplay _i) closeDisplay 0;
					};
				};
			} forEach _badPublicVariables;
 
			sleep _sleepVariableCheck;
		};
	};
	
	[] spawn
	{
		private["_keyDownHandlerCount", "_keyUpHandlerCount", "_ctrlDrawHandlerCount"];
		// diag_log "ANTI-HACK 0.6.4: Hack menu check started!";
		
		while {	true } do
		{
			(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
			
			if (!isNull findDisplay 3030 || {!isNull findDisplay 155}) then
			{
				// diag_log "ANTI-HACK 0.6.4: Found a hack menu!";
				
				player globalChat "[ANTI-HACK] This user has cheating scripts.";
				hackFlag = [player, "hack menu", _x];
				publicVariableServer "hackFlag";
				sleep 5;
				
				for "_i" from 0 to 99 do 
				{
					(findDisplay _i) closeDisplay 0;
				};
			};
			
			sleep 5;
		};
	};
	[] spawn
	{
		private["_sleepGodModeCheck", "_terrainGrid", "_recoilSettings", "_zombieCheck", "_damageHandler", "_unconsciousFunction"];
		_sleepGodModeCheck = 5;
		_terrainGrid = 25;
		_recoilSettings = unitRecoilCoefficient player;
		
		// diag_log "ANTI-HACK 0.6.4: Godmode check started!";
		
		while { true } do
		{
			if (unitRecoilCoefficient player != _recoilSettings) exitWith 
			{
					// diag_log "ANTI-HACK 0.6.4: Detected recoil hack!";
					player globalChat "[ANTI-HACK] This user has cheating scripts.";
					hackFlag = [player, "no recoil", "null"];
					publicVariableServer "hackFlag";
					sleep 5;
					
					for "_i" from 0 to 99 do
					{
						(findDisplay _i) closeDisplay 0;
					};
			};
			
			setTerrainGrid _terrainGrid;
			sleep _sleepGodModeCheck;
		};
	};
};

diag_log "ANTI-HACK 0.6.4: Starting...";
diag_log "ANTI-HACK 0.6.4: Adding public variable handler";

"hackFlag" addPublicVariableEventHandler
{
	_array = _this select 1;
	_player = _array select 0;
	_hackType = _array select 1;
	_hackValue = _array select 2;
	
	serverCommand format ["#exec ban %1", getPlayerUID _player];
	serverCommand format ["#kick %1", getPlayerUID _player];
	
	diag_log format ["ANTI-HACK 0.6.4: %1 (%2) was banned for '%3' with the value '%4'", name _player, getPlayerUID _player, _hackType, _hackValue];
};

"ahClientStarted" addPublicVariableEventHandler
{
	_client = _this select 1;
	(owner _client) publicVariableClient "SADTOYCATS";
	diag_log format ["ANTI-HACK 0.6.4: Initializing anti-hack on client #%1 (%2)", owner _client, name _client];
};
 
diag_log "ANTI-HACK 0.6.4: Ready.";
