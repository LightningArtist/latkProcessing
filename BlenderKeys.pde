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
        dataBlender.add("bpy.ops.mesh.primitive_cube_add()" + "\r");
        dataBlender.add("cube = s()[0]" + "\r");
        dataBlender.add("cube.location = (" + (voxel[i][j][k].p.x) + ", " + (voxel[i][j][k].p.y) + "," + (voxel[i][j][k].p.z) + ")" + "\r");
        //dataBlender.add("setKeyframe()" + "\r");
        float[] f = normalizeRgb(voxel[i][j][k].c);
        dataBlender.add("colorVertices(cube, (" + f[0] + ", " + f[1] + ", " + f[2] + "))" + "\r");
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
}

void blenderKeysEnd() {
  //
  dataBlender.endSave(blenderFilePath + "/" + blenderFileName + "." + blenderFileType);
}