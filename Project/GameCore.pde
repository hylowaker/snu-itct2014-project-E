class GameCore {

  // game states
  int hp;
  int combo;
  int starttime = 0;
  boolean end;
  boolean clear;
  String song = "";  

  // constants: position of lanes and notes
  int lanePos = 90;
  int laneGap = 150;
  int threshold = 100;
  
  PImage gameover;
  PImage stageclear;
  // constructor
  GameCore() {
    this.hp = 100;
    this.combo = 0;
    gameover = loadImage("gameover.jpg");
    stageclear = loadImage("clear.png");
    end = false;
    clear = false;
  }

  // create note objects
  void setupNotes(String songname) {
    
    if (songname == "Don't look back in anger") {
      clear = false;
      end = false;
      song = songname;
      
      starttime = 8500;
      int f = 722; 
      
      notes = new Note[130];
      //1st
      notes[0] = new Note(4, 0);
      notes[1] = new Note(2, f);
      notes[2] = new Note(1, 2*f);
      notes[3] = new Note(2, 3*f);
      //2nd
      notes[4] = new Note(3, 4*f);
      notes[5] = new Note(1, 5*f);
      notes[6] = new Note(2, 6*f);
      notes[7] = new Note(1, 7*f);
      //3rd
      notes[8] = new Note(3, 8*f);
      notes[9] = new Note(1, 9*f);
      notes[10] = new Note(2, 10*f);
      notes[11] = new Note(1, 11*f);
      //4th
      notes[12] = new Note(3, 12*f);
      notes[13] = new Note(1, 13*f);
      notes[14] = new Note(2, 14*f);
      notes[15] = new Note(1, 15*f);
      //5th
      notes[16] = new Note(4, 16*f);
      notes[17] = new Note(2, 17*f);
      notes[18] = new Note(1, 18*f);
      notes[19] = new Note(2, 19*f);
      //6th
      notes[20] = new Note(3, 20*f);
      notes[21] = new Note(1, 21*f);
      notes[22] = new Note(2, 22*f);
      notes[23] = new Note(1, 23*f);
      //7th
      notes[24] = new Note(3, 24*f);
      notes[25] = new Note(1, 25*f);
      notes[26] = new Note(2, 26*f);
      notes[27] = new Note(1, 27*f);
      //8th
      notes[28] = new Note(3, 28*f);
      notes[29] = new Note(1, 29*f);
      notes[30] = new Note(2, 30*f);
      notes[31] = new Note(1, 31*f);

      //9th
      notes[32] = new Note(4, 32*f);
      notes[33] = new Note(2, 1000*f);
      notes[34] = new Note(1, 1000*f);
      notes[35] = new Note(2, 1000*f);
      //10th
      notes[36] = new Note(3, 33*f);
      notes[37] = new Note(1, 34*f);
      notes[38] = new Note(2, 35*f);
      notes[39] = new Note(1, 36*f);
      //11th
      notes[40] = new Note(3, 37*f);
      notes[41] = new Note(1, 39*f);
      notes[42] = new Note(2, 40*f);
      notes[43] = new Note(1, 41*f); 
      //12th
      notes[44] = new Note(3, 42*f);
      notes[45] = new Note(1, 43*f);
      notes[46] = new Note(2, 44*f);
      notes[47] = new Note(1, 45*f);
      
      //13th
      notes[48] = new Note(4, 46*f);
      notes[49] = new Note(2, 47*f);
      notes[50] = new Note(1, 48*f);
      notes[51] = new Note(2, 49*f);
      //14th
      notes[52] = new Note(3, 50*f);
      notes[53] = new Note(1, 51*f);
      notes[54] = new Note(2, 52*f);
      notes[55] = new Note(1, 53*f);
      //15th
      notes[56] = new Note(3, 54*f);
      notes[57] = new Note(1, 55*f);
      notes[58] = new Note(2, 56*f);
      notes[59] = new Note(1, 57*f);
      //16th
      notes[60] = new Note(3, 58*f);
      notes[61] = new Note(1, 59*f);
      notes[62] = new Note(2, 60*f);
      notes[63] = new Note(1, 61*f);
      
      //17th
      notes[64] = new Note(4, 62*f);
      notes[65] = new Note(2, 63*f);
      notes[66] = new Note(1, 64*f);
      notes[67] = new Note(2, 65*f);
      //18th
      notes[68] = new Note(3, 66*f);
      notes[69] = new Note(1, 67*f);
      notes[70] = new Note(2, 68*f);
      notes[71] = new Note(1, 69*f);
      //19th
      notes[72] = new Note(3, 70*f);
      notes[73] = new Note(1, 71*f);
      notes[74] = new Note(2, 72*f);
      notes[75] = new Note(1, 73*f);
      //20th
      notes[76] = new Note(3, 74*f);
      notes[77] = new Note(1, 75*f);
      notes[78] = new Note(2, 76*f);
      notes[79] = new Note(1, 77*f);

      //21th
      notes[80] = new Note(4, 78*f);
      notes[81] = new Note(2, 79*f);
      notes[82] = new Note(1, 80*f);
      notes[83] = new Note(2, 81*f);
      //22th
      notes[84] = new Note(3, 82*f);
      notes[85] = new Note(1, 83*f);
      notes[86] = new Note(2, 84*f);
      notes[87] = new Note(1, 85*f);
      //23th
      notes[88] = new Note(3, 86*f);
      notes[89] = new Note(1, 87*f);
      notes[90] = new Note(2, 88*f);
      notes[91] = new Note(1, 89*f);
      //24th
      notes[92] = new Note(3, 90*f);
      notes[93] = new Note(1, 91*f);
      notes[94] = new Note(2, 92*f);
      notes[95] = new Note(1, 93*f);

      //25th
      notes[96] = new Note(4, 94*f);
      notes[97] = new Note(2, 95*f);
      notes[98] = new Note(1, 96*f);
      notes[99] = new Note(2, 97*f);
      //26th
      notes[100] = new Note(3, 98*f);
      notes[101] = new Note(1, 1000*f);
      notes[102] = new Note(2, 1000*f);
      notes[103] = new Note(4, 1010*f);
      //27th
      notes[104] = new Note(3, 104*f);
      notes[105] = new Note(1, 105*f);
      notes[106] = new Note(2, 106*f);
      notes[107] = new Note(1, 107*f);
      //28th
      notes[108] = new Note(3, 108*f);
      notes[109] = new Note(1, 109*f);
      notes[110] = new Note(2, 110*f);
      notes[111] = new Note(4, 111*f);

      //29th
      notes[112] = new Note(4, 112*f);
      notes[113] = new Note(2, 113*f);
      notes[114] = new Note(1, 114*f);
      notes[115] = new Note(2, 115*f);
      //30th
      notes[116] = new Note(3, 116*f);
      notes[117] = new Note(1, 117*f);
      notes[118] = new Note(2, 118*f);
      notes[119] = new Note(4, 119*f);
      //31th
      notes[120] = new Note(3, 120*f);
      notes[121] = new Note(1, 121*f);
      notes[122] = new Note(2, 122*f);
      notes[123] = new Note(1, 123*f);
      //32th
      notes[124] = new Note(1, 124*f);
      notes[125] = new Note(3, 124*f);
      notes[126] = new Note(1, 125*f);
      notes[127] = new Note(1, 126*f);
      notes[128] = new Note(2, 126*f);
      notes[129] = new Note(4, 127*f);
      
      
    }
    
    else if (songname == "I love you oh thank you") {
      clear = false;
      end = false;
      song = songname;
      
      starttime = 13500;
      int d = 666;
      
      notes = new Note[256];

      //1th
      notes[0] = new Note(3, 0);
      notes[1] = new Note(4, 0);
      notes[2] = new Note(1, d);
      notes[3] = new Note(2, d);
      notes[4] = new Note(1, 2*d);
      notes[5] = new Note(3, 2*d);
      notes[6] = new Note(1, 3*d);
      notes[7] = new Note(2, 3*d);
      //2nd
      notes[8] = new Note(1, 4*d);
      notes[9] = new Note(3, 4*d);
      notes[10] = new Note(1, 5*d);
      notes[11] = new Note(2, 5*d);
      notes[12] = new Note(1, 6*d);
      notes[13] = new Note(3, 6*d);
      notes[14] = new Note(1, 7*d);
      notes[15] = new Note(2, 7*d);
      //3rd
      notes[16] = new Note(1, 8*d);
      notes[17] = new Note(3, 8*d);
      notes[18] = new Note(1, 9*d);
      notes[19] = new Note(2, 9*d);
      notes[20] = new Note(1, 10*d);
      notes[21] = new Note(3, 10*d);
      notes[22] = new Note(1, 11*d);
      notes[23] = new Note(2, 11*d);
      //4th
      notes[24] = new Note(1, 12*d);
      notes[25] = new Note(3, 12*d);
      notes[26] = new Note(1, 13*d);
      notes[27] = new Note(2, 13*d);
      notes[28] = new Note(1, 14*d);
      notes[29] = new Note(3, 14*d);
      notes[30] = new Note(1, 15*d);
      notes[31] = new Note(2, 15*d);
      //5th
      notes[32] = new Note(1, 16*d);
      notes[33] = new Note(3, 16*d);
      notes[34] = new Note(1, 17*d);
      notes[35] = new Note(2, 17*d);
      notes[36] = new Note(1, 18*d);
      notes[37] = new Note(3, 18*d);
      notes[38] = new Note(1, 19*d);
      notes[39] = new Note(2, 19*d);
      //6th
      notes[40] = new Note(1, 20*d);
      notes[41] = new Note(3, 20*d);
      notes[42] = new Note(1, 21*d);
      notes[43] = new Note(2, 21*d);
      notes[44] = new Note(1, 22*d);
      notes[45] = new Note(3, 22*d);
      notes[46] = new Note(1, 23*d);
      notes[47] = new Note(2, 23*d);
      //7th
      notes[48] = new Note(1, 24*d);
      notes[49] = new Note(3, 24*d);
      notes[50] = new Note(1, 25*d);
      notes[51] = new Note(2, 25*d);
      notes[52] = new Note(1, 26*d);
      notes[53] = new Note(3, 26*d);
      notes[54] = new Note(1, 27*d);
      notes[55] = new Note(2, 27*d);
      //8th
      notes[56] = new Note(1, 28*d);
      notes[57] = new Note(3, 28*d);
      // notes[58] = new Note(1, 29*d);
      notes[58] = new Note(2, 29*d);
      notes[59] = new Note(4, 30*d);

      //9th
      notes[60] = new Note(4, 32*d);
      notes[61] = new Note(3, 32*d);
      notes[62] = new Note(1, 33*d);
      notes[63] = new Note(1, 34*d);
      notes[64] = new Note(3, 34*d);
      notes[65] = new Note(1, 35*d);
      notes[66] = new Note(2, 35*d);
      //10th
      notes[67] = new Note(1, 36*d);
      notes[68] = new Note(3, 36*d);
      notes[69] = new Note(1, 37*d);
      notes[70] = new Note(1, 38*d);
      notes[71] = new Note(3, 38*d);
      notes[72] = new Note(1, 39*d);
      notes[73] = new Note(2, 39*d);
      //11th
      notes[74] = new Note(1, 40*d);
      notes[75] = new Note(3, 40*d);
      notes[76] = new Note(1, 41*d);
      notes[77] = new Note(1, 42*d);
      notes[78] = new Note(3, 42*d);
      notes[79] = new Note(1, 43*d);
      notes[80] = new Note(2, 43*d);
      //12th
      notes[81] = new Note(1, 44*d);
      notes[82] = new Note(3, 44*d);
      notes[83] = new Note(1, 45*d);
      notes[84] = new Note(1, 46*d);
      notes[85] = new Note(3, 46*d);
      notes[86] = new Note(1, 47*d);
      notes[87] = new Note(2, 47*d);
      //13th
      notes[88] = new Note(1, 48*d);
      notes[89] = new Note(3, 48*d);
      notes[90] = new Note(1, 49*d);
      notes[91] = new Note(1, 50*d);
      notes[92] = new Note(3, 50*d);
      notes[93] = new Note(1, 51*d);
      notes[94] = new Note(2, 51*d);
      //14th
      notes[95] = new Note(1, 52*d);
      notes[96] = new Note(3, 52*d);
      notes[97] = new Note(1, 53*d);
      notes[98] = new Note(1, 54*d);
      notes[99] = new Note(3, 54*d);
      notes[100] = new Note(1, 55*d);
      notes[101] = new Note(2, 55*d);
      //15th
      notes[102] = new Note(1, 56*d);
      notes[103] = new Note(3, 56*d);
      notes[104] = new Note(1, 57*d);
      notes[105] = new Note(1, 58*d);
      notes[106] = new Note(3, 58*d);
      notes[107] = new Note(1, 59*d);
      notes[108] = new Note(2, 59*d);
      //16th
      notes[109] = new Note(1, 60*d);
      notes[110] = new Note(3, 60*d);
      notes[111] = new Note(1, 61*d);
      notes[112] = new Note(1, 62*d);
      notes[113] = new Note(3, 62*d);
      notes[114] = new Note(4, 63*d);
      notes[115] = new Note(2, 63*d);

      //17th
      notes[116] = new Note(4, 64*d);
      notes[117] = new Note(3, 64*d);
      notes[118] = new Note(1, 65*d);
      notes[119] = new Note(1, 66*d);
      notes[120] = new Note(3, 66*d);
      notes[121] = new Note(1, 67*d);
      notes[122] = new Note(2, 67*d);
      //18th
      notes[123] = new Note(1, 68*d);
      notes[124] = new Note(3, 68*d);
      notes[125] = new Note(1, 69*d);
      notes[126] = new Note(1, 70*d);
      notes[127] = new Note(3, 70*d);
      notes[128] = new Note(1, 71*d);
      notes[129] = new Note(2, 71*d);
      //19th
      notes[130] = new Note(1, 72*d);
      notes[131] = new Note(3, 72*d);
      notes[132] = new Note(1, 73*d);
      notes[133] = new Note(1, 74*d);
      notes[134] = new Note(3, 74*d);
      notes[135] = new Note(1, 75*d);
      notes[136] = new Note(2, 75*d);
      //20th
      notes[137] = new Note(1, 76*d);
      notes[138] = new Note(3, 76*d);
      notes[139] = new Note(1, 77*d);
      notes[140] = new Note(1, 78*d);
      notes[141] = new Note(3, 78*d);
      notes[142] = new Note(1, 79*d);
      notes[143] = new Note(2, 79*d);
      //21th
      notes[144] = new Note(1, 80*d);
      notes[145] = new Note(3, 80*d);
      notes[146] = new Note(1, 81*d);
      notes[147] = new Note(1, 82*d);
      notes[148] = new Note(3, 82*d);
      notes[149] = new Note(1, 83*d);
      notes[150] = new Note(2, 83*d);
      //22th
      notes[151] = new Note(1, 84*d);
      notes[152] = new Note(3, 84*d);
      notes[153] = new Note(1, 85*d);
      notes[154] = new Note(1, 86*d);
      notes[155] = new Note(3, 86*d);
      notes[156] = new Note(1, 87*d);
      notes[157] = new Note(2, 87*d);
      //23th
      notes[158] = new Note(1, 88*d);
      notes[159] = new Note(3, 88*d);
      notes[160] = new Note(1, 89*d);
      notes[161] = new Note(1, 90*d);
      notes[162] = new Note(3, 90*d);
      notes[163] = new Note(1, 91*d);
      notes[164] = new Note(2, 91*d);
      //24th
      notes[165] = new Note(1, 92*d);
      notes[166] = new Note(3, 92*d);
      notes[167] = new Note(1, 93*d);
      notes[168] = new Note(1, 94*d);
      notes[169] = new Note(3, 94*d);
      notes[170] = new Note(4, 95*d);
      notes[171] = new Note(2, 95*d);

      //25th
      notes[172] = new Note(4, 96*d);
      notes[173] = new Note(3, 96*d);
      notes[174] = new Note(1, 97*d);
      notes[175] = new Note(1, 98*d);
      notes[176] = new Note(3, 98*d);
      notes[177] = new Note(1, 99*d);
      notes[178] = new Note(2, 99*d);
      //26th
      notes[179] = new Note(1, 100*d);
      notes[180] = new Note(3, 100*d);
      notes[181] = new Note(1, 101*d);
      notes[182] = new Note(1, 102*d);
      notes[183] = new Note(3, 102*d);
      notes[184] = new Note(1, 103*d);
      notes[185] = new Note(2, 103*d);
      //27th
      notes[186] = new Note(1, 104*d);
      notes[187] = new Note(3, 104*d);
      notes[188] = new Note(1, 105*d);
      notes[189] = new Note(1, 106*d);
      notes[190] = new Note(3, 106*d);
      notes[191] = new Note(1, 107*d);
      notes[192] = new Note(2, 107*d);
      //28th
      notes[193] = new Note(1, 108*d);
      notes[194] = new Note(3, 108*d);
      notes[195] = new Note(1, 109*d);
      notes[196] = new Note(1, 110*d);
      notes[197] = new Note(3, 110*d);
      notes[198] = new Note(1, 111*d);
      notes[199] = new Note(2, 111*d);
      //29th
      notes[200] = new Note(1, 112*d);
      notes[201] = new Note(3, 112*d);
      notes[202] = new Note(1, 113*d);
      notes[203] = new Note(1, 114*d);
      notes[204] = new Note(3, 114*d);
      notes[205] = new Note(1, 115*d);
      notes[206] = new Note(2, 115*d);
      //30th
      notes[207] = new Note(1, 116*d);
      notes[208] = new Note(3, 116*d);
      notes[209] = new Note(1, 117*d);
      notes[210] = new Note(1, 118*d);
      notes[211] = new Note(3, 118*d);
      notes[212] = new Note(1, 119*d);
      notes[213] = new Note(2, 119*d);
      //31th
      notes[214] = new Note(1, 120*d);
      notes[215] = new Note(3, 120*d);
      notes[216] = new Note(1, 121*d);
      notes[217] = new Note(1, 122*d);
      notes[218] = new Note(3, 122*d);
      notes[219] = new Note(1, 123*d);
      notes[220] = new Note(2, 123*d);
      //32th
      notes[221] = new Note(1, 124*d);
      notes[222] = new Note(3, 124*d);
      notes[223] = new Note(1, 125*d);
      notes[224] = new Note(1, 126*d);
      notes[225] = new Note(3, 126*d);
      notes[226] = new Note(4, 127*d);
      notes[227] = new Note(2, 127*d);

      //33th
      notes[228] = new Note(4, 128*d);
      notes[229] = new Note(3, 128*d);
      notes[230] = new Note(1, 129*d);
      notes[231] = new Note(1, 130*d);
      notes[232] = new Note(3, 130*d);
      notes[233] = new Note(1, 131*d);
      notes[234] = new Note(2, 131*d);
      //34th
      notes[235] = new Note(1, 132*d);
      notes[236] = new Note(3, 132*d);
      notes[237] = new Note(1, 133*d);
      notes[238] = new Note(1, 134*d);
      notes[239] = new Note(3, 134*d);
      notes[240] = new Note(1, 135*d);
      notes[241] = new Note(2, 135*d);
      //35th
      notes[242] = new Note(1, 136*d);
      notes[243] = new Note(3, 136*d);
      notes[244] = new Note(1, 137*d);
      notes[245] = new Note(1, 138*d);
      notes[246] = new Note(3, 138*d);
      notes[247] = new Note(1, 139*d);
      notes[248] = new Note(2, 139*d);
      //36th
      notes[249] = new Note(1, 140*d);
      notes[250] = new Note(3, 140*d);
      notes[251] = new Note(2, 141*d);
      notes[252] = new Note(4, 141*d);
      notes[253] = new Note(3, 142*d);
      notes[254] = new Note(4, 143*d);
      notes[255] = new Note(2, 143*d);
      
    } else if (songname == "Get Lucky") {
      clear = false;
      end = false;
      song = songname;

      starttime = 0;
      int e = 517;

      notes = new Note[206];
      
      //1st
      notes[0] = new Note(4, 0);
      notes[1] = new Note(3, 0);
      notes[2] = new Note(1, e);  
      notes[3] = new Note(3, e);
      notes[4] = new Note(1, 2*e);
      notes[5] = new Note(2, 3*e);
      //2nd  
      notes[6] = new Note(1, 4*e);
      notes[7] = new Note(3, 4*e);
      notes[8] = new Note(2, 5*e);
      notes[9] = new Note(3, 5*e);
      notes[10] = new Note(1, 6*e);
      notes[11] = new Note(2, 7*e);
      //3rd
      notes[12] = new Note(1, 8*e);
      notes[13] = new Note(3, 8*e);
      notes[14] = new Note(2, 9*e);
      notes[15] = new Note(3, 9*e);
      notes[16] = new Note(1, 10*e);
      notes[17] = new Note(2, 11*e);
      //4th
      notes[18] = new Note(1, 12*e);
      notes[19] = new Note(3, 12*e);
      notes[20] = new Note(2, 13*e);
      notes[21] = new Note(3, 13*e);
      notes[22] = new Note(1, 14*e);
      notes[23] = new Note(4, 15*e);
      //5th
      notes[24] = new Note(1, 16*e);
      notes[25] = new Note(3, 16*e);
      notes[26] = new Note(2, 17*e);
      notes[27] = new Note(3, 17*e);
      notes[28] = new Note(1, 18*e);
      notes[29] = new Note(2, 19*e);
      //6th
      notes[30] = new Note(1, 20*e);
      notes[31] = new Note(3, 20*e);
      notes[32] = new Note(2, 21*e);
      notes[33] = new Note(3, 21*e);
      notes[34] = new Note(1, 22*e);
      notes[35] = new Note(2, 23*e);
      //7th
      notes[36] = new Note(1, 24*e);
      notes[37] = new Note(3, 24*e);
      notes[38] = new Note(2, 25*e);
      notes[39] = new Note(3, 25*e);
      notes[40] = new Note(1, 26*e);
      notes[41] = new Note(2, 27*e);
      //8th
      notes[42] = new Note(1, 28*e);
      notes[43] = new Note(3, 28*e);
      notes[44] = new Note(2, 29*e);
      notes[45] = new Note(3, 29*e);
      notes[46] = new Note(1, 30*e);
      notes[47] = new Note(4, 31*e);

      //9th
      notes[48] = new Note(4, 32*e);
      notes[49] = new Note(3, 32*e);
      notes[50] = new Note(1, 33*e);  
      notes[51] = new Note(3, 33*e);
      notes[52] = new Note(1, 34*e);
      notes[53] = new Note(2, 35*e);
      //10th  
      notes[54] = new Note(1, 36*e);
      notes[55] = new Note(3, 36*e);
      notes[56] = new Note(2, 37*e);
      notes[57] = new Note(3, 37*e);
      notes[58] = new Note(1, 38*e);
      notes[59] = new Note(2, 39*e);
      //11th
      notes[60] = new Note(1, 40*e);
      notes[61] = new Note(3, 40*e);
      notes[62] = new Note(2, 41*e);
      notes[63] = new Note(3, 41*e);
      notes[64] = new Note(1, 42*e);
      notes[65] = new Note(2, 43*e);
      //12th
      notes[66] = new Note(1, 44*e);
      notes[67] = new Note(3, 44*e);
      notes[68] = new Note(2, 45*e);
      notes[69] = new Note(3, 45*e);
      notes[70] = new Note(1, 46*e);
      notes[71] = new Note(4, 47*e);
      //13th
      notes[72] = new Note(1, 48*e);
      notes[73] = new Note(3, 48*e);
      notes[74] = new Note(2, 49*e);
      notes[75] = new Note(3, 49*e);
      notes[76] = new Note(1, 50*e);
      notes[77] = new Note(2, 51*e);
      //14th
      notes[78] = new Note(1, 52*e);
      notes[79] = new Note(3, 52*e);
      notes[80] = new Note(2, 53*e);
      notes[81] = new Note(3, 53*e);
      notes[82] = new Note(1, 54*e);
      notes[83] = new Note(2, 55*e);
      //15th
      notes[84] = new Note(1, 56*e);
      notes[85] = new Note(3, 56*e);
      notes[86] = new Note(2, 57*e);
      notes[87] = new Note(3, 57*e);
      notes[88] = new Note(1, 58*e);
      notes[89] = new Note(2, 59*e);
      //16th
      notes[90] = new Note(1, 60*e);
      notes[91] = new Note(3, 60*e);
      notes[92] = new Note(2, 61*e);
      notes[93] = new Note(3, 61*e);
      notes[94] = new Note(1, 62*e);
      notes[95] = new Note(4, 63*e);

      //17th
      notes[96] = new Note(4, 64*e);
      notes[97] = new Note(3, 64*e);
      notes[98] = new Note(1, 65*e);  
      notes[99] = new Note(3, 65*e);
      notes[100] = new Note(1, 66*e);
      notes[101] = new Note(2, 67*e);
      //18th  
      notes[102] = new Note(1, 68*e);
      notes[103] = new Note(3, 68*e);
      notes[104] = new Note(2, 69*e);
      notes[105] = new Note(3, 69*e);
      notes[106] = new Note(1, 70*e);
      notes[107] = new Note(2, 71*e);
      //19th
      notes[106] = new Note(1, 72*e);
      notes[107] = new Note(3, 72*e);
      notes[108] = new Note(2, 73*e);
      notes[109] = new Note(3, 73*e);
      notes[110] = new Note(1, 74*e);
      notes[111] = new Note(2, 75*e);
      //20th
      notes[112] = new Note(1, 76*e);
      notes[113] = new Note(3, 76*e);
      notes[114] = new Note(2, 77*e);
      notes[115] = new Note(3, 77*e);
      notes[116] = new Note(1, 78*e);
      notes[117] = new Note(4, 79*e);
      //21th
      notes[118] = new Note(1, 80*e);
      notes[119] = new Note(3, 80*e);
      notes[120] = new Note(2, 81*e);
      notes[121] = new Note(3, 81*e);
      notes[122] = new Note(1, 82*e);
      notes[123] = new Note(2, 83*e);
      //22th
      notes[124] = new Note(1, 84*e);
      notes[125] = new Note(3, 84*e);
      notes[126] = new Note(2, 85*e);
      notes[127] = new Note(3, 85*e);
      notes[128] = new Note(1, 86*e);
      notes[129] = new Note(2, 87*e);
      //23th
      notes[130] = new Note(1, 88*e);
      notes[131] = new Note(3, 88*e);
      notes[132] = new Note(2, 89*e);
      notes[133] = new Note(3, 89*e);
      notes[134] = new Note(1, 90*e);
      notes[135] = new Note(2, 91*e);
      //24th
      notes[136] = new Note(1, 92*e);
      notes[137] = new Note(3, 92*e);
      notes[138] = new Note(2, 93*e);
      notes[139] = new Note(3, 93*e);
      notes[140] = new Note(1, 94*e);
      notes[141] = new Note(4, 95*e);

      //25th
      notes[142] = new Note(1, 96*e);
      notes[143] = new Note(3, 96*e);
      notes[144] = new Note(1, 97*e);  
      notes[145] = new Note(2, 98*e);
      notes[146] = new Note(3, 98*e);
      notes[147] = new Note(4, 99*e);
      //26th
      notes[148] = new Note(1, 100*e);
      notes[149] = new Note(3, 100*e);
      notes[150] = new Note(1, 101*e);  
      notes[151] = new Note(2, 102*e);
      notes[152] = new Note(3, 102*e);
      notes[153] = new Note(4, 103*e);
      //27th
      notes[154] = new Note(1, 104*e);
      notes[155] = new Note(3, 104*e);
      notes[156] = new Note(1, 105*e);  
      notes[157] = new Note(2, 106*e);
      notes[158] = new Note(3, 106*e);
      notes[159] = new Note(4, 107*e);
      //28th
      notes[160] = new Note(1, 108*e);
      notes[161] = new Note(3, 108*e);
      notes[162] = new Note(1, 109*e);  
      notes[163] = new Note(2, 110*e);
      notes[164] = new Note(3, 110*e);
      notes[165] = new Note(4, 111*e);
      //29th
      notes[166] = new Note(1, 112*e);
      notes[167] = new Note(3, 112*e);
      notes[168] = new Note(1, 113*e);  
      notes[169] = new Note(2, 114*e);
      notes[170] = new Note(3, 114*e);
      notes[171] = new Note(4, 115*e);
      //30th
      notes[172] = new Note(1, 116*e);
      notes[173] = new Note(3, 116*e);
      notes[174] = new Note(1, 117*e);  
      notes[175] = new Note(2, 118*e);
      notes[176] = new Note(3, 118*e);
      notes[177] = new Note(4, 119*e);
      //31th
      notes[178] = new Note(1, 120*e);
      notes[179] = new Note(3, 120*e);
      notes[180] = new Note(1, 121*e);  
      notes[181] = new Note(2, 122*e);
      notes[182] = new Note(3, 122*e);
      notes[183] = new Note(4, 123*e);
      //32th
      notes[184] = new Note(1, 124*e);
      notes[185] = new Note(3, 124*e);
      notes[186] = new Note(1, 125*e);  
      notes[187] = new Note(2, 126*e);
      notes[188] = new Note(3, 126*e);
      notes[189] = new Note(4, 127*e);

      //33th
      notes[190] = new Note(1, 128*e);
      notes[191] = new Note(2, 129*e);
      notes[192] = new Note(1, 130*e);  
      notes[193] = new Note(2, 131*e);
      //34th
      notes[194] = new Note(1, 132*e);
      notes[195] = new Note(2, 133*e);
      notes[196] = new Note(1, 134*e);  
      notes[197] = new Note(2, 135*e);
      //35th
      notes[198] = new Note(1, 136*e);
      notes[199] = new Note(2, 137*e);
      notes[200] = new Note(1, 138*e);  
      notes[201] = new Note(2, 139*e);
      //36th
      notes[202] = new Note(1, 140*e);
      notes[203] = new Note(2, 141*e);
      notes[204] = new Note(1, 142*e);  
      notes[205] = new Note(2, 143*e);
    } else if (songname == "free"){
      starttime = 0;
      notes = new Note[1];
      song = songname;
      notes[0] = new Note(1,1000000);
    } else if (songname == "song2") {//add note for song2
      starttime = 0;
      notes = new Note[3];

      notes[0] = new Note(2, 0);
      notes[1] = new Note(4, 1000);
      notes[2] = new Note(1, 2000);
      song = songname;
    } 
  }

  // create key objects
  void setupKeyboards() {
    for (int i=0; i < keys.length; i++) {
      keys[i] = new Keyboard(i+1, this.lanePos + i*this.laneGap, 420);
    }
  }

  void detectDrums() {
    int rcount = 0;
    int rsumX = 0;
    int rsumY = 0;
    int ravX = 0;
    int ravY = 0;
    int bcount = 0;
    int bsumX = 0;
    int bsumY = 0;
    int bavX = 0;
    int bavY = 0;
    for (int x = 0; x < cam.width; x += 10) {
      for (int y = 0; y < cam.height; y += 10) {
        float[] detect = new float[2];
        color pixC = cam.pixels[y*cam.width + x];

        detect[0] = red(pixC) - 0.5*green(pixC)- 0.5*blue(pixC);         
        detect[1] = blue(pixC) - 0.5*green(pixC)- 0.5*red(pixC);


        // if the color of the pixel is red enough,

        if (detect[0] > this.threshold) {
          rcount++;
          rsumX = rsumX + x;
          rsumY = rsumY + y;
        }
        if (detect[1] > this.threshold) {
          bcount++;
          bsumX = bsumX + x;
          bsumY = bsumY + y;
        }
      }
    }
    if (rcount != 0) {
      ravX = rsumX/rcount;
      ravY = rsumY/rcount;
      fill(255, 0, 0);
      ellipse(ravX, ravY, 40, 40);
    }
    if (bcount != 0) {
      bavX = bsumX/bcount;
      bavY = bsumY/bcount;
      fill(0, 0, 255);
      ellipse(bavX, bavY, 40, 40);
    }
  }

  // Game rule loops (e.g. check if notes are hit or missed)
  void ruleLoop() {
    if(song == "Don't look back in anger"){
      if(millis() - songTimer.savedTime>=100000){
        clear = true;
        
      }
    }
    else if(song == "I love you oh thank you"){
      if(millis() - songTimer.savedTime>=100000){
        clear = true;
    
      }
    }
    else if(song == "Get Lucky"){
      if(millis() - songTimer.savedTime>=80000){
        clear = true;
        
      }
    }
     if(game.clear){
      player.pause();
      player.rewind();
    }
    this.noteMissedCheckingLoop();

    this.noteHitCheckingLoop();

    if (this.hp <= 0) {
      //this.hp = 0; // not gameover
      this.hp = 0;
      player.pause();
      player.rewind();
      end = true;
      
    }
    if (this.hp >= 100) {
      this.hp = 100;
    }
  }
  void pause() {
    noLoop();
    player.pause();
  }
  void resume() {
    loop();
    player.play();
  }
  void back() {
    player.pause();
    player.rewind();
    page = 0;
    game.hp = 100;
    game.combo = 0;
  }
  // show hp gauge
  void display() {
    rectMode(CORNER);
    if(game.song != "free"){
    //hp bar
    if (hp>=60) {
      fill(0, 255, 0);
    } else if (hp>=30) {
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(600, 50, 20, 2*100);
    fill(255);
    rect(600, 50, 20, 2*(100 - this.hp));
    }
    noStroke();
    fill(204, 147, 76);
    rect(0, keys[0].ypos-keys[0].imagesize/2-20, width, notes[0].radius/2);
    //fill(255);
    //text(hp, 200, 250); // hp debugging
    if (combo != 0) {
      fill(0, 255, 0);
      textSize(30);
      text("COMBO "+combo, 285, 250);
    }
    if(end){
      image(gameover,0,0,width,height);
    }
    if(clear){
      image(stageclear,0,0,width,height);
    }
  }


  void noteMissedCheckingLoop() {

    for (int i=0; i < notes.length; i++) {

      // if the note passes bottom of the screen:
      if (notes[i].ypos >= height-50) {

        // hp decreases
        this.hp -= 5;
        combo = 0;
        // reset the note and drop it again (## for debugging)
        // notes[i].ypos = -100;

        // notes disappear when missed (## this code is temporarily deactivated)

        notes[i].invisible = true;
        notes[i].ypos = -100; 
        notes[i].speed = 0;


        // hp cannot be negative number
      }
    }
  }


  void noteHitCheckingLoop() {

    // #####

    // note hit check
    for (int i=0; i < keys.length; i++) {
      for (int j=0; j < notes.length; j++) {

        // (not necessary. just for safety)
        if (keys[i].lane != notes[j].lane) {
          continue;
        }

        int tmpAccu = this.intersectedAccuracy(keys[i], notes[j]);

        if (tmpAccu >= 1) {

          if (keys[i].over) {
            //notes[j].ypos = -100; // ### for debugging
            combo++;
            if (combo!=0) {
              if (combo%3==0) {
                hp+=5;
              }
            }
            // notes disappear when correctly hit (## this code is temporarily deactivated)

            notes[j].invisible = true;
            notes[j].ypos = -100; 
            notes[j].speed = 0;


            keys[i].flash(tmpAccu);
          }
        }
      }
    }
  }


  int intersectedAccuracy(Keyboard _key, Note _note) {

    if (_key.lane != _note.lane) {
      return 0;
    }

    //int tempDist = abs(_key.ypos - _note.ypos);
    int tempDist = abs((keys[0].ypos-keys[0].imagesize/2-20) - _note.ypos);//judge from line and note
    if (tempDist > 25) {
      return 0;
    } else if (tempDist > 15) {
      return 1;
    } else if (tempDist > 8) {
      return 2;
    } else {
      return 3;
    }
  }
}
