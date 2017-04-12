import processing.opengl.*;
import java.awt.event.*;
import peasy.*;

JSONObject json;
JSONObject jsonGp;
JSONObject jsonLayer;
JSONObject jsonFrame;
JSONObject jsonStroke;
JSONObject jsonPoint;
String jsonFilename = "layer_test";
float globalScale = 1000;

PeasyCam cam;
int sW = 64;
int sH = 64;
int sD = 64;
int scaleFactor=10;
int dW = 1920;
int dH = 1080;
int fps = 60;
PVector offsetOrig = new PVector(0, 0, -1 * 20 * scaleFactor);
PVector offset = offsetOrig;
PVector loc = new PVector(0, 0, 0);
float offsetDelta = 10;
float drawOdds = 0.001;
boolean triggered=false;

Voxel[][][] voxel;

ArrayList tempStrokes = new ArrayList();

void setup() {
  size(50,50,P3D);
  Settings settings = new Settings("settings.txt");
  voxel = new Voxel[sW][sH][sD];
  surface.setSize(sW*scaleFactor, sH*scaleFactor);
  json = loadJSONObject(jsonFilename + ".json");
  for (int h=0; h<json.getJSONArray("grease_pencil").size(); h++) {
    jsonGp = (JSONObject) json.getJSONArray("grease_pencil").get(h);
    for (int i=0; i<jsonGp.getJSONArray("layers").size(); i++) {
      jsonLayer = (JSONObject) jsonGp.getJSONArray("layers").get(i);
      for (int j=0; j<jsonLayer.getJSONArray("frames").size(); j++) {
        jsonFrame = (JSONObject) jsonLayer.getJSONArray("frames").get(j);
        for (int l=0; l<jsonFrame.getJSONArray("strokes").size(); l++) {
          jsonStroke = (JSONObject) jsonFrame.getJSONArray("strokes").get(l);
          int r = int(255.0 * jsonStroke.getJSONArray("color").getFloat(0));
          int g = int(255.0 * jsonStroke.getJSONArray("color").getFloat(1));
          int b = int(255.0 * jsonStroke.getJSONArray("color").getFloat(2));
          color c = color(r,g,b);
          ArrayList tempPoints = new ArrayList();
          for (int m=0; m<jsonStroke.getJSONArray("points").size(); m++) {
            jsonPoint = (JSONObject) jsonStroke.getJSONArray("points").get(m);
            PVector p = new PVector(jsonPoint.getJSONArray("co").getFloat(0), jsonPoint.getJSONArray("co").getFloat(1), jsonPoint.getJSONArray("co").getFloat(2));
            tempPoints.add(p);
          }
          Stroke s = new Stroke(tempPoints, c);
          tempStrokes.add(s);
        }
      }
    }
  }
  

 /*
 addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
  }});
  */
  initVolume();
  noCursor();
  frameRate(fps);
  cam = new PeasyCam(this,0,0,0,50);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
}

void draw() {
  controls();
  background(0);
  for (int i=0;i<voxel.length;i++) {
    for (int j=0;j<voxel[i].length;j++) {
      for (int k=0;k<voxel[i][j].length;k++) {
        voxel[i][j][k].selectMe=false;
        voxel[i][j][k].sameZ=false;
        voxel[int(loc.x)][int(loc.y)][int(loc.z)].selectMe=true;
        voxel[i][j][int(loc.z)].sameZ=true;
        voxel[i][j][k].update();
      }
    }
  }
  //println(triggered);
  for (int i=0; i<tempStrokes.size(); i++) {
    Stroke s = (Stroke) tempStrokes.get(i);
    s.run();
  }
  
  surface.setTitle(int(frameRate) + " fps");
}

void posCheck(){
    if(loc.z>sD-1) loc.z=sD-1;
    if(loc.z<0) loc.z=0;
    if(loc.x>sW-1) loc.x=sW-1;
    if(loc.x<0) loc.x=0;
    if(loc.y>sH-1) loc.y=sH-1;
    if(loc.y<0) loc.y=0;
}

void initVolume(){
    for (int i=0;i<voxel.length;i++) {
    for (int j=0;j<voxel[i].length;j++) {
      for (int k=0;k<voxel[i][j].length;k++) {
        voxel[i][j][k] = new Voxel(i, j, k, scaleFactor);
      }
    }
  }
}