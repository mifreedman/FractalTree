private double fractionLength = .8; 
private int smallestBranch = 7; 
private double branchAngle = .3; 
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(200, 0, 255);   
  line(320,480,320,380);   
  drawBranches(320, 380, 100, -1.57, 255);  //will add later 
  line(200, 450, 205, 480);
  drawBranches(200, 450, 50, -1.8, 245);
  line(440, 450, 435, 480);
  drawBranches(440, 450, 50, -1.44, 245);
} 
public void drawBranches(int x,int y, double branchLength, double angle, float clr) 
{   
  double angleL = angle + branchAngle;
  double angleR = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  int endXL, endYL, endXR, endYR;
  endXL = (int)(branchLength*Math.cos(angleL) + x);
  endYL = (int) (branchLength*Math.sin(angleL) + y);
  endXR = (int)(branchLength*Math.cos(angleR) + x);
  endYR = (int) (branchLength*Math.sin(angleR) + y);
  stroke(clr-30, 0, clr);
  line(x, y, endXL, endYL);
  line(x, y, endXR, endYR);
  
  if (branchLength > smallestBranch) {
    drawBranches(endXL, endYL, branchLength*24/25, angleL + branchAngle, clr*0.85);
    drawBranches(endXR, endYR, branchLength*24/25, angleR - branchAngle, clr*0.85);
  }
    
} 
