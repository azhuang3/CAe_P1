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
    
  
  int numColors = 4;
  
  float j = i%(float(n)/numColors) / (float(n)/numColors);
  color[] ramp = new color[5];
  ramp[0] = campfireBlue;
  ramp[1] = campfireWhite;
  ramp[2] = campfireOrange;
  ramp[3] = campfireRed;
  ramp[4] = campfireBrown;
  

  
  if (i < float(n)/numColors) {
    return LABramp(redC(ramp[0]), greenC(ramp[0]), blueC(ramp[0]), redC(ramp[1]), greenC(ramp[1]), blueC(ramp[1]), j);
  } else if (i < 2*float(n)/numColors){
    return LABramp(redC(ramp[1]), greenC(ramp[1]), blueC(ramp[1]), redC(ramp[2]), greenC(ramp[2]), blueC(ramp[2]), j);  
  } else if (i < 3*float(n)/numColors){
    return LABramp(redC(ramp[2]), greenC(ramp[2]), blueC(ramp[2]), redC(ramp[3]), greenC(ramp[3]), blueC(ramp[3]), j);  
  } else {
    return LABramp(redC(ramp[3]), greenC(ramp[3]), blueC(ramp[3]), redC(ramp[4]), greenC(ramp[4]), blueC(ramp[4]), j);
  }
  
}