package latkProcessing;

import processing.core.*;
import java.util.ArrayList;

public class LatkStroke {
  
  public PShape s;
  public ArrayList<PVector> points;
  public int col = color(255);
  public float globalScale = 1;
  public PVector globalOffset = new PVector(0,0,0);
    
  public LatkStroke(ArrayList<PVector> _p, int _c) {
    init(_p, _c);
  }

  public void init(ArrayList<PVector> _p, int _c) {
    setColor(_c);
    setPoints(_p);
  }

  public void run() {
    pushMatrix();
    scale(globalScale, globalScale, globalScale);
    shape(s);
    popMatrix();
  }
  
  public void run(PGraphics g) {
    g.pushMatrix();
    g.scale(globalScale, globalScale, globalScale);
    g.shape(s);
    g.popMatrix();
  }
  
  int getColor() {
    return s.getStroke(0);
  }
  
  public void setColor(int _c) {
    col = _c;
  }
  
  ArrayList<PVector> getPoints() {
    ArrayList<PVector> points = new ArrayList<PVector>();
    for (int i=0; i<s.getVertexCount(); i++) {
      points.add(s.getVertex(i));
    }
    return points;
  }
  
  public void setPoints(ArrayList<PVector> _p) {
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
