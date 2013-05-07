//	@file Version: 1.0
//	@file Name: fn_replaceMagazines.sqf
//	@file Author: AgentRev
//	@file Created: 04/05/2013 17:00
//	@file Args: container (Object), oldMagazineName (String), newMagazineName (String)
//	
//	NOTE: Only use during mission init, as it ignores ammo and will replace all magazines with full ones.

if(!X_Server) exitWith {};

private ["_container","_oldMagazineName","_newMagazineName","_magazineCargo","_magazines","_quantities","_magIndex"];

_container = _this select 0;
_oldMagazineName = _this select 1;
_newMagazineName = _this select 2;

_magazineCargo = getMagazineCargo _container;
_magazines = _magazineCargo select 0;
_quantities = _magazineCargo select 1;

_magIndex = _magazines find _oldMagazineName;

if (_magIndex != -1) then
{
	_magazines set [_magIndex, _newMagazineName];
	
	clearMagazineCargoGlobal _container;

	for "_x" from 0 to (count _magazines) - 1 do
	{
		_container addMagazineCargoGlobal [_magazines select _x, _quantities select _x];
	};
};
