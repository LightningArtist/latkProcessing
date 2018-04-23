import peasy.*;

PeasyCam cam;
Latk latk;

void setup() {
  size(800, 600, P3D);
  latk = new Latk("jellyfish.json");  
  bloomSetup();
  cam = new PeasyCam(this, 100);
}

void draw() {
  background(0);
  
  bloomMatrixStart();
  
  tex.beginDraw();
  tex.setMatrix(getMatrix());
  tex.background(0);
  latk.run(tex);
  tex.endDraw();
  
  bloomMatrixEnd();
  
  surface.setTitle(""+frameRate);
}
