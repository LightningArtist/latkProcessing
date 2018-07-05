class RgbPointCloud {

  ArrayList<RgbPoint> points;
  float strokeWeightVal = 0.01;

  RgbPointCloud() {
    points = new ArrayList<RgbPoint>();
  }

  RgbPointCloud(MeshObj obj) {
    points = new ArrayList<RgbPoint>();
  
    for (int i=0; i<obj.obj.size(); i++) {
      MeshObjChild m = obj.obj.get(i);
      for (int j=0; j<m.points.size(); j++) {
        PVector p = m.points.get(j);
        color c = m.fillColor;
        RgbPoint rp = new RgbPoint(p, c);
        points.add(rp);
      }
    }  
  }
  
  void draw() {
    for (int i=0; i<points.size(); i++) {
      RgbPoint rp = points.get(i);
      stroke(rp.c);
      strokeWeight(strokeWeightVal);
      point(rp.x, rp.y, rp.z);
    }  
  }
  
  void addPoint(float _x, float _y, float _z, float _r, float _g, float _b) {
    points.add(new RgbPoint(_x, _y, _z, _r, _g, _b));
  }
  
  void addPoint(PVector _p, float _r, float _g, float _b) {
    points.add(new RgbPoint(_p, _r, _g, _b));
  }
  
  void addPoint(PVector _p, color _c) {
    points.add(new RgbPoint(_p, _c));
  }
  
  void addPoint(float _x, float _y, float _z, color _c) {
    points.add(new RgbPoint(_x, _y, _z, _c));
  }  
  
}

class RgbPoint {

  PVector p;
  color c;
  float x, y, z, r, g, b;
  
  RgbPoint(float _x, float _y, float _z, float _r, float _g, float _b) {
    x = _x;
    y = _y;
    z = _z;
    r = _r;
    g = _g;
    b = _b;
    
    p = new PVector(x, y, z);
    c = color(r, g, b);
  }
  
  RgbPoint(PVector _p, float _r, float _g, float _b) {
    p = _p;
    r = _r;
    g = _g;
    b = _b;
    
    x = p.x;
    y = p.y;
    z = p.z;
    c = color(r, g, b);
  }
  
  RgbPoint(PVector _p, color _c) {
    p = _p;
    c = _c;
    
    x = p.x;
    y = p.y;
    z = p.z;
    r = red(c);
    g = green(c);
    b = blue(c);
  }
  
  RgbPoint(float _x, float _y, float _z, color _c) {
    x = _x;
    y = _y;
    z = _z;
    c = _c;
    
    p = new PVector(x, y, z);
    r = red(c);
    g = green(c);
    b = blue(c);
  }
  
}
