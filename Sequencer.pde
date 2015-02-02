void setup()
{
  size(500, 500);
  points.add(new PVector(width * 0.25f, height * 0.25f));
  points.add(new PVector(width * 0.75f, height * 0.25f));
  points.add(new PVector(width * 0.25f, height * 0.75f));
  points.add(new PVector(width * 0.75f, height * 0.75f));
  
  Rhythm r = new Rhythm(width  * 0.5, height * 0.5f, width / 2);  
  rhythms.add(r);
  addRhythms(r);
  current = r;
}

ArrayList<Rhythm> rhythms = new ArrayList<Rhythm>();
ArrayList<PVector> points = new ArrayList<PVector>();

float toPass = 0.5f;
float ellapsed = toPass;
boolean flip = false;
Rhythm current;

void addRhythms(Rhythm r)
{  
  r.addBeat(2);
  r.addBeat(2);
  }

void draw()
{
  background(0);
  for(Rhythm r:rhythms)
  {
    r.display();
  }
}

void keyPressed()
{
  Rhythm current;
  current = rhythms.get(rhythms.size() - 1);
  current.randomColour();
}

void mousePressed()
{  
  int nextPosition = rhythms.size() - 1;
  Rhythm last = rhythms.get(nextPosition);
  last.radius = width * 0.25;
  last.center = points.get(nextPosition).get();
  nextPosition ++;
  PVector point = points.get(nextPosition).get();
  Rhythm r = new Rhythm(point.x, point.y, last.radius);  
  addRhythms(r);
  rhythms.add(r);  
}
