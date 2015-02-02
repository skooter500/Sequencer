class Rhythm
{
   float radius;
   PVector center;
   IntList list;
   float rot;
   color c;
   
   Rhythm(float x, float y, float radius)
   {

     this.radius = radius;
     center = new PVector(x, y);
     list = new IntList();   
     rot = 0;  
     randomColour();
   }
   
   void randomColour()
   {
     c = color(random(0, 255), random(0, 255), random(0, 255));
   }
   
   void addBeat(int beat)
   {
     list.append(beat);
   }
   
   void display()
   {
     pushMatrix();
     translate(center.x, center.y);
     rotate(rot);
     rot += 0.01f;
     stroke(c);
     noFill();
     ellipse(0, 0, radius * 2, radius * 2);
     int sum = 0;
     float thetaInc = TWO_PI / list.sum();
     for(int i:list)
     {
       float theta = thetaInc * sum;
       float x = sin(theta) * radius;
       float y = -cos(theta) * radius;
       ellipse(x, y, 10, 10);
       sum += i;
     } 
     popMatrix();
   }
}
