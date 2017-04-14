Data dataBlender;
String blenderFileName = "blenderScript";
String blenderFilePath = "scripts";
String blenderFileType = "py";

void blenderKeysMain() {
  blenderKeysBegin();
  for (int i=0;i<voxel.length;i++) {
    for (int j=0;j<voxel[i].length;j++) {
      for (int k=0;k<voxel[i][j].length;k++) {
        if(voxel[i][j][k].drawMe){
        dataBlender.add("cube = polyCube(pos=(" + (voxel[i][j][k].p.x) + ", " + (voxel[i][j][k].p.y) + "," + (voxel[i][j][k].p.z) + "))" + "\r");
        //dataBlender.add("setKeyframe()" + "\r");
        float[] f = normalizeRgb(voxel[i][j][k].c);
        dataBlender.add("colorVertices(cube, (" + f[0] + ", " + f[1] + ", " + f[2] + "))" + "\r");
        dataBlender.add("target.append(cube)" + "\r");
        }
      }
    }
  }
  blenderKeysEnd();
}



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void blenderKeysBegin() {
  dataBlender = new Data();
  dataBlender.beginSave();
  dataBlender.add("from latk import *" + "\r");
  dataBlender.add("target = []" + "\r");
  dataBlender.add("# ~ ~ ~ ~ ~" + "\r");
}

void blenderKeysEnd() {
  dataBlender.add("# ~ ~ ~ ~ ~" + "\r");
  dataBlender.add("for obj in target:" + "\r");
  dataBlender.add("    obj.select=True" + "\r");
  dataBlender.add("#booleanMod(target)" + "\r");
  dataBlender.endSave(blenderFilePath + "/" + blenderFileName + "." + blenderFileType);
}