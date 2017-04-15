class Voxel {
  PVector p;
  float s;
  color c;
  boolean drawMe = false;
  boolean selectMe = false;
  boolean sameZ = false;

  Voxel(float _x, float _y, float _z, float _s) {
    p = new PVector(_x * scaleFactor, _y * scaleFactor, _z * scaleFactor);
    s = _s;
    c = vbgColor;//color(0,0);
  }

  void update() {
    //
  }
  
  void draw() {
    if (selectMe || drawMe || sameZ) {
      pushMatrix();
      translate(p.x + offset.x, p.y + offset.y, p.z + offset.z);

      if (!selectMe && !drawMe && sameZ){
        strokeWeight(2);
        stroke(255,20);
        noFill();        
      } else if (selectMe && !drawMe) {
        strokeWeight(2);
        stroke(0, 255, 0);
        fill(0, 255, 0, 100);
      } else if (!selectMe && drawMe) {
        strokeWeight(2);
        stroke(c);
        fill(c, 100);
      } else if (selectMe && drawMe) {
        strokeWeight(10);
        stroke(255, 255, 0);
        fill(255, 255, 0, 200);
      }
      
      if (!selectMe && !drawMe && sameZ){
        rectMode(CENTER);
        rect(0,0,s,s);
      } else {
        box(s);
      }
      
      popMatrix();
    }
  }
  
  void run() {
    draw();
  }
  
}