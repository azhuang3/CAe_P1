// ************************************************************************ MOUSE ACTIONS
void mouseDragged()
  {
  L-=(float)(mouseY-pmouseY)*100/height; // vertical mouse drag (press+move) changes L
  L=max(0,L); L=min(100,L);
  }

// ************************************************************************ KEY ACTIONS
void keyPressed()
  {
  if(key=='`') snapPic=true; // to snap an image of the canvas and save as zoomable a PDF
  if(key=='l') {showTerrain=false; showLch=!showLch;} // Show Lch matrix for current L
  if(key==' ') showTerrain=!showTerrain; // Show Lch matrix for current L
  if(key=='c') computeMyMap();
  if(key=='j') computeJareksMap();
  if(key=='p') printMap();
  if(key==',') {n=max(1,n-1); x = (float)width/(n+2);  y = (float)height/(n+2); computeMyMap(); } // decrement n (number of colors)
  if(key=='.') {n++; x = (float)width/(n+2);  y = (float)height/(n+2); computeMyMap(); }  // increment n
  if(key=='<') {p=max(1,p-1);  } // decrement n (number of colors)
  if(key=='>') {p++; }  // increment n
  }
  
  
// ************************************************************************ TOOLS FOR SAVING INDIVIDUAL IMAGES OF CANVAS WITH INCREMENTED FILE NAMES
boolean snapPic=false;
String PicturesOutputPath="data/PDFimages";
int pictureCounter=0;
void snapPicture() {saveFrame("PICTURES/P"+nf(pictureCounter++,3)+".jpg"); }