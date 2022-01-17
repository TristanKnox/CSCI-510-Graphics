int xOffset = 500;
int yOffset = 0;
int base = 500;
int width = 1000;
int height = 500;

class Point{
  int x;
  int y;
  public Point(int x, int y){
   this.x = x;
   this.y = y;
  }
}

class Triangle{
 Point p1;
 Point p2;
 Point p3;
 public Triangle(Point p1, Point p2, Point p3){
   this.p1 = p1;
   this.p2 = p2;
   this.p3 = p3;
 }
}

Point[] t = new Point[]{
  new Point(20,100),
  new Point(220,100),
  new Point(220,140),
  new Point(140,140),
  new Point(140,400),
  new Point(100,400),
  new Point(100,140),
  new Point(20,140)
};

Point[] k = new Point[]{
  new Point(280,100),
  new Point(320,100),
  new Point(320,220),
  new Point(440,100),
  new Point(480,100),
  new Point(340,240),
  new Point(480,400),
  new Point(440,400),
  new Point(320,260),
  new Point(320,400),
  new Point(280,400)
};

Triangle[] triangles = new Triangle[]{
  //Botom
  new Triangle(new Point(0,400), new Point(500,500), new Point(0,500)),
  new Triangle(new Point(0,400), new Point(500,400), new Point(500,500)),
  //Top
  new Triangle(new Point(0,0), new Point(500,100), new Point(0,100)),
  new Triangle(new Point(0,0), new Point(500,0), new Point(500,100)),
  //Under T Left
  new Triangle(new Point(0,140), new Point(100,400), new Point(0,400)),
  new Triangle(new Point(0,140), new Point(100,140), new Point(100,400)),
  //Left T
  new Triangle(new Point(0,100), new Point(20,140), new Point(0,140)),
  new Triangle(new Point(0,100), new Point(20,100), new Point(20,140)),
  //Under T Left
  new Triangle(new Point(140,140), new Point(220,400), new Point(140,400)),
  new Triangle(new Point(140,140), new Point(220,140), new Point(220,400)),
  //Between T and K
  new Triangle(new Point(220,100), new Point(280,400), new Point(220,4000)),
  new Triangle(new Point(220,100), new Point(280,100), new Point(280,400)),
  //Right of K
  new Triangle(new Point(480,100), new Point(500,400), new Point(480,400)),
  new Triangle(new Point(480,100), new Point(500,100), new Point(500,400)),
  //Top K triangle
  new Triangle(new Point(320,100), new Point(440,100), new Point(320,220)),
  //Right K triangle
  new Triangle(new Point(480,100), new Point(480,400), new Point(340,240)),
  //Bottom K triangle
  new Triangle(new Point(320,260), new Point(440,400), new Point(320,400)),
};

void drawLines(Point[] points){
  for( int i = 0; i < points.length; i++){
   Point p1 = points[i];
   Point p2 = points[0];
   if(i != points.length - 1)
     p2 = points[i+1];
   line(p1.x, p1.y, p2.x, p2.y);
  }
}

void drawNameWithLines ()
{
  // insert your code here to draw the letters of your name 
  // using only lines()
  //line(p.x,p.y,220,100);
  //line(220,100,220,140);
  //line(220,140,140,140);
  //line(140,140,140,400);
  //line(140,400,100,400);
  //line(100,400,100,140);
  //line(100,140,20,140);
  //line(20,140,20,100);
  drawLines(t);
  drawLines(k);
}

void drawNameWithTriangles ()
{
  // insert your code here to draw the letters of your name 
  // using only ltriangles()
  //triangle (34, 45, 100, 100, 12, 255);
  for(int i = 0; i < triangles.length; i++){
    Point p1 = triangles[i].p1;
    Point p2 = triangles[i].p2;
    Point p3 = triangles[i].p3;
    triangle(
      p1.x + xOffset, 
      p1.y + yOffset, 
      p2.x + xOffset, 
      p2.y + yOffset, 
      p3.x + xOffset, 
      p3.y + yOffset
    );
  }
}

// --------------------------------------------------------------------------------------------
//
//  Do not edit below this lne
//
// --------------------------------------------------------------------------------------------

boolean doLine = false;
boolean doTri = false;
color backgroundColor = color (150, 150, 150);
color lineColor = color (0, 0, 0);
color fillColor = color (255, 0, 0);

void setup () 
{
  size (1000, 500);
  background (backgroundColor);
}

void draw ()
{
  if (doLine) stroke(lineColor); else stroke (backgroundColor);
  drawNameWithLines();
  
  if (doTri) {
     fill(fillColor);
     stroke(fillColor);
  }
  else {
    fill(backgroundColor);
    stroke(backgroundColor);
  }
  drawNameWithTriangles();
}

void keyPressed()
{
  if (key == 'l') {doLine = !doLine;}
  if (key == 't') {doTri = !doTri;}
  if (key == 'q') exit();
}
