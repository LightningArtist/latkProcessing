package latkProcessing;

import processing.core.*;
import java.util.ArrayList;

public class QuillStroke {

	PApplet parent;
  public ArrayList<PVector> positions;
  public ArrayList<Float> widths;
  public ArrayList<Integer> colors;
  public float brushSize;
  public int brushColor; 

  public QuillStroke(PApplet _parent, ArrayList<PVector> _positions, ArrayList<Float> _widths, ArrayList<Integer> _colors) {
    parent = _parent;
    positions = _positions;
    colors = _colors;
    widths = _widths;

    brushSize = widths.get((int) widths.size()/2);
    brushColor = colors.get((int) colors.size()/2);
  }

}
