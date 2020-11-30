package latkProcessing;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
import java.util.Enumeration;
import java.util.regex.Pattern;

import processing.core.PApplet;
import processing.core.PGraphics;
import processing.core.PVector;
import processing.data.JSONArray;
import processing.data.JSONObject;
import java.util.ArrayList;

public class Latk {
  
  PApplet parent;

  public JSONObject json;
  public JSONObject jsonGp;
  public JSONObject jsonLayer;
  public JSONObject jsonFrame;
  public JSONObject jsonStroke;
  public JSONObject jsonPoint;
  
  public ArrayList<LatkLayer> layers;

  public String jsonFilename = "layer_test";
  public float globalScale = 200f;
  public int startTime = 0; 
  public int lastMillis = 0;
  public int timeInterval = 0;
  public float fps = 12.0f;
  public int fpsInterval = (int) ((1.0/fps) * 1000.0);
  
  public int currentLayer = 0;
  
  public int cleanMinPoints = 1;
  public float cleanMinLength = 0.1f;
  
  public Latk(PApplet _parent) {
    parent = _parent;

    layers = new ArrayList<LatkLayer>();
    layers.add(new LatkLayer(parent));
    layers.get(layers.size()-1).frames.add(new LatkFrame(parent));
  }
  
  public Latk(PApplet _parent, ArrayList<PVector> _pts, int _c) {
    parent = _parent;

    layers = new ArrayList<LatkLayer>();
    layers.add(new LatkLayer(parent));
    layers.get(layers.size()-1).frames.add(new LatkFrame(parent));
    
    LatkStroke st = new LatkStroke(parent, _pts, _c);
    layers.get(layers.size()-1).frames.get(layers.get(layers.size()-1).frames.size()-1).strokes.add(st);
  }
  
  public Latk(PApplet _parent, ArrayList<Latk> _latks) {
    parent = _parent;

    // TODO
    // read with clear existing false
  }
  
  public Latk(PApplet _parent, String fileName) {
    parent = _parent;

    read(fileName, true);
  
    startTime = parent.millis();
    System.out.println("Latk strokes loaded.");
  }
  
  public void run() {
    boolean advanceFrame = checkInterval();
    
    for (int i=0; i<layers.size(); i++) {
      LatkLayer layer = layers.get(i);
      if (advanceFrame) layer.nextFrame();
      layer.run();
    }
      
    lastMillis = parent.millis();
  }
  
  public void run(PGraphics g) {
    boolean advanceFrame = checkInterval();
    
    for (int i=0; i<layers.size(); i++) {
      LatkLayer layer = layers.get(i);
      if (advanceFrame) layer.nextFrame();
      layer.run(g);
    }
      
    lastMillis = parent.millis();
  }
  
  public boolean checkInterval() {
    boolean returns = false;
    timeInterval += parent.millis() - lastMillis;
    if (timeInterval > fpsInterval) {
      returns = true;
      timeInterval = 0;
    }
    return returns;
  }
  
  public String getFileNameNoExt(String s) {
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
  
  public String getExtFromFileName(String s) {
    String returns = "";
    String[] temp = s.split(Pattern.quote("."));
    returns = temp[temp.length-1];
    return returns;
  }
  
  public void read(String fileName, boolean clearExisting) {
    if (clearExisting) layers = new ArrayList<LatkLayer>();
    
    if (getExtFromFileName(fileName).equals("json")) {
      json = parent.loadJSONObject(fileName);
    } else {
      try {
        String url = new File(parent.dataPath(""), fileName).toString();
        ZipFile zipFile = new ZipFile(url);
        
        ArrayList<String> fileNames = new ArrayList<String>();
        final Enumeration<? extends ZipEntry> entries = zipFile.entries();
        while (entries.hasMoreElements()) {
          fileNames.add(entries.nextElement().getName());
        }
    
        InputStream stream = zipFile.getInputStream(zipFile.getEntry(fileNames.get(0)));
  
        String newLine = System.getProperty("line.separator");
        BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
        StringBuilder result = new StringBuilder();
        boolean flag = false;
        for (String line; (line = reader.readLine()) != null; ) {
          result.append(flag? newLine: "").append(line);
          flag = true;
        }
        
        json = parent.parseJSONObject(result.toString());
  
        zipFile.close();
      } catch (Exception e) {
        System.out.println(e);
      }
    }
    
    for (int h=0; h<json.getJSONArray("grease_pencil").size(); h++) {
      jsonGp = (JSONObject) json.getJSONArray("grease_pencil").get(h);
      
      for (int i=0; i<jsonGp.getJSONArray("layers").size(); i++) {
        layers.add(new LatkLayer(parent));
        
        jsonLayer = (JSONObject) jsonGp.getJSONArray("layers").get(i);
        for (int j=0; j<jsonLayer.getJSONArray("frames").size(); j++) {
          layers.get(layers.size()-1).frames.add(new LatkFrame(parent));

          jsonFrame = (JSONObject) jsonLayer.getJSONArray("frames").get(j);
          for (int l=0; l<jsonFrame.getJSONArray("strokes").size(); l++) {
            jsonStroke = (JSONObject) jsonFrame.getJSONArray("strokes").get(l);
            
            int r = (int) (255.0 * jsonStroke.getJSONArray("int").getFloat(0));
            int g = (int) (255.0 * jsonStroke.getJSONArray("int").getFloat(1));
            int b = (int) (255.0 * jsonStroke.getJSONArray("int").getFloat(2));
            int col = parent.color(r,g,b);
            
            ArrayList<PVector> pts = new ArrayList<PVector>();
            for (int m=0; m<jsonStroke.getJSONArray("points").size(); m++) {
              jsonPoint = (JSONObject) jsonStroke.getJSONArray("points").get(m);
              PVector p = new PVector(jsonPoint.getJSONArray("co").getFloat(0), jsonPoint.getJSONArray("co").getFloat(1), jsonPoint.getJSONArray("co").getFloat(2));
              pts.add(p);//.mult(globalScale));
            }
            
            LatkStroke st = new LatkStroke(parent, pts, col);
            st.globalScale = globalScale;
            layers.get(layers.size()-1).frames.get(layers.get(layers.size()-1).frames.size()-1).strokes.add(st);
          }
        }
      }
    }
  }
  
  public void write(String fileName) {
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
                int col = layers.get(currentLayer).frames.get(layers.get(currentLayer).currentFrame).strokes.get(i).col;
                float r = rounder(parent.red(col) / 255f, 5);
                float g = rounder(parent.green(col) / 255f, 5);
                float b = rounder(parent.blue(col) / 255f, 5);
                sbb.add("\t\t\t\t\t\t\t\t\t\"int\":[" + r + ", " + g + ", " + b + "],");

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
    s.add("\t\t\t]"); // end layers
    s.add("\t\t}");
    s.add("\t]");
    s.add("}");

    String url = parent.sketchPath("") + fileName;
    
    if (getExtFromFileName(fileName).equals("json")) {
      parent.saveStrings(url, s.toArray(new String[s.size()]));
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
   
  public void clean() {
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
            float totalLength = 0f;
            for (int l=1; l<stroke.points.size(); l++) {
              PVector p1 = stroke.points.get(l);
              PVector p2 = stroke.points.get(l-1);
              // 2. Remove the point if it's a duplicate.
              if (hitDetect3D(p1, p2, 0.1f)) {
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

  public boolean hitDetect3D(PVector p1, PVector p2, float s) { 
    if (PVector.dist(p1, p2) < s) {
      return true;
    } else {
      return false;
    }
  }
 
  public float rounder(float _val, float _places){
    _val *= parent.pow(10,_places);
    _val = parent.round(_val);
    _val /= parent.pow(10,_places);
    return _val;
  }
  
}

