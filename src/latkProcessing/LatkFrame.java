package latkProcessing;

import processing.core.*;
import java.util.ArrayList;

public class LatkFrame {
  public ArrayList<LatkStroke> strokes;
  
  public LatkFrame() { 
    strokes = new ArrayList<LatkStroke>();
  }
  
  public void run() {
    for (int i=0; i<strokes.size(); i++) {
      strokes.get(i).run();
    }
  }
  
  public void run(PGraphics g) {
    for (int i=0; i<strokes.size(); i++) {
      strokes.get(i).run(g);
    }
  }
}


