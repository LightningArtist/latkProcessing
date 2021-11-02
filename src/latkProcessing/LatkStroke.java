package latkProcessing;

import processing.core.*;
import java.util.ArrayList;

public class LatkStroke {
  
  PApplet parent;

  public PShape s;
  public ArrayList<LatkPoint> points;
  public int col;
  public float globalScale;
  public PVector globalOffset;  
  public int smoothReps = 10;
  public int splitReps = 2;

  public LatkStroke(PApplet _parent, ArrayList<LatkPoint> _p, int _c) {
    parent = _parent;
    init(_p, _c);
  }

  public void init(ArrayList<LatkPoint> _p, int _c) {
    col = parent.color(255);
    globalScale = 1;
    globalOffset = new PVector(0,0,0);
    setColor(_c);
    setPoints(_p);
  }

  public void run() {
    parent.pushMatrix();
    parent.scale(globalScale, globalScale, globalScale);
    parent.shape(s);
    parent.popMatrix();
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
  
  public void setPoints(ArrayList<LatkPoint> _p) {
    s = parent.createShape();
    s.beginShape();
    s.noFill();
    s.stroke(col);
    s.strokeWeight(2);
    for (int i=0; i<_p.size(); i++) {
      PVector pt = _p.get(i).co;
      s.vertex(pt.z, -pt.y, pt.x);
    }
    s.endShape();
    points = _p;
  }

  public void updatePoints() {
    setPoints(points);
  }

  public void smoothStroke() {
    float weight = 18.0f;
    float scale = 1.0f / (weight + 2.0f);
    int nPointsMinusTwo = points.size() - 2;
    LatkPoint lower, upper, center;

    for (int i = 1; i < nPointsMinusTwo; i++) {
	  lower = points.get(i-1);
	  center = points.get(i);
	  upper = points.get(i+1);

	  center.co.x = (lower.co.x + weight * center.co.x + upper.co.x) * scale;
	  center.co.y = (lower.co.y + weight * center.co.y + upper.co.y) * scale;
    }
  }

  public void splitStroke() {
    for (int i = 1; i < points.size(); i+=2) {
      LatkPoint center = points.get(i);
      LatkPoint lower = points.get(i-1);
      float x = (center.co.x + lower.co.x) / 2.0f;
      float y = (center.co.y + lower.co.y) / 2.0f;
      float z = (center.co.z + lower.co.z) / 2.0f;
      PVector p = new PVector(x, y, z);
      LatkPoint lp = new LatkPoint(parent, p);
      points.add(i, lp);
    }
  }

  public void refine() {
    for (int i=0; i<splitReps; i++) {
      splitStroke();  
      smoothStroke();  
    }
    for (int i=0; i<smoothReps - splitReps; i++) {
      smoothStroke();    
     }
  }
}
