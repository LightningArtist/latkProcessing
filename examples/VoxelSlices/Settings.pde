class Settings {
  
  String[] data;
  String name = "settings.txt";
  
  Settings(String _s) {
    name = _s;
    read();
  }
  
  void read() {
    try {
      data = loadStrings(name);
      for (int i=0;i<data.length;i++) {
        if (data[i].equals("Volume Width")) sW = readInt(i);
        if (data[i].equals("Volume Height")) sH = readInt(i);
        if (data[i].equals("Volume Depth")) sD = readInt(i);
        if (data[i].equals("Display Scale Factor")) scaleFactor = readInt(i);
        if (data[i].equals("Subpoint Steps")) subPointSteps = readInt(i);
        if (data[i].equals("Global Scale")) globalScale = readFloat(i);
        if (data[i].equals("Load Slices")) doLoadSlices = readBoolean(i);
       }
    } 
    catch(Exception e) {
      println("Couldn't load settings file. Using defaults.");
    }
  }

  void write() {
    try {
      for (int i=0;i<data.length;i++) {
        //if (data[i].equals("Mirror")) writeBoolean(mirror, i);
      }
      saveStrings(name, data);
    } catch (Exception e) {
      println("Failed to write settings file.");
    }
  }
  
  // ~ ~ ~ GET ~ ~ ~

  int readInt(int index) {
    String _s = data[index+1];
    return int(_s);
  }

  float readFloat(int index) {
    String _s = data[index+1];
    return float(_s);
  }

  boolean readBoolean(int index) {
    String _s = data[index+1];
    return boolean(_s);
  }

  String readString(int index) {
    String _s = data[index+1];
    return ""+(_s);
  }
  
  color readColor(int index) {
    String _s = data[index+1];
    
    color endColor = color(0);
    int commaCounter=0;
    String sr = "";
    String sg = "";
    String sb = "";
    String sa = "";
    int r = 0;
    int g = 0;
    int b = 0;
    int a = 0;

    for (int i=0;i<_s.length();i++) {
        if (_s.charAt(i)!=char(' ') && _s.charAt(i)!=char('(') && _s.charAt(i)!=char(')')) {
          if (_s.charAt(i)==char(',')){
            commaCounter++;
          }else{
          if (commaCounter==0) sr += _s.charAt(i);
          if (commaCounter==1) sg += _s.charAt(i);
          if (commaCounter==2) sb += _s.charAt(i); 
          if (commaCounter==3) sa += _s.charAt(i);
         }
       }
     }

    if (sr!="" && sg=="" && sb=="" && sa=="") {
      r = int(sr);
      endColor = color(r);
    }
    if (sr!="" && sg!="" && sb=="" && sa=="") {
      r = int(sr);
      g = int(sg);
      endColor = color(r, g);
    }
    if (sr!="" && sg!="" && sb!="" && sa=="") {
      r = int(sr);
      g = int(sg);
      b = int(sb);
      endColor = color(r, g, b);
    }
    if (sr!="" && sg!="" && sb!="" && sa!="") {
      r = int(sr);
      g = int(sg);
      b = int(sb);
      a = int(sa);
      endColor = color(r, g, b, a);
    }
      return endColor;
  }

  PVector readVector(int index){
    String _s = data[index+1];

    PVector endPVector = new PVector(0,0,0);
    int commaCounter=0;
    String sx = "";
    String sy = "";
    String sz = "";
    float x = 0;
    float y = 0;
    float z = 0;

    for (int i=0;i<_s.length();i++) {
        if (_s.charAt(i)!=char(' ') && _s.charAt(i)!=char('(') && _s.charAt(i)!=char(')')) {
          if (_s.charAt(i)==char(',')){
            commaCounter++;
          }else{
          if (commaCounter==0) sx += _s.charAt(i);
          if (commaCounter==1) sy += _s.charAt(i);
          if (commaCounter==2) sz += _s.charAt(i); 
         }
       }
     }

    if (sx!="" && sy=="" && sz=="") {
      x = float(sx);
      endPVector = new PVector(x,0);
    }
    if (sx!="" && sy!="" && sz=="") {
      x = float(sx);
      y = float(sy);
      endPVector = new PVector(x,y);
    }
    if (sx!="" && sy!="" && sz!="") {
      x = float(sx);
      y = float(sy);
      z = float(sz);
      endPVector = new PVector(x,y,z);
    }
      return endPVector;
  }
  
  String[] readStringArray(int index) {
    String _s = data[index+1];
      
    int commaCounter=0;
    for (int j=0;j<_s.length();j++) {
        if (_s.charAt(j)==char(',')){
          commaCounter++;
        }      
    }
    //println(commaCounter);
    String[] buildArray = new String[commaCounter+1];
    commaCounter=0;
    for(int k=0;k<buildArray.length;k++){
      buildArray[k] = "";
    }
    for (int i=0;i<_s.length();i++) {
      if (_s.charAt(i)!=char(' ') && _s.charAt(i)!=char('(') && _s.charAt(i)!=char(')') && _s.charAt(i)!=char('{') && _s.charAt(i)!=char('}') && _s.charAt(i)!=char('[') && _s.charAt(i)!=char(']')) {
        if (_s.charAt(i)==char(',')) {
          commaCounter++;
        } else {
          buildArray[commaCounter] += _s.charAt(i);
        }
      }
    }
    println(buildArray);
    return buildArray;
  }
  
  // ~ ~ ~ SET ~ ~ ~

  void writeBoolean(boolean b, int index) {
    data[index+1] = "" + b;
  }
  
  void writeFloat(float f, int index) {
    data[index+1] = "" + f;
  }
  
  void writeInt(int i, int index) {
    data[index+1] = "" + i;
  }

  void writeString(String s, int index) {
    data[index+1] = "" + s;
  }

}
