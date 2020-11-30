package latkProcessing;

import processing.core.PApplet;
import processing.core.PGraphics;
import java.util.ArrayList;

public class LatkLayer {

  PApplet parent;

  public ArrayList<LatkFrame> frames = new ArrayList<LatkFrame>();
  public int currentFrame = 0;
  public String name = "P5layer";
  
  public LatkLayer(PApplet _parent) { 
    parent = _parent;
  }
  
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

