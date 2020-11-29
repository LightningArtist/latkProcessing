import java.util.*;

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
      point(rp.xyz.x, rp.xyz.y, rp.xyz.z);
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
  
  void sortByDistance() {
    RgbPoint firstPoint = points.get(0);
    for(int i=1; i<points.size(); i++) {
      RgbPoint rp = points.get(i);
      rp.xyzDistance = PVector.dist(firstPoint.xyz, rp.xyz);
    }
    
    // https://stackoverflow.com/questions/16252269/how-to-sort-an-arraylist
    Collections.sort(points, new Comparator<RgbPoint>() {
        @Override
        public int compare(RgbPoint lhs, RgbPoint rhs) {
            // -1 less than, 1 greater than, 0 equal, all inversed for descending
            return lhs.xyzDistance < rhs.xyzDistance ? -1 : (lhs.xyzDistance > rhs.xyzDistance) ? 1 : 0;
        }
    });
  }
  
  void sortByColor() {
    RgbPoint firstPoint = points.get(0);
    
    for(int i=1; i<points.size(); i++) {
      RgbPoint rp = points.get(i);
      rp.rgbDistance = PVector.dist(firstPoint.rgb, rp.rgb);
    }
    
    // https://stackoverflow.com/questions/16252269/how-to-sort-an-arraylist
    Collections.sort(points, new Comparator<RgbPoint>() {
        @Override
        public int compare(RgbPoint lhs, RgbPoint rhs) {
            // -1 less than, 1 greater than, 0 equal, all inversed for descending
            return lhs.rgbDistance < rhs.rgbDistance ? -1 : (lhs.rgbDistance > rhs.rgbDistance) ? 1 : 0;
        }
    });
  }
  
  void smoother(int reps) {
    for (int h=0; h<reps; h++) {
      ArrayList<RgbPoint> newPoints = new ArrayList<RgbPoint>();
      
      for(int i=1; i<points.size(); i++) {
        RgbPoint rp1 = points.get(i-1);
        RgbPoint rp2 = points.get(i);  
        if (PVector.dist(rp1.xyz, rp2.xyz) < 0.2) {
          PVector avg = rp1.xyz.add(rp2.xyz).mult(0.5);
          RgbPoint rp3 = new RgbPoint(avg, rp2.c);
          newPoints.add(rp1); 
          newPoints.add(rp3); 
          newPoints.add(rp2); 
        }
      }
      
      points = newPoints;
    }
  }
  
}

class RgbPoint {

  PVector xyz;
  PVector rgb;
  color c;
  
  float xyzDistance = 0;
  float rgbDistance = 0;
  
  RgbPoint(float _x, float _y, float _z, float _r, float _g, float _b) {    
    xyz = new PVector(_x, _y, _z);
    rgb = new PVector(_r, _g, _b);
    c = color(_r, _g, _b);
  }
  
  RgbPoint(PVector _xyz, float _r, float _g, float _b) {
    xyz = _xyz;
    rgb = new PVector(_r, _g, _b);
    c = color(_r, _g, _b);
  }
  
  RgbPoint(PVector _xyz, color _c) {
    xyz = _xyz;
    rgb = new PVector(red(_c), green(_c), blue(_c));
    c = _c;
  }
  
  RgbPoint(float _x, float _y, float _z, color _c) {  
    xyz = new PVector(_x, _y, _z);
    rgb = new PVector(red(_c), green(_c), blue(_c));
    c = _c;
  }
  
}
