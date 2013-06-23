//	@file Version: 1.0
//	@file Name: isAdmin.sqf
//	@file Author: AgentRev
//	@file Created: 13/06/2013 18:02

private ["_result", "_findUIDinArray"];
_result = false;

_findUIDinArray =
{
	private ["_uid", "_adminType", "_adminList", "_found"];
	
	_uid = _this select 0;
	_adminType = _this select 1;
	_adminList = [];
	_found = false;
	
	switch (typeName _adminType) do
	{
		case "CODE":	{ _adminList = call _adminType };
		case "ARRAY":	{ _adminList = _adminType };
		case "SCALAR":
		{
			switch (_adminType) do
			{
				case 1:
				{
					if (serverCommandAvailable "#kick") then { _found = true }
					else {_adminList = call moderators };
				};
				case 2:
				{
					_adminList = call administrators;
				};
				case 3:
				{
					if (isServer || serverCommandAvailable "#exec ban") then { _found = true }
					else { _adminList = call serverAdministrators };
				};
			};
		};
	};
	
	_found || _uid in _adminList
};

if (typeName _this == "ARRAY") then
{
	_result = _this call _findUIDinArray;
}
else
{
	for "_i" from 1 to 3 do
	{
		_result = (_result || [_this, _i] call _findUIDinArray);
	};
};

_result
