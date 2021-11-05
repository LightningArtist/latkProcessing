/*
Quill reader for Processing by @n1ckfg.
Adapted from SharpQuill by Joan Charmant.
*/

package latkProcessing;

import java.io.*;
import java.nio.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
import java.util.Enumeration;
import java.util.regex.Pattern;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import processing.core.*;
import processing.data.JSONArray;
import processing.data.JSONObject;

public class QuillLoader {

	PApplet parent;
	public byte[] bytes;
  public JSONObject json;
  public int numStrokes;
  public ArrayList<QuillStroke> strokes;
  public float scale = 10;

  private ZipFile zipFile;
  private ArrayList<String> fileNames;

	public QuillLoader(PApplet _parent, String _url) {
    parent = _parent;

    read(_url);
  }

  public QuillLoader(PApplet _parent, String _urlJson, String _urlBin) {
    parent = _parent;

    read(_urlJson, _urlBin);
  }

  // A quill zipfile should contain three items: Quill.json, Quill.qbin, and State.json
  // Quill.json describes data structures with an index in the Quill.qbin binary blob.
  public void read(String _url) {
    // Read from a single zipfile.
    try {
      String url = getFilePath(_url);
      zipFile = new ZipFile(url);
      
      fileNames = new ArrayList<String>();
      final Enumeration<? extends ZipEntry> entries = zipFile.entries();
      while (entries.hasMoreElements()) {
        fileNames.add(entries.nextElement().getName());
      }

      json = parent.parseJSONObject(readEntryAsString("Quill.json"));
  		bytes = readEntryAsBytes("Quill.qbin");
      
      parseQuill();

      zipFile.close();
    } catch (Exception e) {
      parent.println(e);
    }
  }

  public void read(String _urlJson, String _urlBin) {
    // Read json and bin as separate files.
    try {
      String urlJson = getFilePath(_urlJson);
      String urlBin = getFilePath(_urlBin);
      
      json = parent.loadJSONObject(urlJson);
      bytes = parent.loadBytes(urlBin);
      
      parseQuill();
    } catch (Exception e) {
      parent.println(e);
    }
  }

  private void parseQuill() {      
    strokes = new ArrayList<QuillStroke>();

    int childCount = json.getJSONObject("Sequence").getJSONObject("RootLayer").getJSONObject("Implementation").getJSONArray("Children").size();
    //parent.println("Found " + childCount + " child nodes.");

    for (int i=0; i < childCount; i++) {
      JSONObject childNode = (JSONObject) json.getJSONObject("Sequence").getJSONObject("RootLayer").getJSONObject("Implementation").getJSONArray("Children").get(i);

      // skip the child node if it contains no drawings
      int drawingCount = 0;
      try {
        drawingCount = childNode.getJSONObject("Implementation").getJSONArray("Drawings").size();
      } catch (Exception e) { 
        continue;
      }
      //parent.println("Found " + drawingCount + " drawings in child " + i + ".");

      for (int j=0; j < drawingCount; j++) {
        JSONObject drawingNode  = (JSONObject) childNode.getJSONObject("Implementation").getJSONArray("Drawings").get(j);
        
        String dataFileOffsetString = drawingNode.getString("DataFileOffset");

        int dataFileOffset = (int) Long.parseLong(dataFileOffsetString, 16);

        int numNodeStrokes = getInt(bytes, dataFileOffset);
        numStrokes += numNodeStrokes;
        
        int offset = dataFileOffset + 4;

        for (int k = 0; k < numNodeStrokes; k++) {
          ArrayList<PVector> positions = new ArrayList<PVector>();
          ArrayList<Integer> colors = new ArrayList<Integer>();
          ArrayList<Float> widths = new ArrayList<Float>();

          offset += 36;

          int numVertices = getInt(bytes, offset);

          offset += 4;

          for (int l = 0; l < numVertices; l++) {
              float x = getFloat(bytes, offset + 0);
              float y = getFloat(bytes, offset + 4);
              float z = getFloat(bytes, offset + 8);
              positions.add(new PVector(x, y, z).mult(scale));

              offset += 36;

              float r = getFloat(bytes, offset + 0) * 255;
              float g = getFloat(bytes, offset + 4) * 255;
              float b = getFloat(bytes, offset + 8) * 255;
              float a = getFloat(bytes, offset + 12) * 255;
              colors.add(parent.color(r, g, b, a));

              offset += 16;

              widths.add(getFloat(bytes, offset + 0));

              offset += 4;
          }

          strokes.add(new QuillStroke(parent, positions, widths, colors));
        }
      }
    }
  }

  private int getUInt(byte[] _bytes, int _offset) {
    byte[] uintBytes = { _bytes[_offset], _bytes[_offset+1], _bytes[_offset+2], _bytes[_offset+3] };
    return asUInt(uintBytes);
  }

  private int getInt(byte[] _bytes, int _offset) {
    byte[] intBytes = { _bytes[_offset], _bytes[_offset+1], _bytes[_offset+2], _bytes[_offset+3] };
    return asInt(intBytes);
  }

  private float getFloat(byte[] _bytes, int _offset) {
    byte[] floatBytes = { _bytes[_offset], _bytes[_offset+1], _bytes[_offset+2], _bytes[_offset+3] };
    return asFloat(floatBytes);
  }

  private int asUInt(byte[] _bytes) {
    int i = asInt(_bytes);
    long unsigned = i & 0xffffffffL;
    return (int) unsigned;
  }

  private int asInt(byte[] _bytes) {
    return (_bytes[0] & 0xFF) 
           | ((_bytes[1] & 0xFF) << 8) 
           | ((_bytes[2] & 0xFF) << 16) 
           | ((_bytes[3] & 0xFF) << 24);
  }

  private float asFloat(byte[] _bytes) {
    return Float.intBitsToFloat(asInt(_bytes));
  }

  private byte[] readEntryAsBytes(String entry) {
    try {
      InputStream stream = zipFile.getInputStream(zipFile.getEntry(entry));
      ByteArrayOutputStream buffer = new ByteArrayOutputStream();

      int nRead;
      byte[] data = new byte[4];

      while ((nRead = stream.read(data, 0, data.length)) != -1) {
        buffer.write(data, 0, nRead);
      }

      buffer.flush();
      return buffer.toByteArray();
    } catch (Exception e) {
      parent.println(e);
      return null;
    }
  }

  private String readEntryAsString(String entry) {
    try {
      InputStream stream = zipFile.getInputStream(zipFile.getEntry(entry));
      String newLine = System.getProperty("line.separator");
      BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
      StringBuilder result = new StringBuilder();
      boolean flag = false;
      for (String line; (line = reader.readLine()) != null; ) {
        result.append(flag? newLine: "").append(line);
        flag = true;
      }
      return result.toString();
    } catch (Exception e) {
      parent.println(e);
      return null;
    }
  }

  private String getFilePath(String fileName) {
    String returns = parent.dataPath(fileName);
    return returns;
  }

}
