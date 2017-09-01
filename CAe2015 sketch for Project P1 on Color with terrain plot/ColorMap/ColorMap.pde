// SOURCE SKETCH FOR PROJECT 1 (COLOR) OF  FOR 2017 

import processing.pdf.*;    // to save screen shots as PDFs
PImage myFace; // picture of author's face, should be: data/pic.jpg in sketch folder
int n = 24; // Number of colors
color[] Map = new color[3*n]; // array containing proposed colors for the map
float r=10;  // darius of disk around mouse
float L=60;  // current L value in Lch space
boolean showLch=false, showTerrain=true;  // what to show
float x, y;  // rectangle sizes
int p = 256;   // resolution of terrain map
 

void setup() 
  {
  size(600, 600, P3D);  // opens canvas and selects rendering library
  //fullScreen(P3D); //Full screen
  myFace = loadImage("data/pic.jpg");  // load image from file pic.jpg in folder data (replace that file with your pic of your own face!!!)
  rectMode(CENTER);
  x = (float)width/(n+2); // dimensions of color rectangles for drawing
  y = (float)height/(n+2);
  computeJareksMap();           // compute proposed map
  }

// ************************************************************************ DRAW
void draw() 
  {  
  background(L*2.55);
  
  if(snapPic) beginRecord(PDF,PicturesOutputPath+"/P"+nf(pictureCounter++,3)+".pdf");  // *********** START PDF CAPTURE
  
  //if(showTerrain) showRampOnTerrain(0,100,20,70);
  if(showTerrain) showRampOnTerrain(0,100,20,70);
  else if(showLch)  showLch(L);   // show Lch matrix
  else           // show ramps
    {
    image(myFace, width-myFace.width/2,35,myFace.width/2,myFace.height/2); 
    showMapRGB();  // linear ramp in LGB (above)
    showMapNumbers(); // Numeric label for map values
    showMapLch();  // proposed map (below)
    }
    
  // **** computes mouse coordinates in map space to compute the proper color  
  float h =  ((float)mouseX - x*1.5)/( width-2*x)*n;
  float c =  ((float)mouseY - y*1.5)/( height-2*y)*n;
  fill(LCHtoColor(L,100./n*c,360./n*h)); myDrawDisk(mouseX,mouseY,r);
  
  fill(0,0,200); // blue color for text ** YOUR NAME AS AUTHOR!!!
  text("Rossignac's 2017 Computational Aesthetics Course @ GaTech, Project 1: Color map, Authors: Jarek Rossignac",10,20); //
  text("ACTIONS: ` to snapPicture, ,/. to edit n="+n+", c/j to recomputeMyMap/JareksMap, ' ' to toggleShowPlot, </> to editPlotTesolution p="+p+", l to toggleShowLch mouse drag to edit L="+(int)L,10,height-50); // bottom text

  if(snapPic) {endRecord(); snapPic=false;} // ************************************************************************** END PDF CAPTURE
  } // end draw()


// ************************************************************************ DISPLAY DISK (Ues to show mouse and color)
void myDrawDisk(float px, float py, float pr) 
  {
  ellipse(px,py,pr*2,pr*2);
  }


// ************************************************************************ COMPUTE, PRINT, SHOW MAPS

void computeMyMap() 
  {
  for(int i=0; i<n; i++) Map[i]=myMap(i,n); // press 'c'
  }
 
void computeJareksMap() 
  {
  for(int i=0; i<n; i++) Map[i]=JareksMap(i,n); // set at initialization
  }
 
void printMap()  // press 'p', make sure that it has been computed
  {
  for(int i=0; i<n; i++) 
    {
    float r = red(Map[i]), g = green(Map[i]), b = blue(Map[i]);
    println(nf(i,2,0)+": ("+nf(r,2,0)+","+nf(g,2,0)+","+nf(b,2,0)+")");
    }
  }
 
void showMapRGB() 
  {
  stroke(2.55*L);
  for(int i=0; i<n; i++) 
    {
    fill(color(255./n*i,255-255./n*i,2.55*L));
    rect((1.5+i)*x,height/2-y,x,y);
    }
  }
  
void showMapNumbers() 
  {
  for(int i=0; i<n; i++) 
    {
    float value=255-2.55*L;
    if(value>102.5&&value<152.5)
      {
      value+=100;
      }
    fill(value);
    stroke(value);
    text("" + n, (1.5+i)*x, height/2+y);
    }
  }
  
void showMapLch()  
  {
  stroke(2.55*L);
  for(int i=0; i<n; i++) 
    {
    fill(Map[i]);               //fill(myMap(i,n));
    rect((1.5+i)*x,height/2+2*y,x,y);
    }
  }

void showRampOnTerrain(float a, float b, float c, float d)
  {
  float sx = float(width-60)/(p+1);
  float sy = float(height-100)/(p+1);
  noStroke();
  for(int i=0; i<p; i++) 
    for(int j=0; j<p; j++)
      {
      float v = L(0,L(0,a,p,b,j),p,L(0,d,p,c,j),i); 
      int r = floor(v/100*n);
      if(0<=r && r<n) fill(Map[r]); // fill(myMap(r,n));
      rect(30+(0.5+i)*sx,30+(0.5+j)*sy,sx,sy);
      }
  }
  
// ********** LERP of values
float L(float x1, float v1, float x2, float v2, float x) { return v1 + (v2-v1)*(x-x1)/(x2-x1);}

// ************************************************************************ SHOW LCH MATRIX FOR CURRENT L
void showLch(double l) 
  {
  stroke(2.55*(100-L));
  for(int i=0; i<n; i++) 
    for(int j=0; j<n; j++)
      {
      fill(LCHtoColor(l,100./n*j,360/n*i));
      rect((1.5+i)*x,(1.5+j)*y,x,y);
      }
  }