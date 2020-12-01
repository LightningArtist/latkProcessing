import peasy.PeasyCam;
import latkProcessing.*;

PeasyCam cam;

MeshObj obj;
Latk latk;
RgbPointCloud pointCloud;

void setup() {
  size(1280, 720, P3D);
  cam = new PeasyCam(this, 400);
  
  latk = new Latk(this);
  obj = new MeshObj(loadShape("battle_pod_remesh.obj"));
  pointCloud = new RgbPointCloud(obj);
  pointCloud.sortByDistance();
  ArrayList<PVector> points = new ArrayList<PVector>();
    
  for(int i=1; i<pointCloud.points.size(); i++) {
    RgbPoint rp1 = pointCloud.points.get(i-1);
    RgbPoint rp2 = pointCloud.points.get(i);
    stroke(rp2.c, 200);

    float maxDist = 0.2;
    float getDist = PVector.dist(rp1.xyz, rp2.xyz);
    
    if (getDist < maxDist) {
      points.add(new PVector(rp1.xyz.x, rp1.xyz.y, rp1.xyz.z));  
    } else {
      ArrayList<PVector> cleanedPoints = new ArrayList<PVector>();
      cleanedPoints.add(points.get(0));
      for (int j=1; j<points.size(); j++) {
        PVector p1 = points.get(j-1);
        PVector p2 = points.get(j);
        if (PVector.dist(p1, p2) > 0.001) cleanedPoints.add(p2);
      }
      if (cleanedPoints.size() > 1) {
        LatkStroke s = new LatkStroke(this, points, color(255));
        latk.layers.get(0).frames.get(0).strokes.add(s);
      }
      points = new ArrayList<PVector>();
    }
  }
  
  latk.clean();
}

void draw() {
  background(0);
  lights();
  
  pushMatrix();
  translate(width/2, height/2, -500);
  scale(1000, 1000, 1000);
  rotateX(radians(180));
  rotateY(radians(90));
  
  strokeWeight(0.004);

  //obj.draw();
  
  //pointCloud.draw();
  
  latk.run();
  
  popMatrix();


  surface.setTitle(""+frameRate);
}
