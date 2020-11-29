package latkProcessing;

public class LatkLayer {
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

