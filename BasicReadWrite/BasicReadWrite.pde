import peasy.PeasyCam;

PeasyCam cam;
Latk latk;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 100);
  latk = new Latk("jellyfish.json");  
}

void draw() {
  background(0);
  
  latk.run();
  
  surface.setTitle(""+frameRate);
}
