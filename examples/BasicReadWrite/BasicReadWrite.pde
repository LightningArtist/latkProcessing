import peasy.PeasyCam;
import latkProcessing.*;

PeasyCam cam;
Latk latk;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 100);
  latk = new Latk(this, "latk_logo.latk");  
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), cameraZ/100.0, cameraZ*100.0);
}

void draw() {
  background(0);
  
  latk.run();
  
  surface.setTitle(""+frameRate);
}
