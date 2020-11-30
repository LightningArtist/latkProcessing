package latkProcessing;

import processing.core.*;
import java.util.ArrayList;

public class LatkLayer {
  public ArrayList<LatkFrame> frames = new ArrayList<LatkFrame>();
  public int currentFrame = 0;
  public String name = "P5layer";
  
  public LatkLayer() { }
  
  public void run() {
    frames.get(currentFrame).run();
  }
  
  public void run(PGraphics g) {
    frames.get(currentFrame).run(g);
  }
  
  public void nextFrame() {
    currentFrame++;
    if (currentFrame > frames.size()-1) currentFrame = 0;
  }
}

