
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\gunstoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_gunlist = _dialog displayCtrl gunshop_gun_list;
_gunpicture = _dialog displayCtrl gunshop_gun_pic;
_itempicture = _dialog displayCtrl gunshop_item_pic;
_gunlisttext = _dialog displayCtrl gunshop_gun_TEXT;
_gunInfo = _dialog displayCtrl gunshop_gun_Info;

//Get Selected Item
_selectedItem = lbCurSel _gunlist;
_itemText = _gunlist lbText _selectedItem;

_gunpicture ctrlSettext _picture;
_itempicture ctrlSettext _picture;
_gunlisttext ctrlSetText format [""];

//Check Items Price
{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
	_weapon = (configFile >> "CfgWeapons" >> _weap_type);
    _gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText(_weapon >> "displayName"), getText(_weapon >> "descriptionShort")]);
    
	_itempicture ctrlSettext "";
	
	private ["_weapArr", "_weapLen"];
	_weapArr = toArray _weap_type;
	_weapLen = count _weapArr;
	_picture = getText(_weapon >> "picture");
	
	// Show scope on gunstore's sniper pictures
	if (toString [_weapArr select (_weapLen - 6), _weapArr select (_weapLen - 5), _weapArr select (_weapLen - 4), _weapArr select (_weapLen - 3), _weapArr select (_weapLen - 2), _weapArr select (_weapLen - 1)] ==
		"_SOS_F") then
	{
		private ["_picArr", "_picLen"];
		_picArr = toArray _picture;
		_picLen = count _picArr;
		
		if (toString [_picArr select (_picLen - 8)] == "X") then
		{
			_picArr set [(_picLen - 8), (toArray "T") select 0];
			_picture = toString _picArr;
		};
	};
	
	_gunpicture ctrlSettext _picture;
    
	_gunlisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach weaponsArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
    _weapon = (configFile >> "CfgMagazines" >> _weap_type);
    _gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText(_weapon >> "displayName"), getText(_weapon >> "descriptionShort")]);
    
	_gunpicture ctrlSettext "";
	
    _picture = getText(_weapon >> "picture");
	_itempicture ctrlSettext _picture;
	
	_gunlisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach ammoArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
	
	_weapon = (configFile >> "CfgWeapons" >> _weap_type);
	_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText(_weapon >> "displayName"), getText(_weapon >> "descriptionShort")]);
    
	_gunpicture ctrlSettext "";
	
    _picture = getText(_weapon >> "picture");
	_itempicture ctrlSettext _picture;
    
	_gunlisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach accessoriesArray;

{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
	
	_weapon = "";
	
	switch (_x select 3) do
	{
		case "bpack":
		{
			_weapon = (configFile >> "CfgVehicles" >> _weap_type);
			_description = "";
			
			switch (_weap_type) do
			{
				case "B_Bergen_Base": { _description = "25% more capacity than normal backpack" };
				case "B_Carryall_Base": { _description = "40% more capacity than normal backpack" };
			};
			
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _x select 0, _description]);
		};
		case "ghillie":
		{
			_weapon = (configFile >> "CfgWeapons" >> _weap_type);
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _x select 0, "Disguise as a swamp monster"]);
		};	
		default
		{
			_weapon = (configFile >> "CfgWeapons" >> _weap_type);
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", getText(_weapon >> "displayName"), getText(_weapon >> "descriptionShort")]);
		};
	};
    
	_gunpicture ctrlSettext "";
	
    _picture = getText(_weapon >> "picture");
	_itempicture ctrlSettext _picture;
    
	_gunlisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach gearArray;
