import peasy.PeasyCam;

PeasyCam cam;

MeshObj obj;
Latk latk;
RgbPointCloud pointCloud;

void setup() {
  size(1280, 720, P3D);
  cam = new PeasyCam(this, 400);
  
  latk = new Latk();
  obj = new MeshObj(loadShape("battle_pod_remesh.obj"));
  pointCloud = new RgbPointCloud(obj);
  pointCloud.sortByDistance();
  ArrayList<PVector> points = new ArrayList<PVector>();
  
  PVector lastPoint = new PVector(-9999, 9999, -9999);
  
  for(int i=1; i<pointCloud.points.size(); i++) {
    RgbPoint rp1 = pointCloud.points.get(i-1);
    RgbPoint rp2 = pointCloud.points.get(i);
    stroke(rp2.c, 200);

    float maxDist = 0.2;
    float getDist = PVector.dist(rp1.xyz, rp2.xyz);
    println(getDist);
    if (getDist < maxDist && rp1.xyz != lastPoint) {
      points.add(new PVector(rp1.xyz.x, rp1.xyz.y, rp1.xyz.z));  
      lastPoint = new PVector(rp1.xyz.x, rp1.xyz.y, rp1.xyz.z);
    } else {
      LatkStroke s = new LatkStroke(points, color(255));
      latk.layers.get(0).frames.get(0).strokes.add(s);
      points = new ArrayList<PVector>();
    }
  }
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
