
//**************************** global variables ****************************
int n=20; float n_float=20; // number of disks shown, float is used to provide smooth mouse-drag edit of n
// color variables are defined in the "utilities" tab and set in "defineColors" during initialization

// Skate dancer on moving terrain
float dz=0; // distance to camera. Manipulated with wheel or when 
float rx=-0.06*TWO_PI, ry=0.32*TWO_PI;    // view angles manipulated when space pressed but not mouse
Boolean twistFree=false, animating=true, tracking=false, center=true, gouraud=true, showControlPolygon=false, showNormals=false;
float t=0, s=0;
pt F = P(150,150,150);  // focus point:  the camera is looking at it (moved when 'f or 'F' are pressed
pt Of=P(100,100,0), Ob=P(110,110,0); // red point controlled by the user via mouseDrag : used for inserting vertices ...
pt Vf=P(0,0,0), Vb=P(0,0,0);

int R0=250, G0=245, B0=20, R1=17, G1=60, B1=242, k=30;
pt Black=P(0,0,0), Red=P(300, 0, 0), Blue=P(0, 300, 0), Green=P(0, 0, 300), Magenta=P(300, 300, 0), Yellow=P(300, 0, 300), Cyan=P(0, 300, 300), White=P(300, 300, 300);
String mode = "rgb";
color[] colors; pt[] points; pt[] proy; float[] dis; float[] ang;
boolean analysis=false, showLayer=false;
Layer layer;

void setup() {
  size(600, 600);            // canvas size
  myFace = loadImage("data/pic.jpg");  // load image from file pic.jpg in folder data *** replace that file with your pic of your own face
  defineMyColors(); // sets HSB color mode and THEN defines values for color variables 
  
  //myFace = loadImage("data/pic.jpg");  // load image from file pic.jpg in folder data *** replace that file with your pic of your own face
  //myFace1 = loadImage("data/pic1.jpg");  // load image from file pic.jpg in folder data *** replace that file with your pic of your own face
  //layer = new Layer(50, 10);
  //textureMode(NORMAL);          
  //size(650, 650, P3D); // p3D means that we will do 3D graphics
  //smooth();
  }

void draw() {
    background(white); // clear screen and paints white background
  //pen(black,3); // sets stroke color (to balck) and width (to 3 pixels)
  noStroke();
  color left = color(0, 255, 255);
  color right = color(255, 0, 0); 
  float r=width/(n+3); // radius of disks initialized to fill width of screen
  if(keyPressed && key=='r') { // if a key is pressed and the last key action was to press 'r'
    println("r pressed");
    pushMatrix();
      translate(r,height/2);
      for(int j=0; j<4; j++) { // shows 4 rows
        ramp.setTo(left, right); // sets a different ramp
        color[] map = ramp.colorLabMap(n);
        pushMatrix(); // save previous frame to avoid residual translation
          for(int i=0; i<n; i++) { // paints row of disks
            translate(r,0); // translate local frame to the right by r
            fill(map[i]); // set color using color i in a ramp of n colors 
            showDisk(0,0,r-2); // shows disk of radius r-2 at origin of local frame
            } 
        popMatrix(); // restores saved frame, canceling all translations to the right
        //translate(0,r*2);
        }
    popMatrix();
    }
  else { // SHOW SPIRAL 
  
  
      // shows mouse location or whether mouse is pressed an d which key is pressed                 *** delete these 3 lines
      if (mousePressed) {fill(white); stroke(red); showDisk(mouseX,mouseY-4,12);}
      if (keyPressed) {fill(black); text(str(key),mouseX-2,mouseY);}
      if (!mousePressed && !keyPressed) scribeMouseCoordinates();

      //****************************** add your code here to display the two spirals ***************
  
  
  
      //************ submit your code (above) on paper (with your name and screen snap shot with your face) at the beginning of lecture on due date
    }

  // if(scribeText) displayTextImage();
  
  
  //background(255);
  //pushMatrix();   // to ensure that we can restore the standard view before writing on the canvas
  //  camera();       // sets a standard perspective
  //  translate(width/2,height/2,dz); // puts origin of model at screen center and moves forward/away by dz
  //  lights();  // turns on view-dependent lighting
  //  rotateX(rx); rotateY(ry); // rotates the model around the new origin (center of screen)
  //  rotateX(PI/2); // rotates frame around X to make X and Y basis vectors parallel to the floor
  //  if(center) translate(-F.x,-F.y,-F.z);
  //  noStroke(); // if you use stroke, the weight (width) of it will be scaled with you scaleing factor
  //  // I, J, K could be used to make the 3D gui more intuitive when adjusting the colors c1 and c2
  //  computeProjectedVectors(); // computes screen projections I, J, K of basis vectors (see bottom of pv3D): used for dragging in viewer's frame    

  //// draw color cube edges and diagonal
  //int edgeR = 3;
  //// draw corners
  //showColor(black, 10);
  //showColor(red, 10);
  //showColor(blue, 10);
  //showColor(green, 10);
  //showColor(cyan, 10);
  //showColor(magenta, 10);
  //showColor(yellow, 10);
  //showColor(white, 10);
 
  //// draw edges
  //cylinder(black, white);
  //cylinder(black, red);
  //cylinder(black, blue);
  //cylinder(black, green);
  //cylinder(green, yellow);
  //cylinder(green, cyan);
  //cylinder(red, yellow);
  //cylinder(red, magenta);
  //cylinder(blue, cyan);
  //cylinder(blue, magenta);
  //cylinder(white, magenta);
  //cylinder(white, yellow);
  //cylinder(white, cyan);


  //// draw the 2 user-controlled colors
  //color c0 = color(R0,G0,B0), c1 = color(R1,G1,B1);
  //showColor(c0,7); showColor(c1,7); 
  
  //// draw ramps between them
  //drawRGBRamp(c0,c1); // straight line ramp in RGB shown as balls
  //drawLabRamp(c0,c1); // straight line ramp in Lab shown as curved in RGB
  
   
  
  //strokeWeight(1); noStroke();
  //fill(cyan); 
   
  //popMatrix(); // done with 3D drawing. Restore front view for writing text on canvas

  //    // for demos: shows the mouse and the key pressed (but it may be hidden by the 3D model)
  //   //  if(keyPressed) {stroke(red); fill(white); ellipse(mouseX,mouseY,26,26); fill(red); text(key,mouseX-5,mouseY+4);}

  
  //fill(black);
  
  //double[] lab0 = RGBtoLAB(R0,G0,B0), lab1 = RGBtoLAB(R1,G1,B1);

  //if (scribeText) scribe(String.format("Mode: %s   k: %d   L: %d\nColor0: RGB(%3d,%3d,%3d) Lab(%3.2f,%3.2f,%3.2f)\nColor1: RGB(%3d,%3d,%3d) Lab(%3.2f,%3.2f,%3.2f)",
  //                                  mode.toUpperCase(),k,layer.l,R0,G0,B0,lab0[0],lab0[1],lab0[2],R1,G1,B1,lab1[0],lab1[1],lab1[2]), 10, 50);
  //if(scribeText) {displayHeader();} // dispalys header on canvas, including my face
  //if(scribeText && !filming) displayFooter(); // shows menu at bottom, only if not filming
  //if (animating) { t+=PI/180/2; if(t>=TWO_PI) t=0; s=(cos(t)+1.)/2; } // periodic change of time 
////  if(filming && (animating || change)) saveFrame("FRAMES/F"+nf(frameCounter++,4)+".tif");  // save next frame to make a movie
  //if(filming && (animating || change)) saveFrame("FRAMES/F"+nf(frameCounter++,4)+".png");  // save next frame to make a movie
  //change=false; // to avoid capturing frames when nothing happens (change is set uppn action)
  
  }
  
//void keyPressed() {
//  if(key=='1') mode="rgb";
//  if(key=='2') mode="xyz";
//  if(key=='3') mode="lab";
//  if(key=='4') mode="lch";
//  if(key=='1' || key=='2' || key=='3' || key=='4') layer.calculate();
//  if(key=='?') scribeText=!scribeText;
//  if(key=='`') snapPicture();
//  if(key=='+') if(!showLayer) k+=1; else {layer.l=max(0,min(100,layer.l+1)); layer.calculate();}
//  if(key=='-') if(!showLayer) k=max(2,k-1); else {layer.l=max(0,min(100,layer.l-1)); layer.calculate();}
//  if(key=='#') exit();    
//  change=true;
//  }

//void mouseWheel(MouseEvent event) {dz -= event.getAmount(); change=true;}

void mousePressed() {
   if (!keyPressed) picking=true;
  }
  
void mouseMoved() {
  if (keyPressed && key==' ') {rx-=PI*(mouseY-pmouseY)/height; ry+=PI*(mouseX-pmouseX)/width;};
  if (keyPressed && key=='s') dz+=(float)(mouseY-pmouseY); // approach view (same as wheel)
  if (keyPressed && key=='r') R0=max(0,min(255,R0+pmouseY-mouseY)); // change red of color 0
  if (keyPressed && key=='g') G0=max(0,min(255,G0+pmouseY-mouseY)); // change green of color 0
  if (keyPressed && key=='b') B0=max(0,min(255,B0+pmouseY-mouseY)); // change blue of color 0
  if (keyPressed && key=='R') R1=max(0,min(255,R1+pmouseY-mouseY)); // change red of color 1
  if (keyPressed && key=='G') G1=max(0,min(255,G1+pmouseY-mouseY)); // change green of color 1
  if (keyPressed && key=='B') B1=max(0,min(255,B1+pmouseY-mouseY)); // change blue of color 1
  }
  
void mouseDragged() {
  if (!keyPressed) {rx-=PI*(mouseY-pmouseY)/height; ry+=PI*(mouseX-pmouseX)/width;};
  }

// **** Header, footer, help text on canvas
void displayHeader() { // Displays title and authors face on screen
    scribeHeader(title,0); scribeHeaderRight(name); 
    // fill(white); image(myFace, width-myFace.width/2-80,25,myFace.width/2,myFace.height/2); image(myFace1, width-myFace1.width/2,25,myFace1.width/2,myFace1.height/2); 
    }
void displayFooter() { // Displays help text at the bottom
    scribeFooter(guide,1); 
    scribeFooter(menu,0); 
    }

String title ="2015: RGB and Lab color LERPS as ramps in RGB Cube", name ="Jarek Rossignac | Paco Hobi",
       menu="?:help, `:picture, space:rotate, s/wheel:zoom, #:quit",
       guide="press r/R:red, g/G:green, b/B:blue & drag to edit c0/c1"; // user's guide