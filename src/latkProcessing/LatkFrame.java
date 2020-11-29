package latkProcessing;

public class LatkFrame {
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


