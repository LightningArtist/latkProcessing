class Latk {
  
  JSONObject json;
  JSONObject jsonGp;
  JSONObject jsonLayer;
  JSONObject jsonFrame;
  JSONObject jsonStroke;
  JSONObject jsonPoint;
  
  String jsonFilename = "layer_test";
  float globalScale = 500;
  boolean showStrokes = true;
  ArrayList<LatkStroke> tempStrokes = new ArrayList<LatkStroke>();
  LatkStroke[] strokes;
  int strokeCounter = 0;
  
  Latk(String jsonFilename) {
    json = loadJSONObject(jsonFilename);
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
            ArrayList<PVector> tempPoints = new ArrayList<PVector>();
            for (int m=0; m<jsonStroke.getJSONArray("points").size(); m++) {
              jsonPoint = (JSONObject) jsonStroke.getJSONArray("points").get(m);
              PVector p = new PVector(jsonPoint.getJSONArray("co").getFloat(0), jsonPoint.getJSONArray("co").getFloat(1), jsonPoint.getJSONArray("co").getFloat(2));
              tempPoints.add(p);
            }
            LatkStroke s = new LatkStroke(tempPoints.toArray(new PVector[tempPoints.size()]), c, globalScale);
            tempStrokes.add(s);
          }
        }
      }
    }
    strokes = tempStrokes.toArray(new LatkStroke[tempStrokes.size()]);
    println("Latk strokes loaded.");
  }
  
  void run() {
    if (showStrokes) {
      for (int i=0; i<strokes.length; i++) {
        strokes[i].run();
      }
    }
  }

}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkLayer {
  LatkFrame[] frames;
  
  LatkLayer() { }
  
  void run() {
    for (int i=0; i<frames.length; i++) {
      frames[i].run();
    }
  }
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkFrame {
  LatkStroke[] strokes;
  
  LatkFrame() { }
  
  void run() {
    for (int i=0; i<strokes.length; i++) {
      strokes[i].run();
    }
  }
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkStroke {
  
  PShape s;
  PVector[] p;
  color c;
  float scaler = 1.0;
    
  LatkStroke(PVector[] p, color c) {
    init(p, c);
  }
  
  LatkStroke(PVector[] p, color c, float _scaler) {
    scaler = _scaler;
    init(p, c);
  }
  
  void init(PVector[] p, color c) {
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(c);
    s.strokeWeight(2);
    for (int i=0; i<p.length; i++) {
      p[i].mult(scaler);
      s.vertex((width/2) + p[i].z, (height/2) + -p[i].y, ((width + height) / 4) + p[i].x);
    }
    s.endShape();
    
    p = getPoints();
    c = getColor();
  }

  void update() {
    //
  }
  
  void draw() {
    shape(s);
  }
  
  void run() {
    draw();
  }
  
  color getColor() {
    c = s.getStroke(0);
    return c;
  }
  
  PVector[] getPoints() {
    /*
    ArrayList<PVector> p = new ArrayList<PVector>();
    for (int i=0; i<s.getVertexCount(); i++) {
      p.add(s.getVertex(i));
    }
    return p.toArray(new PVector[p.size()]);
    */
    PVector[] pp = new PVector[s.getVertexCount()];
    for (int i=0; i<pp.length; i++) {
      pp[i] = s.getVertex(i);
    }
    p = pp;
    return p;
  }
  
}
