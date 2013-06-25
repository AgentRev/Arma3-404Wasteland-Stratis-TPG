//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\

enableBoats = true;

//Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost, sell amount
weaponsArray =
[
		// Handguns
	["P07","hgun_P07_F",50,25],
    ["Rook-40","hgun_Rook40_F",50,25], 
	["ACP-C2","hgun_ACPC2_F",50,25],
	
    	// Underwater Gun
	["SDAR","arifle_SDAR_F",75,50],
	
		// Submachine Guns
	["Scorpion EVO-4","SMG_02_F",100,50],
	["Vermin SBR","SMG_01_F",100,50],
	
    	// Assault Rifles
	["TRG-20","arifle_TRG20_F",100,50],
	["TRG-21","arifle_TRG21_F",150,75],
	["TRG-21 EGLM","arifle_TRG21_GL_F",200,100],
	["Mk20C","arifle_Mk20C_F",100,50],
	["Mk20","arifle_Mk20_F",150,75],
	["Mk20 EGLM","arifle_Mk20_GL_F",200,100],
	["Katiba Carabine","arifle_Katiba_C_F",100,50],
    ["Katiba","arifle_Katiba_F",150,75],
	["Katiba GL","arifle_Katiba_GL_F",200,100],
	["MXC","arifle_MXC_F",100,50],
	["MX","arifle_MX_F",150,75],
    ["MX 3GL","arifle_MX_GL_F",200,100],
	
    	// Light Machine Guns
    ["MX SW","arifle_MX_SW_F",200,100],
    ["Mk200","LMG_Mk200_F",250,125],
	["Zafir","LMG_Zafir_F",250,125],
	
		// Marksman Rifles
	["MXM","arifle_MXM_F",250,125],
    ["EBR","srifle_EBR_F",250,125],
	
		// Sniper Rifles
	["M320 LRR","srifle_LRR_SOS_F",1000,500],
	["GM6 Lynx","srifle_GM6_SOS_F",1000,500],
	
    	//Rocket Launchers
    ["PCML Rocket Launcher","launch_NLAW_F",500,250],
    ["RPG-42 Alamut","launch_RPG32_F",500,250],
	["Titan MPRL Launcher","launch_Titan_F",650,375]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray =
[
	["9mm 16Rnd Mag","16Rnd_9x21_Mag",5],							// P07, Rook-40
	["9mm 30Rnd Mag","30Rnd_9x21_Mag",10],							// Scorpion
	["9mm 30Rnd Vermin Mag","30Rnd_45ACP_Mag_SMG_01",15],			// Vermin
	["5.56mm 20Rnd UW Mag","20Rnd_556x45_UW_mag",5],				// SDAR (junk ammo)
	["5.56mm 30Rnd STANAG Mag","30Rnd_556x45_Stanag",10],			// SDAR	(good ammo), TRG-2x, Mk20
	["6.5mm 30Rnd Caseless Mag","30Rnd_65x39_caseless_green",15],	// Katiba
    ["6.5mm 30Rnd STANAG Mag","30Rnd_65x39_caseless_mag",15],		// MX
	["6.5mm 100Rnd Belt Case","100Rnd_65x39_caseless_mag",50],		// MX
	["6.5mm 200Rnd Belt Case","200Rnd_65x39_cased_Box",100],		// Mk200
	["7.62mm 20Rnd Mag","20Rnd_762x51_Mag",25],						// EBR
	["7.62mm 150Rnd Belt Case","150Rnd_762x51_Box",100],			// Zafir
	[".408 7Rnd Mag","7Rnd_408_Mag",50],							// M320 LRR
	["12.7mm 5Rnd Mag","5Rnd_127x108_Mag",50],            			// GM6 Lynx
	["40mm HE Grenade Round","1Rnd_HE_Grenade_shell",100],			// Grenade Launchers
	["Frag Grenade","HandGrenade",100],
	["PCML Missile","NLAW_F",250],
    ["RPG-42 Missile","RPG32_F",250],
    ["Titan AA Missile","Titan_AA",350],
	["APERS Tripwire Mine","APERSTripMine_Wire_Mag",150],
    ["APERS Bounding Mine","APERSBoundingMine_Range_Mag",200],
	["APERS Mine","APERSMine_Range_Mag",200],
	["Claymore Charge","ClaymoreDirectionalMine_Remote_Mag",250],
	["M6 SLAM Mine","SLAMDirectionalMine_Wire_Mag",250],
    ["AT Mine","ATMine_Range_Mag",250],
	["Explosive Charge","DemoCharge_Remote_Mag",250],
    ["Explosive Satchel","SatchelCharge_Remote_Mag",250]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray =
[
	["GPS","ItemGPS", 100,"item"],
	["Binoculars","Binocular",100,"binoc"],
	["Rangefinder","Rangefinder", 150,"binoc"], 
	["NV Goggles","NVGoggles",100,"item"],
    ["First Aid Kit","FirstAidKit", 25,"item"],
    ["Medikit","Medikit", 100,"item"],
    ["Toolkit","ToolKit", 100,"item"],
	["Mine Detector","MineDetector", 100,"item"],
  	["Suppressor 9mm","muzzle_snds_L", 50,"item"],
    ["Suppressor 7.62mm","muzzle_snds_B", 100,"item"],
    ["Suppressor 6.5mm","muzzle_snds_H", 100,"item"],
    ["LMG Suppressor 6.5mm","muzzle_snds_H_MG", 100,"item"],
    ["Flash Light","acc_flashlight", 50,"item"],
    ["ACO Sight (Red)","optic_Aco", 50,"item"],
	["ACO Sight (Green)","optic_ACO_grn", 50,"item"],
	["Holosight","optic_Holosight", 50,"item"],
	["RCO Sight","optic_Hamr", 100,"item"],
	["ARCO Sight","optic_Arco", 150,"item"],
	["SOS Sight","optic_SOS", 200,"item"]
];

//Gun Store Gear List
//Text name, classname, buy cost
gearArray = [
	["Bergen Backpack (MTP)","B_Bergen_mcamo", 500,"bpack"],		// 25% more capacity than default backpack (B_Kitbag_Base), 50% more than older backpack (B_AssaultPack_Base)
	["Bergen Backpack (Desert)","B_Bergen_sgg", 500,"bpack"],
	["Bergen Backpack (Black)","B_Bergen_blk", 500,"bpack"],
	["Carryall Backpack (MTP)","B_Carryall_mcamo", 750,"bpack"],	// 40% more capacity than default backpack (B_Kitbag_Base)
	["Carryall Backpack (Khaki)","B_Carryall_khk", 750,"bpack"],
	["Carryall Backpack (Olive)","B_Carryall_oli", 750,"bpack"],
	
	["Parachute","B_Parachute", 500,"bpack"],
	
	["Ghillie Suit","U_B_GhillieSuit", 200,"ghillie"],
	//["Ghillie Suit (Brown)","U_O_GhillieSuit", 200,"uni"], 	// Temporarily removed due to underwear glitch
	
	["Carrier Lite (Green)","V_PlateCarrier1_rgr", 100,"vest"],
	["Carrier Lite (Black)","V_PlateCarrier1_blk", 100,"vest"],
	["Carrier Lite (Coyote)","V_PlateCarrier1_cbr", 100,"vest"],
	["Carrier Rig (Green)","V_PlateCarrier2_rgr", 125,"vest"],
	["Carrier Rig (Black)","V_PlateCarrier2_blk", 125,"vest"],
	["Carrier Rig (Coyote)","V_PlateCarrier2_cbr", 125,"vest"],
    ["Carrier GL Rig (Green)","V_PlateCarrierGL_rgr", 150,"vest"],
	["Carrier GL Rig (Black)","V_PlateCarrierGL_blk", 150,"vest"],
	["Carrier GL Rig (Coyote)","V_PlateCarrierGL_cbr", 150,"vest"],
	["LBV Harness","V_HarnessO_brn", 100,"vest"],
	["LBV Harness (Gray)","V_HarnessO_gry", 100,"vest"],
	["LBV Grenadier Harness","V_HarnessOGL_brn", 200,"vest"],
	["LBV Grenadier Harness (Gray)","V_HarnessOGL_gry", 200,"vest"],
	["ELBV Harness","V_HarnessOSpec_brn", 220,"vest"],
	["ELBV Harness (Gray)","V_HarnessOSpec_gry", 220,"vest"],
	["GA Carrier Lite (Digi)","V_PlateCarrierIA1_dgtl", 100,"vest"],
	["GA Carrier Rig (Digi)","V_PlateCarrierIA2_dgtl", 140,"vest"],
	["GA Carrier GL Rig (Digi)","V_PlateCarrierIAGL_dgtl", 150,"vest"],
    ["Camouflaged Vest","V_TacVestCamo_khk", 100,"vest"],
    ["Raven Vest","V_TacVestIR_blk", 180,"vest"],
	
	["Diving Goggles","G_Diving", 50,"gogg"],
	["Rebreather 1","V_RebreatherB", 100,"vest"],
    ["Rebreather 2","V_RebreatherIR", 100,"vest"],
	["Rebreather 3","V_RebreatherIA", 100,"vest"],
    ["Wetsuit 1","U_B_Wetsuit", 100,"uni"],
    ["Wetsuit 2","U_O_Wetsuit", 100,"uni"],
	["Wetsuit 3","U_I_Wetsuit", 100,"uni"],
	
	["Booniehat (MTP)","H_Booniehat_mcamo", 50,"hat"],
    ["Booniehat (Hex)","H_Booniehat_ocamo", 50,"hat"],
	["Booniehat (Digital)","H_Booniehat_dgtl", 50,"hat"],
	["Booniehat (Khaki)","H_Booniehat_khk", 50,"hat"],
	["Booniehat (Green)","H_Booniehat_grn", 50,"hat"],
    ["Cap (Blue)","H_Cap_blu", 50,"hat"],
    ["Cap (Red)","H_Cap_red", 50,"hat"],
	["Cap (Green)","H_Cap_grn", 50,"hat"],
	["Cap (Tan)","H_Cap_tan", 50,"hat"],
	["Cap (Black)","H_Cap_blk", 50,"hat"],
    ["Rangemaster Cap","H_Cap_headphones", 50,"hat"],
	["Military Cap (MTP)","H_MilCap_mcamo", 50,"hat"],
    ["Military Cap (Hex)","H_MilCap_ocamo", 50,"hat"],
	["Military Cap (Urban)","H_MilCap_oucamo", 50,"hat"],
    ["Pilot Helmet 1","H_PilotHelmetHeli_B", 50,"hat"],
    ["Pilot Helmet 2","H_PilotHelmetHeli_O", 50,"hat"],
	["Pilot Helmet 3","H_PilotHelmetHeli_I", 50,"hat"]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore =
[
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",3000,1500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]  
];

// Stratis town and city array
//Marker Name, Radius, City Name
cityList =
[
	["Town_1",200,"Air Station Mike-28"],
	["Town_2",100,"Agios Loannis"],
	["Town_3",100,"Agios Cephas"],
	["Town_4",175,"Girna"],			
	["Town_5",175,"Camp Tempest"],
	["Town_6",250,"Stratis Airbase Town"],
	["Town_7",180,"Stratis Airbase Runway"],
	["Town_8",290,"Agia Marina"],
	["Town_9",150,"Kill Farm"],
	["Town_10",210,"Camp Rogain"],
	["Town_11",180,"Kamino Firing Range"],
	["Town_12",220,"Camp Maxwell"]
];
cityLocations = [];
