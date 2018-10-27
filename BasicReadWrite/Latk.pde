import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
import java.util.Enumeration;
import java.util.regex.Pattern;

class Latk {
  
  JSONObject json;
  JSONObject jsonGp;
  JSONObject jsonLayer;
  JSONObject jsonFrame;
  JSONObject jsonStroke;
  JSONObject jsonPoint;
  
  ArrayList<LatkLayer> layers;

  String jsonFilename = "layer_test";
  float globalScale = 200;
  int startTime = 0; 
  int lastMillis = 0;
  int timeInterval = 0;
  float fps = 12.0;
  int fpsInterval = int((1.0/fps) * 1000.0);
  
  int currentLayer = 0;
  
  int cleanMinPoints = 1;
  float cleanMinLength = 0.1;
  
  Latk() {
    layers = new ArrayList<LatkLayer>();
    layers.add(new LatkLayer());
    layers.get(layers.size()-1).frames.add(new LatkFrame());
  }
  
  Latk(ArrayList<PVector> _pts, color _c) {
    layers = new ArrayList<LatkLayer>();
    layers.add(new LatkLayer());
    layers.get(layers.size()-1).frames.add(new LatkFrame());
    
    LatkStroke st = new LatkStroke(_pts, _c);
    layers.get(layers.size()-1).frames.get(layers.get(layers.size()-1).frames.size()-1).strokes.add(st);
  }
  
  Latk(ArrayList<Latk> _latks) {
    // TODO
    // read with clear existing false
  }
  
  Latk(String fileName) {
    read(fileName, true);
  
    startTime = millis();
    println("Latk strokes loaded.");
  }
  
  void run() {
    boolean advanceFrame = checkInterval();
    
    for (int i=0; i<layers.size(); i++) {
      LatkLayer layer = layers.get(i);
      if (advanceFrame) layer.nextFrame();
      layer.run();
    }
      
    lastMillis = millis();
  }
  
  void run(PGraphics g) {
    boolean advanceFrame = checkInterval();
    
    for (int i=0; i<layers.size(); i++) {
      LatkLayer layer = layers.get(i);
      if (advanceFrame) layer.nextFrame();
      layer.run(g);
    }
      
    lastMillis = millis();
  }
  
  boolean checkInterval() {
    boolean returns = false;
    timeInterval += millis() - lastMillis;
    if (timeInterval > fpsInterval) {
      returns = true;
      timeInterval = 0;
    }
    return returns;
  }
  
  String getFileNameNoExt(String s) {
    String returns = "";
    String[] temp = s.split(Pattern.quote("."));
    if (temp.length > 1) {
      for (int i=0; i<temp.length-1; i++) {
        if (i > 0) returns += ".";
        returns += temp[i];
      }
    } else {
      return s;
    }
    return returns;
  }
  
  String getExtFromFileName(String s) {
    String returns = "";
    String[] temp = s.split(Pattern.quote("."));
    returns = temp[temp.length-1];
    return returns;
  }
  
  void read(String fileName, boolean clearExisting) {
    if (clearExisting) layers = new ArrayList<LatkLayer>();
    
    if (getExtFromFileName(fileName).equals("json")) {
      json = loadJSONObject(fileName);
    } else {
      try {
        String url = new File(dataPath(""), fileName).toString();
        ZipFile zipFile = new ZipFile(url);
      
        InputStream stream = zipFile.getInputStream(zipFile.getEntry(getFileNameNoExt(fileName) + ".json"));
  
        String newLine = System.getProperty("line.separator");
        BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
        StringBuilder result = new StringBuilder();
        boolean flag = false;
        for (String line; (line = reader.readLine()) != null; ) {
          result.append(flag? newLine: "").append(line);
          flag = true;
        }
        
        json = parseJSONObject(result.toString());
  
        zipFile.close();
      } catch (Exception e) {
        println(e);
      }
    }
    
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
              pts.add(p);//.mult(globalScale));
            }
            
            LatkStroke st = new LatkStroke(pts, col);
            st.globalScale = globalScale;
            layers.get(layers.size()-1).frames.get(layers.get(layers.size()-1).frames.size()-1).strokes.add(st);
          }
        }
      }
    }
  }
  
  void write(String fileName) {
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
                float r = rounder(red(col) / 255.0, 5);
                float g = rounder(green(col) / 255.0, 5);
                float b = rounder(blue(col) / 255.0, 5);
                sbb.add("\t\t\t\t\t\t\t\t\t\"color\":[" + r + ", " + g + ", " + b + "],");

                if (layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.size() > 0) {
                    sbb.add("\t\t\t\t\t\t\t\t\t\"points\":[");
                    for (int j = 0; j < layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.size(); j++) {
                        PVector pt = layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).points.get(j);
                        //pt.mult(1.0/globalScale);
                        
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

    String url = sketchPath("") + fileName;
    
    if (getExtFromFileName(fileName).equals("json")) {
      saveStrings(url, s.toArray(new String[s.size()]));
    } else {      
      try {
        File f = new File(url);
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(f));
        ZipEntry e = new ZipEntry(getFileNameNoExt(fileName) + ".json");
        out.putNextEntry(e);
        
        byte[] data = String.join("\n", s.toArray(new String[s.size()])).getBytes();
        out.write(data, 0, data.length);
        out.closeEntry();
        
        out.close();
      } catch (Exception e) {
        //
      }
    }
  }
   
  void clean() {
    for (int i=0; i<layers.size(); i++) {
      LatkLayer layer = layers.get(i);
      for (int j=0; j<layer.frames.size(); j++) {
        LatkFrame frame = layer.frames.get(j);
        for (int k=0; k<frame.strokes.size(); k++) {
          LatkStroke stroke = frame.strokes.get(k);
          // 1. Remove the stroke if it has too few points.
          if (stroke.points.size() < cleanMinPoints) {
            frame.strokes.remove(k);
          } else {
            float totalLength = 0.0;
            for (int l=1; l<stroke.points.size(); l++) {
              PVector p1 = stroke.points.get(l);
              PVector p2 = stroke.points.get(l-1);
              // 2. Remove the point if it's a duplicate.
              if (hitDetect3D(p1, p2, 0.1)) {
                stroke.points.remove(l);
              } else {
                totalLength += PVector.dist(p1, p2);
              }
            }
            // 3. Remove the stroke if its length is too small.
            if (totalLength < cleanMinLength) {
              frame.strokes.remove(k);
            } else {
              // 4. Finally, check the number of points again.
              if (stroke.points.size() < cleanMinPoints) {
                frame.strokes.remove(k);
              }
            }
          }
        }
      }
    }
  }

  boolean hitDetect3D(PVector p1, PVector p2, float s) { 
    if (PVector.dist(p1, p2) < s) {
      return true;
    } else {
      return false;
    }
  }
 
  float rounder(float _val, float _places){
    _val *= pow(10,_places);
    _val = round(_val);
    _val /= pow(10,_places);
    return _val;
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
  
  void run(PGraphics g) {
    frames.get(currentFrame).run(g);
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
  
  void run(PGraphics g) {
    for (int i=0; i<strokes.size(); i++) {
      strokes.get(i).run(g);
    }
  }
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class LatkStroke {
  
  PShape s;
  ArrayList<PVector> points;
  color col = color(255);
  float globalScale = 1;
  PVector globalOffset = new PVector(0,0,0);
    
  LatkStroke(ArrayList<PVector> _p, color _c) {
    init(_p, _c);
  }

  void init(ArrayList<PVector> _p, color _c) {
    setColor(_c);
    setPoints(_p);
  }

  void run() {
    pushMatrix();
    scale(globalScale, globalScale, globalScale);
    shape(s);
    popMatrix();
  }
  
  void run(PGraphics g) {
    g.pushMatrix();
    g.scale(globalScale, globalScale, globalScale);
    g.shape(s);
    g.popMatrix();
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
