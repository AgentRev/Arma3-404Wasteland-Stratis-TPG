setviewdistance 1000;
bis_fog = 0.5;
 
setviewdistance 1000;
0 setovercast 0.5;
0 setrain 0;
//0 setfog 0;
0 setfog bis_fog;
 
[] spawn {
    _delay = 3;
    sleep 0.01;
    while {true} do {
        _delay  setovercast 0.5;
        _delay  setrain 0;
        _delay  setfog bis_fog;
        sleep _delay ;
    };
};
