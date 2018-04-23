import peasy.PeasyCam;

PeasyCam cam;
Latk jellyfish;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 400);
  jellyfish = new Latk("jellyfish.json");  
}

void draw() {
  background(0);
  jellyfish.run();

  surface.setTitle(""+frameRate);
}
