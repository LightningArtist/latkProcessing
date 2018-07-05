import peasy.PeasyCam;

PeasyCam cam;

MeshObj obj;
Latk latk;
RgbPointCloud pointCloud;

void setup() {
  size(1280, 720, P3D);
  cam = new PeasyCam(this, 400);
  
  latk = new Latk();
  obj = new MeshObj(loadShape("battle_pod_tri.obj"));
  pointCloud = new RgbPointCloud(obj);
}

void draw() {
  background(0);
  lights();
  
  pushMatrix();
  translate(width/2, height/2, -500);
  scale(1000, 1000, 1000);
  rotateX(radians(180));
  rotateY(radians(90));
  
  //obj.draw();
  pointCloud.draw();
  
  popMatrix();

  //latk.run();

  surface.setTitle(""+frameRate);
}
