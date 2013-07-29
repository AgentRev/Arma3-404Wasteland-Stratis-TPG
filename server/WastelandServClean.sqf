//	@file Version: 1.0
//	@file Name: WastelandServClean.sqf
//	@file Author: AgentRev
//	@file Created: 27/07/2013 15:36

private "_delQtyP";

while { true } do
{
	sleep 300;
	
	//diag_log "CLEANUP: Performing bodies cleanup";
	
	_delQtyP = 0;
	
	{
		if (local _x && {time - (_x getVariable ["processedDeath", time]) > 1800}) then
		{
			deleteVehicle _x;
			_delQtyP = _delQtyP + 1;
		};
	} forEach allDead;
	
	//diag_log format ["CLEANUP: Deleted %1 bodies", _delQtyP];
	
	//diag_log "CLEANUP: Performing groups cleanup";
	
	{
		if (count units _x == 0) then
		{
			//diag_log format ["CLEANUP: Deleting group <%1>", _x];
			deleteGroup _x;
		};
	} forEach allGroups;
};
