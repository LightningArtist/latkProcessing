class Layer {
  
  Frame[] frames;
  
  Layer() {
    init();
  }
  
  void init() {
   
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (int i=0; i<frames.length; i++) {
      frames[i].run();
    }
  }
  
  void run() {
    draw();
  }
  
}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class Frame {
  
  Stroke[] strokes;
  
  Frame() {
    init();
  }
  
  void init() {
  
  }

  void update() {
    //
  }
  
  void draw() {
    for (int i=0; i<strokes.length; i++) {
      strokes[i].run();
    }
  }
  
  void run() {
    draw();
  }

}

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class Stroke {
  
  PShape s;
  PVector[] p;
  color c;
    
  Stroke(PVector[] p, color c) {
    init(p, c);
  }
  
  void init(PVector[] p, color c) {
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(c);
    s.strokeWeight(2);
    for (int i=0; i<p.length; i++) {
      p[i].x *= globalScale;
      p[i].y *= globalScale;
      p[i].z *= globalScale;
      s.vertex((width/2) + p[i].z, (height/2) + -p[i].y, ((width + height) / 4) + p[i].x);
    }
    s.endShape();
    
    p = getPoints();
    c = getColor();
  }

  void update() {
    //
  }
  
  void draw() {
    shape(s);
  }
  
  void run() {
    draw();
  }
  
  color getColor() {
    c = s.getStroke(0);
    return c;
  }
  
  PVector[] getPoints() {
    /*
    ArrayList<PVector> p = new ArrayList<PVector>();
    for (int i=0; i<s.getVertexCount(); i++) {
      p.add(s.getVertex(i));
    }
    return p.toArray(new PVector[p.size()]);
    */
    PVector[] pp = new PVector[s.getVertexCount()];
    for (int i=0; i<pp.length; i++) {
      pp[i] = s.getVertex(i);
    }
    p = pp;
    return p;
  }
  
}