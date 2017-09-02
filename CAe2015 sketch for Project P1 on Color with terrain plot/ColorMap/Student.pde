// ********** STUDENT's SOLUTION (Modify myMap)
color JareksMap(int i, int n)
  {
  int j=i; if(j%4==2) j--; else if(j%4==1) j++; 
  float h = 360.*((int)(i/4))*4/n;                         // HUE (color)
  float c = 40+60.*((float)((j)%4))/3 ;                    // Chroma (saturation)
  float l = 30+20./n*4*round(i/4)+50.*((float)((j)%4))/3;  // Lightness (luminence)
  return LCHtoColor(l*0.8,c,h);
  }


// ********** STUDENT's SOLUTION (Modify myMap)
color myMap(int i, int n)
  {
  //int j=i; if(j%4==2) j--; else if(j%4==1) j++;
  //float c = 40+60.*((float)((j+4)%4))/3 ; 
  //float l = 30+20./n*4*round(i/4)+50.*((float)((j+4)%4))/3; 
  //float h = 360.*((int)(i/4))*4/n; 
  //double[] a = LCHtoLAB(l, c, h);
  //return LABtoColor(a[0], a[1], a[2]);
  
  int numColors = 2;
  
  float j = i%(float(n)/numColors) / (float(n)/numColors);
  
  if (i < float(n)/numColors) {
    return LABramp(redC(cyan), greenC(cyan), blueC(cyan), redC(yellow), greenC(yellow), blueC(yellow), j);
  } else if (i < 2*float(n)/numColors){
    return LABramp(redC(yellow), greenC(yellow), blueC(yellow), redC(magenta), greenC(magenta), blueC(magenta), j);  
  } else {
    return LABramp(redC(yellow), greenC(yellow), blueC(yellow), redC(magenta), greenC(magenta), blueC(magenta), j);  
  }
  //}
  
  
//color myMap(int i, int n) {
  
}