
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

_descCapacity =
{
	private ["_item", "_type", "_text", "_containerClass", "_defaultCapacity", "_newCapacity", "_diff"];
	_item = _this select 0;
	_type = _this select 1;
	_text = "";
	_defaultCapacity = 0;
	_newCapacity = 0;
	
	switch (_type) do
	{
		case "vest":
		{
			_containerClass = getText (configFile >> "CfgWeapons" >> "V_PlateCarrier1_rgr" >> "ItemInfo" >> "containerClass");
			_defaultCapacity = getNumber (configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
			
			_containerClass = getText (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "containerClass");
			_newCapacity = getNumber (configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
			
			_text = "vest";
		};
		case "bpack":
		{
			_defaultCapacity = getNumber (configFile >> "CfgVehicles" >> "B_Kitbag_Base" >> "maximumLoad");
			_newCapacity = getNumber (configFile >> "CfgVehicles" >> _item >> "maximumLoad");
			
			_text = "backpack";
		};
	};
	
	_diff = round (((_newCapacity / _defaultCapacity) - 1) * 100);
	
	if (_diff > 0) then
	{
		_text = format ["%1", abs _diff] + "% more capacity than default " + _text;
	};
	if (_diff < 0) then
	{
		_text = format ["%1", abs _diff] + "% less capacity than default " + _text;
	};
	if (_diff == 0) then
	{
		_text = "Same capacity as default " + _text;
	};
	
	_text
};

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
	_description = "";
	_name = "";
	
	switch (_x select 3) do
	{
		case "bpack":
		{
			_weapon = (configFile >> "CfgVehicles" >> _weap_type);
			
			if (_weap_type == "B_Parachute") then
			{
				_name = getText (_weapon >> "displayName");
				_description = "Safely jump from above";
			}
			else
			{
				_name = _x select 0;
				_description = [_weap_type, "bpack"] call _descCapacity;
			};
			
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _name, _description]);
		};
		case "vest":
		{
			_weapon = (configFile >> "CfgWeapons" >> _weap_type);
			
			if (["Rebreather", _weap_type] call BIS_fnc_inString) then
			{
				_description = "Underwater oxygen supply";
			}
			else
			{
				_description = [_weap_type, "vest"] call _descCapacity;
			};
			
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _x select 0, _description]);
		};
		case "ghillie":
		{
			_weapon = (configFile >> "CfgWeapons" >> _weap_type);
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _x select 0, "Disguise as a swamp monster"]);
		};
		case "gogg":
		{
			_weapon = (configFile >> "CfgGlasses" >> _weap_type);
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _x select 0, "Increases underwater visibility"]);
		};
		default
		{
			_weapon = (configFile >> "CfgWeapons" >> _weap_type);
			
			if (_weap_type == "U_B_Wetsuit") then
			{
				_name = "Wetsuit";
				_description = "Allows for faster swimming";
			}
			else
			{
				if (_x select 3 == "hat") then
				{
					_name = _x select 0;
				}
				else
				{
					_name = getText (_weapon >> "displayName");
				};
				
				_description = getText( _weapon >> "descriptionShort");
			};
			
			_gunInfo ctrlSetStructuredText parseText (format ["%1<br/>%2", _name, _description]);
		};
	};
    
	_gunpicture ctrlSettext "";
	
    _picture = getText(_weapon >> "picture");
	_itempicture ctrlSettext _picture;
    
	_gunlisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach gearArray;
