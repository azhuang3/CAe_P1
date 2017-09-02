color  // set more colors using Menu >  Tools > Color Selector
  black=#000000, 
  white=#FFFFFF,
  red=#FF0000, 
  green=#00FF00, 
  blue=#0000FF, 
  yellow=#FFFF00, 
  cyan=#00FFFF, 
  magenta=#FF00FF,
  grey=#818181, 
  orange=#FFA600, 
  brown=#B46005, 
  metal=#B5CCDE, 
  dgreen=#157901;
  
// custom color palette
color
  campfireBlue=#588C7E,
  campfireWhite=#F2E394,
  campfireOrange=#F2AE72,
  campfireRed=#D96459,
  campfireBrown=#8C4646;
  
  
int redC(color c) {return int (c >> 16 & 0xFF); } 
int greenC(color c) {return int (c >> 8 & 0xFF); }  
int blueC(color c) {return int (c & 0xFF); } 