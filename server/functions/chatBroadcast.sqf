
//	@file Version: 1.0
//	@file Name: chatBroadcast.sqf
//	@file Author: AgentRev
//	@file Created: 02/06/2013 16:23

if (typeName _this == typeName [] /*&& {_this select 1 != getPlayerUID player}*/ && {_this select 2 == _flagChecksum}) then
{
	player groupChat format ["%1", _this select 0];
};
