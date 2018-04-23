class Latk {
  
  JSONObject json;
  JSONObject jsonGp;
  JSONObject jsonLayer;
  JSONObject jsonFrame;
  JSONObject jsonStroke;
  JSONObject jsonPoint;
  
  ArrayList<LatkLayer> layers = new ArrayList<LatkLayer>();

  String jsonFilename = "layer_test";
  float globalScale = 200;
  int startTime = 0; 
  int lastMillis = 0;
  int timeInterval = 0;
  float fps = 12.0;
  int fpsInterval = int((1.0/fps) * 1000.0);
  
  Latk(String jsonFilename) {
    json = loadJSONObject(jsonFilename);
    
    for (int h=0; h<json.getJSONArray("grease_pencil").size(); h++) {
      jsonGp = (JSONObject) json.getJSONArray("grease_pencil").get(h);
      
      for (int i=0; i<jsonGp.getJSONArray("layers").size(); i++) {
        layers.add(new LatkLayer());
        
        jsonLayer = (JSONObject) jsonGp.getJSONArray("layers").get(i);
        for (int j=0; j<jsonLayer.getJSONArray("frames").size(); j++) {
          layers.get(layers.size()-1).frames.add(new LatkFrame());

          jsonFrame = (JSONObject) jsonLayer.getJSONArray("frames").get(j);
          for (int l=0; l<jsonFrame.getJSONArray("strokes").size(); l++) {
            jsonStroke = (JSONObject) jsonFrame.getJSONArray("strokes").get(l);
            
            int r = int(255.0 * jsonStroke.getJSONArray("color").getFloat(0));
            int g = int(255.0 * jsonStroke.getJSONArray("color").getFloat(1));
            int b = int(255.0 * jsonStroke.getJSONArray("color").getFloat(2));
            color col = color(r,g,b);
            
            ArrayList<PVector> pts = new ArrayList<PVector>();
            for (int m=0; m<jsonStroke.getJSONArray("points").size(); m++) {
              jsonPoint = (JSONObject) jsonStroke.getJSONArray("points").get(m);
              PVector p = new PVector(jsonPoint.getJSONArray("co").getFloat(0), jsonPoint.getJSONArray("co").getFloat(1), jsonPoint.getJSONArray("co").getFloat(2));
              pts.add(p);
            }
            
            LatkStroke st = new LatkStroke(pts, col, globalScale);
            layers.get(layers.size()-1).frames.get(layers.get(layers.size()-1).frames.size()-1).strokes.add(st);
          }
        }
      }
    }
    startTime = millis();
    println("Latk strokes loaded.");
  }
  
  void run() {
    boolean advanceFrame = false;
    timeInterval += millis() - lastMillis;
    if (timeInterval > fpsInterval) {
      advanceFrame = true;
      timeInterval = 0;
    }
    println(fpsInterval + " " + timeInterval);
    
    for (int i=0; i<layers.size(); i++) {
      LatkLayer layer = layers.get(i);
      if (advanceFrame) layer.nextFrame();
      layer.run();
    }
      
    lastMillis = millis();
  }
  
  String write() {
    ArrayList<String> returns = new ArrayList<String>();
    //
    return String.join("\n", returns.toArray(new String[returns.size()]));
  } 

}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkLayer {
  ArrayList<LatkFrame> frames = new ArrayList<LatkFrame>();
  int currentFrame = 0;
  
  LatkLayer() { }
  
  void run() {
    frames.get(currentFrame).run();
  }
  
  void nextFrame() {
    currentFrame++;
    if (currentFrame > frames.size()-1) currentFrame = 0;
  }
  
  String write() {
    ArrayList<String> returns = new ArrayList<String>();
    //
    return String.join("\n", returns.toArray(new String[returns.size()]));
  } 
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkFrame {
  ArrayList<LatkStroke> strokes = new ArrayList<LatkStroke>();
  
  LatkFrame() { }
  
  void run() {
    for (int i=0; i<strokes.size(); i++) {
      strokes.get(i).run();
    }
  }
  
  String write() {
    ArrayList<String> returns = new ArrayList<String>();
    //
    return String.join("\n", returns.toArray(new String[returns.size()]));
  } 
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkStroke {
  
  PShape s;
  ArrayList<PVector> p;
  color c = color(255);
  float scaler = 1.0;
    
  LatkStroke(ArrayList<PVector> _p, color _c) {
    init(_p, _c);
  }
  
  LatkStroke(ArrayList<PVector> _p, color _c, float _scaler) {
    scaler = _scaler;
    init(_p, _c);
  }
  
  void init(ArrayList<PVector> _p, color _c) {
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(_c);
    s.strokeWeight(2);
    for (int i=0; i<_p.size(); i++) {
      PVector pt = _p.get(i).mult(scaler);
      //s.vertex((width/2) + p[i].z, (height/2) + -p[i].y, ((width + height) / 4) + p[i].x);
      s.vertex(pt.z, -pt.y, pt.x);
    }
    s.endShape();
    
    p = getPoints();
    c = getColor();
  }

  void run() {
    shape(s);
  }
  
  color getColor() {
    c = s.getStroke(0);
    return c;
  }
  
  void setColor(color _c) {
    // TODO
  }
  
  ArrayList<PVector> getPoints() {
    ArrayList<PVector> pts = new ArrayList<PVector>();
    for (int i=0; i<s.getVertexCount(); i++) {
      pts.add(s.getVertex(i));
    }
    p = pts;
    return p;
  }
  
  void setPoints(ArrayList<PVector> _p) {
    // TODO
  }
  
  String write() {
    ArrayList<String> returns = new ArrayList<String>();
    // TODO
    return String.join("\n", returns.toArray(new String[returns.size()]));
  }  
  
}
