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
  pointCloud.sortByDistance();
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
  
  strokeWeight(0.004);
  
  for(int i=1; i<pointCloud.points.size(); i++) {
    RgbPoint rp1 = pointCloud.points.get(i-1);
    RgbPoint rp2 = pointCloud.points.get(i);
    PVector avg = rp1.xyz.add(rp2.xyz).mult(0.5);
    stroke(rp2.c, 200);
    line(rp1.xyz.x, rp1.xyz.y, rp1.xyz.z, avg.x, avg.y, avg.z);
    line(avg.x, avg.y, avg.z, rp2.xyz.x, rp2.xyz.y, rp2.xyz.z);
  }
  
  popMatrix();

  //latk.run();

  surface.setTitle(""+frameRate);
}
