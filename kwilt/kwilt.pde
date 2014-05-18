
/*


*/


// IMPORTS
import java.awt.Frame;




// VARIABLES

public static final int TILE_WIDTH = 720;
public static final int TILE_HEIGHT = 540;
public static final int TILE_SECTION = 60;
public static final int NUMBER_OF_TILES = 4;
public static final int NUMBER_OF_ROWS = 2;
public static final int NUMBER_OF_COLS = 2;
Tile[] tiles = new Tile[NUMBER_OF_TILES];

int time = 0;

boolean debug = false;

// SCREEN

public void init() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}



// SETUP

void setup() {
  
  // Screen
  size(TILE_WIDTH * NUMBER_OF_ROWS, TILE_HEIGHT * NUMBER_OF_COLS, P2D);  
  frame.setLocation(0 - (TILE_WIDTH * NUMBER_OF_ROWS), 0);
  smooth();
  background(0);
  frameRate(15);

  // Create Tiles
  for(int i = 0; i < tiles.length; i++) {
    int x = TILE_WIDTH  * (i % 2);
    int y = TILE_HEIGHT * (((i/2) % 2) % (tiles.length/2));
    tiles[i] = new Tile(this, i, x, y); 
    tiles[i].setup();
  }
  
}


// DRAW

void draw() {
  background(0);
  
  // Shapes
  int count = 0;
  for(int i = 0; i < tiles.length; i++) {
    
    // Update One Tile At A Time
    if(i == count) {
      
      // Check Which Shape Is Updating
      int currFrame = frameCount % (tiles[count].getNumShapes());
      println(currFrame + " / " + tiles[count].getNumShapes());
      
      if(currFrame < tiles[count].getNumShapes()-1) {
        // Update Sub Tiles On Counter
        tiles[count].update(currFrame);
      }
      else {
        count++; 
      }
      println("Current Tile Is " + count);
    }
    
    //Draw All Tiles
    tiles[i].draw();
  }
  
  if(frameCount % 120 == 0) {
    //println("FPS: " + round(frameRate)); 
  }
  
}

