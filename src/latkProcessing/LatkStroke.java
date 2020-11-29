package latkProcessing;

public class LatkStroke {
  
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
