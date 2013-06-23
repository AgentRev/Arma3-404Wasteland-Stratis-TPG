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
weaponsArray = [
		// Handguns
	["P07","hgun_P07_F",50,25],
    ["Rook-40","hgun_Rook40_F",50,25], 
	
    	// Underwater Gun
	["SDAR","arifle_SDAR_F",75,50],
	
    	// Assault Rifles
	["TRG-20","arifle_TRG20_F",100,50],
	["TRG-21","arifle_TRG21_F",150,75],
	["TRG-21 EGLM","arifle_TRG21_GL_F",200,100],
	["Katiba Carabine","arifle_Khaybar_C_F",100,50],
    ["Katiba","arifle_Khaybar_F",150,75],
	["Katiba GL","arifle_Khaybar_GL_F",200,100],
	["MXC","arifle_MXC_F",100,50],
	["MX","arifle_MX_F",150,75],
    ["MX 3GL","arifle_MX_GL_F",200,100],
	
    	// Light Machine Guns
    ["MX SW","arifle_MX_SW_F",200,100],
    ["Mk200","LMG_Mk200_F",250,125],
	
		// Marksman Rifles
	["MXM","arifle_MXM_F",250,125],
    ["EBR","srifle_EBR_F",250,125],
	
		// Sniper Rifles
	["M320 LRR","srifle_LRR_SOS_F",1000,500],
	["GM6 Lynx","srifle_GM6_SOS_F",1000,500],
	
    	//Rocket Launchers
    ["NLAW","launch_NLAW_F",600,300],
    ["RPG-42 Alamut","launch_RPG32_F",750,375]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["9mm 16Rnd Mag","16Rnd_9x21_Mag",10],							// P07, Rook-40
	["5.56mm 20Rnd UW Mag","20Rnd_556x45_UW_mag",5],				// SDAR (junk ammo)
	["5.56mm 30Rnd STANAG Mag","30Rnd_556x45_Stanag",10],			// SDAR	(good ammo), TRG-2x
	// ["6.5mm 30Rnd Mag","30Rnd_65x39_case_mag",15],				// Old TRG-2x
	["6.5mm 30Rnd Caseless Mag","30Rnd_65x39_caseless_green",15],	// Katiba
    ["6.5mm 30Rnd STANAG Mag","30Rnd_65x39_caseless_mag",15],		// MX
	["6.5mm 100Rnd Belt Case","100Rnd_65x39_caseless_mag",50],		// MX
	["6.5mm 200Rnd Belt Case","200Rnd_65x39_cased_Box",100],		// Mk200
	["7.62mm 20Rnd Mag","20Rnd_762x51_Mag",25],						// EBR
	[".408 7Rnd Mag","7Rnd_408_Mag",50],							// M320 LRR
	["12.7mm 5Rnd Mag","5Rnd_127x108_Mag",50],            			// GM6 Lynx
	["40mm HE Grenade Round","1Rnd_HE_Grenade_shell",100],			// Grenade Launchers
	["Frag Grenade","HandGrenade",100],
	["NLAW Missile","NLAW_F",250],
    ["RPG32 Missile","RPG32_F",250],
    ["RPG32 AA Missile","RPG32_AA_F",400],
	["Explosive Charge","DemoCharge_Remote_Mag",250],
    ["Explosive Satchel","SatchelCharge_Remote_Mag",250],
    ["AT Mine","ATMine_Range_Mag",250],
    ["M6 SLAM Mine","SLAMDirectionalMine_Wire_Mag",250],
    ["Claymore Charge","ClaymoreDirectionalMine_Remote_Mag",250],
    ["APERS Mine","APERSMine_Range_Mag",250],
    ["APERS Bounding Mine","APERSBoundingMine_Range_Mag",250],
    ["APERS Tripwire Mine","APERSTripMine_Wire_Mag",250]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
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
	["Backpack (Large)","B_Bergen_Base", 500,"bpack"],			// 25% more capacity than default backpack (B_Kitbag_Base), 50% more than older backpack (B_AssaultPack_Base)
	["Backpack (Extra Large)","B_Carryall_Base", 750,"bpack"],	// 40% more capacity than default backpack (B_Kitbag_Base)
	["Ghillie Suit","U_B_GhillieSuit", 200,"ghillie"],
	//["Ghillie Suit (Brown)","U_O_GhillieSuit", 200,"uni"], 	// Temporarily removed due to underwear glitch
    ["Carrier GL Rig (Green)","V_PlateCarrierGL_rgr", 100,"vest"],
    ["Carrier Lite (Coyote)","V_PlateCarrier1_cbr", 100,"vest"],
    ["Carrier Lite (Green)","V_PlateCarrier1_rgr", 100,"vest"],
    ["Carrier Rig (Green)","V_PlateCarrier2_rgr", 100,"vest"],
    ["Chest Rig (Khaki)","V_Chestrig_khk", 100,"vest"],
    ["Chest Rig (Green)","V_ChestrigB_rgr", 100,"vest"],
    ["Slash Bandolier (Coyote)","V_BandollierB_cbr", 100,"vest"],
    ["Slash Bandolier (Khaki)","V_BandollierB_khk", 100,"vest"],
    ["Tactical Vest (Brown)","V_TacVest_brn", 100,"vest"],
    ["Tactical Vest (Khaki)","V_TacVest_khk", 100,"vest"],
    ["Tactical Vest (Olive)","V_TacVest_oli", 100,"vest"],
    ["Combat Fatigues (MTP)","U_B_CombatUniform_mcam", 100,"uni"],
    ["Combat Fatigues (Tee)","U_B_CombatUniform_mcam_tshirt", 100,"uni"],
	["Diving Goggles","G_Diving", 50,"gogg"],
	["Rebreather 1","V_RebreatherB", 100,"vest"],
    ["Rebreather 2","V_RebreatherIR", 100,"vest"],
    ["Wetsuit Blue","U_B_Wetsuit", 100,"uni"],
    ["Wetsuit Red","U_OI_Wetsuit", 100,"uni"],
    ["ECH","H_HelmetB", 50,"hat"],
    ["ECH (Light)","H_HelmetB_light", 50,"hat"],
    ["ECH (Custom)","H_HelmetB_paint", 50,"hat"],
    ["Booniehat (Hex)","H_Booniehat_ocamo", 50,"hat"],
    ["Booniehat (Khaki)","H_Booniehat_khk", 50,"hat"],
    ["Booniehat (MTP)","H_Booniehat_mcamo", 50,"hat"],
    ["Cap (Blue)","H_Cap_blu", 50,"hat"],
    ["Cap (Red)","H_Cap_red", 50,"hat"],
    ["Cap (SERO)","H_Cap_brn_SERO", 50,"hat"],
    ["Cap Rangemaster","H_Cap_headphones", 50,"hat"],
    ["Cap Military (Hex)","H_MilCap_ocamo", 50,"hat"],
    ["Cap Military (MTP)","H_MilCap_mcamo", 50,"hat"],
    ["Pilot Helmet Blue","H_PilotHelmetHeli_B", 50,"hat"],
    ["Pilot Helmet Red","H_PilotHelmetHeli_O", 50,"hat"]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
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
cityList = [
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
