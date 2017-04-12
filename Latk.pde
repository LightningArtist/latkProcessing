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
    
  Stroke(ArrayList p, color c) {
    init(p, c);
  }
  
  void init(ArrayList p, color c) {
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(c);
    s.strokeWeight(2);
    for (int i=0; i<p.size(); i++) {
      PVector v = (PVector) p.get(i);
      v.x *= globalScale;
      v.y *= globalScale;
      v.z *= globalScale;
      //s.vertex((width/2) + v.x, (height/2) + -v.y, ((width + height) / 4) + v.z);
      s.vertex(v.x, -v.y, v.z - 300);
    }
    s.endShape();
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
  
}