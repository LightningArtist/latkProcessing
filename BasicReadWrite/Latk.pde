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
  
  int currentLayer = 0;
  
  Latk() {
    layers.add(new LatkLayer());
    layers.get(layers.size()-1).frames.add(new LatkFrame());
  }
  
  Latk(ArrayList<PVector> _pts, color _c) {
    layers.add(new LatkLayer());
    layers.get(layers.size()-1).frames.add(new LatkFrame());
    
    LatkStroke st = new LatkStroke(_pts, _c);
    layers.get(layers.size()-1).frames.get(layers.get(layers.size()-1).frames.size()-1).strokes.add(st);
  }
  
  Latk(ArrayList<Latk> _latks) {
    // TODO
  }
  
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
              pts.add(p.mult(globalScale));
            }
            
            LatkStroke st = new LatkStroke(pts, col);
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
  
  void write() {
        ArrayList<String> FINAL_LAYER_LIST = new ArrayList<String>();

        for (int hh = 0; hh < layers.size(); hh++) {
            currentLayer = hh;

            ArrayList<String> sb = new ArrayList<String>();
            ArrayList<String> sbHeader = new ArrayList<String>();
            sbHeader.add("\t\t\t\t\t\"frames\":[");
            sb.add(String.join("\n", sbHeader.toArray(new String[sbHeader.size()])));

            for (int h = 0; h < layers.get(currentLayer).frames.size(); h++) {
                layers.get(currentLayer).currentFrame = h;

                ArrayList<String> sbbHeader = new ArrayList<String>();
                sbbHeader.add("\t\t\t\t\t\t{");
                sbbHeader.add("\t\t\t\t\t\t\t\"strokes\":[");
                sb.add(String.join("\n", sbbHeader.toArray(new String[sbbHeader.size()])));
                for (int i = 0; i < layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.size(); i++) {
                    ArrayList<String> sbb = new ArrayList<String>();
                    sbb.add("\t\t\t\t\t\t\t\t{");
                    color col = layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).col;
                    float r = red(col) / 255.0;
                    float g = green(col) / 255.0;
                    float b = blue(col) / 255.0;
                    sbb.add("\t\t\t\t\t\t\t\t\t\"color\":[" + r + ", " + g + ", " + b + "],");

                    if (layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.size() > 0) {
                        sbb.add("\t\t\t\t\t\t\t\t\t\"points\":[");
                        for (int j = 0; j < layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.size(); j++) {
                            PVector pt = layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.get(j);
                            pt.mult(1.0/globalScale);
                            
                            if (j == layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.size() - 1) {
                                sbb.add("\t\t\t\t\t\t\t\t\t\t{\"co\":[" + pt.x + ", " + pt.y + ", " + pt.z + "], \"pressure\":1, \"strength\":1}");
                                sbb.add("\t\t\t\t\t\t\t\t\t]");
                            } else {
                                sbb.add("\t\t\t\t\t\t\t\t\t\t{\"co\":[" + pt.x + ", " + pt.y + ", " + pt.z + "], \"pressure\":1, \"strength\":1},");
                            }
                        }
                    } else {
                        sbb.add("\t\t\t\t\t\t\t\t\t\"points\":[]");
                    }

                    if (i == layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.size() - 1) {
                        sbb.add("\t\t\t\t\t\t\t\t}");
                    } else {
                        sbb.add("\t\t\t\t\t\t\t\t},");
                    }

                    sb.add(String.join("\n", sbb.toArray(new String[sbb.size()])));
                }

                ArrayList<String> sbFooter = new ArrayList<String>();
                if (h == layers.get(currentLayer).frames.size() - 1) {
                    sbFooter.add("\t\t\t\t\t\t\t]");
                    sbFooter.add("\t\t\t\t\t\t}");
                } else {
                    sbFooter.add("\t\t\t\t\t\t\t]");
                    sbFooter.add("\t\t\t\t\t\t},");
                }
                sb.add(String.join("\n", sbFooter.toArray(new String[sbFooter.size()])));
            }

            FINAL_LAYER_LIST.add(String.join("\n", sb.toArray(new String[sb.size()])));
        }

        ArrayList<String> s = new ArrayList<String>();
        s.add("{");
        s.add("\t\"creator\": \"processing\",");
        s.add("\t\"grease_pencil\":[");
        s.add("\t\t{");
        s.add("\t\t\t\"layers\":[");

        for (int i = 0; i < layers.size(); i++) {
            currentLayer = i;

            s.add("\t\t\t\t{");
            if (layers.get(currentLayer).name != null && layers.get(currentLayer).name != "") {
                s.add("\t\t\t\t\t\"name\": \"" + layers.get(currentLayer).name + "\",");
            } else {
                s.add("\t\t\t\t\t\"name\": \"UnityLayer " + (currentLayer + 1) + "\",");
            }

            s.add(FINAL_LAYER_LIST.get(currentLayer));

            s.add("\t\t\t\t\t]");
            if (currentLayer < layers.size() - 1) {
                s.add("\t\t\t\t},");
            } else {
                s.add("\t\t\t\t}");
            }
        }
        s.add("            ]"); // end layers
        s.add("        }");
        s.add("    ]");
        s.add("}");

        String url = "test.json";

        saveStrings(url, s.toArray(new String[s.size()]));
    }

}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkLayer {
  ArrayList<LatkFrame> frames = new ArrayList<LatkFrame>();
  int currentFrame = 0;
  String name = "P5layer";
  
  LatkLayer() { }
  
  void run() {
    frames.get(currentFrame).run();
  }
  
  void nextFrame() {
    currentFrame++;
    if (currentFrame > frames.size()-1) currentFrame = 0;
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
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkStroke {
  
  PShape s;
  ArrayList<PVector> points;
  color col = color(255);
    
  LatkStroke(ArrayList<PVector> _p, color _c) {
    init(_p, _c);
  }

  void init(ArrayList<PVector> _p, color _c) {
    setColor(_c);
    setPoints(_p);
  }

  void run() {
    shape(s);
  }
  
  color getColor() {
    return s.getStroke(0);
  }
  
  void setColor(color _c) {
    col = _c;
  }
  
  ArrayList<PVector> getPoints() {
    ArrayList<PVector> points = new ArrayList<PVector>();
    for (int i=0; i<s.getVertexCount(); i++) {
      points.add(s.getVertex(i));
    }
    return points;
  }
  
  void setPoints(ArrayList<PVector> _p) {
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(col);
    s.strokeWeight(2);
    for (int i=0; i<_p.size(); i++) {
      PVector pt = _p.get(i);
      s.vertex(pt.z, -pt.y, pt.x);
    }
    s.endShape();
    points = _p;
  }

}
