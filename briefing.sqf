waitUntil {!isNull player && isPlayer player};

player createDiarySubject ["credits", "Credits"];
player createDiarySubject ["changelog", "Change Log"];
// player createDiarySubject ["wasteland", "What is Wasteland?"];

player createDiaryRecord["changelog",
[
"1.01",
"
<br/>
		[Fixed] - Gun Stores<br/>
		[Fixed] - Missions<br/>
		[Fixed] - General UI<br/>
		[Fixed] - Lots of other fixes<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.02",
"
<br/>
		[Fixed] - Respawning Vehicles<br/>
		[Fixed] - Deserted Vehicles (20Mins)<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.03",
"
<br/>
		[Added] - Light Armed Vehicle Mission (All armed cars).<br/>
		[Removed] - All armed cars from initial spawn for balance.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.05",
"
<br/>
		[Added] Uniforms,Hats and Vests to the gunstore.<br/>
		[Added] Players now spawn with a backpack.<br/>
		[Fixed] Not able to get weapons out of vehicle.<br/>
		[Fixed] R3F Loading into vehicles.<br/>
		[Fixed] Gunstore locations so they can't be ran down by vehicles.<br/>
		[Fixed] Health Icon.<br/>
		[Fixed] Static helicopter spawning and no more explosions.<br/>
		[Fixed] Weapon crates can now be loaded into vehicles.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.06",
"
<br/>
		[Fixed] Fix to make Ammo boxes moveable.(thanks to meat147).<br/>
		[Fixed] missing disabled color for money input error.(thanks to Sanjo).<br/>
		[Fixed] NV Goggles in cars and boxes.(thanks to Sanjo).<br/>
		
"
]
];

player createDiaryRecord["changelog",
[
"1.07+",
"
<br/>
See all changes in the ""404 Wasteland TPG Edition"" thread on http://teamplayergaming.com/arma-3/<br/>
"
]
];

player createDiaryRecord["credits",
[
"Credits",
"
<br/>
<font face='PuristaBold' size='16'>TAW</font><br/>
Tonic<br/><br/><br/>
<font face='PuristaBold' size='16'>ARMA.SU</font><br/>
Sa-Matra<br/><br/><br/>
<font face='PuristaBold' size='16'>OcUK</font><br/>
MarKeR<br/><br/><br/>
<font face='PuristaBold' size='16'>404Games</font><br/>
Deadbeat<br/>
Costlyy<br/>
Pulse<br/>
Domuk<br/><br/><br/>
<font face='PuristaBold' size='16'>TeamPlayerGaming</font><br/>
AgentRev<br/>
BigHub<br/><br/><br/>
<font face='PuristaBold' size='16'>GoT</font><br/>
JoSchaap<br/><br/><br/>
<font face='PuristaBold' size='16'>OpenDayZ</font><br/>
AWA<br/><br/><br/>
<font face='PuristaBold' size='16'>Others</font><br/>
Sanjo<br/>
meat147<br/>
spunFIN<br/>
SPJESTER<br/>
"
]
];
