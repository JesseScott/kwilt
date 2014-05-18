
/*

Tile Class

Holds an instance of Hype to draw one quilt to one tile

*/


class Tile {
  
  // Globals
  PApplet parent;
  int index;
  int count, total;
  int xpos, ypos;
  int rows, columns;
  boolean isUpdating;
  PShape shape;
  PShape[] shapes;
  color[] colors;

  Tile(PApplet _applet, int _index, int _xpos, int _ypos) {
    parent = _applet;
    index = _index;
    xpos = _xpos;
    ypos = _ypos;
  }
  

  void setup() {
    
    rows = TILE_WIDTH / TILE_SECTION;
    columns = TILE_HEIGHT / TILE_SECTION;
    
    colors = new color[8];
    colors[0] = color(255);
    colors[1] = color(247);
    colors[2] = color(236);
    colors[3] = color(51);
    colors[4] = color(0, 149, 168);
    colors[5] = color(0, 97, 111);
    colors[6] = color(255, 51, 0);
    colors[7] = color(255, 102, 0);
  
    shapes = new PShape[6];
    shapes[0] = loadShape("art_01.svg");
    shapes[1] = loadShape("art_02.svg");
    shapes[2] = loadShape("art_03.svg");
    shapes[3] = loadShape("art_04.svg");
    shapes[4] = loadShape("art_05.svg");
    shapes[5] = loadShape("art_06.svg");
    
    shape = createShape(GROUP);
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < columns; c++) {
        PShape s = seedShape(r, c);
        shape.addChild(s);
        total++;
      }
    }  
  
  }
  
  void update(int currentShape) {
    count = 0;
    for(int r = 0; r < rows; r++) {
      for(int c = 0; c < columns; c++) {
        // One Shape At A Time
        if(count == currentShape) {
          PShape s = shape.getChild(currentShape);
          s.translate( 0,  0);
          s.resetMatrix();
          s.rotate( ((int)random(4) + index) * QUARTER_PI );
          s.translate( r * TILE_SECTION + 5,  c * TILE_SECTION +5);
        }
        count++;
      }
    }
    println("count: " + count + "\t current: " + currentShape);

  }
  
  void draw() {
    
    if(debug) {
      stroke(255, 0, 0);
      fill(0);
      rect(xpos, ypos, TILE_WIDTH, TILE_HEIGHT);
      fill(255);
      textSize(96);
      text(index, xpos + TILE_WIDTH/2, ypos + TILE_HEIGHT/2); 
    }
    else {
      shape(shape, xpos, ypos);
    }
    
  }
  
  PShape seedShape(int _row, int _col) {
      PShape s = createShape(shapes[(int)random(shapes.length)]);
      s.rotate( ((int)random(4)) * QUARTER_PI );
      s.resetMatrix();             
      s.translate( _row * TILE_SECTION + 5, _col * TILE_SECTION +5);
      s.setFill(colors[(int)random(colors.length)]);
      s.setStroke(0);
      return s;
  }
  
  int getNumShapes() {
    return total; 
  }
  
  boolean isUpdating() {
    return isUpdating; 
  }
  
  
} /* eoc */
