//// ************************************ IMAGES & VIDEO 
//int pictureCounter=0, frameCounter=0;
//Boolean filming=false, change=false;
//PImage myFace, myFace1; // picture of author's face, should be: data/pic.jpg in sketch folder
//void snapPicture() {saveFrame("PICTURES/P"+nf(pictureCounter++,3)+".jpg"); }

//// ******************************************COLORS 
//color  // set more colors using Menu >  Tools > Color Selector
//  black=#000000, 
//  white=#FFFFFF,
//  red=#FF0000, 
//  green=#00FF00, 
//  blue=#0000FF, 
//  yellow=#FFFF00, 
//  cyan=#00FFFF, 
//  magenta=#FF00FF,
//  grey=#818181, 
//  orange=#FFA600, 
//  brown=#B46005, 
//  metal=#B5CCDE, 
//  dgreen=#157901;
//void pen(color c, float w) {stroke(c); strokeWeight(w);}

//// ******************************** TEXT , TITLE, and USER's GUIDE
//Boolean scribeText=true; // toggle for displaying of help text
//void scribe(String S, float x, float y) {fill(0); text(S,x,y); noFill();} // writes on screen at (x,y) with current fill color
//void scribeHeader(String S, int i) {fill(0); text(S,10,20+i*20); noFill();} // writes black at line i
//void scribeHeaderRight(String S) {fill(0); text(S,width-6.3*S.length(),20); noFill();} // writes black on screen top, right-aligned
//void scribeFooter(String S, int i) {fill(0); text(S,10,height-10-i*20); noFill();} // writes black on screen at line i from bottom
//void scribeAtMouse(String S) {fill(0); text(S,mouseX,mouseY); noFill();} // writes on screen near mouse
//void scribeMouseCoordinates() {fill(black); text("("+mouseX+","+mouseY+")",mouseX+7,mouseY+25); noFill();}