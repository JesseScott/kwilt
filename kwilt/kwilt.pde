
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
int currentTile = 0;

boolean debugLayout = false;
boolean debugFPS = false;

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
  
  // Update Tiles  
  
    // Iterate Through Sub-Shapes
    int currFrame = frameCount % (tiles[currentTile].getNumShapes());
    
    // Keep Going Until We Reach The Last Sub-Shape
    if(currFrame < tiles[currentTile].getNumShapes()-1) {
      // Update Sub Tiles On Counter
      tiles[currentTile].update(currFrame);
    }
    // When We Are At The Last Sub-Shape, Jump To The Next Tile
    else {
      currentTile ++;
      currentTile = currentTile % 4;
    }

  // Draw Tiles
  for(int i = 0; i < tiles.length; i++) {
    tiles[i].draw();
  }
  
  // FPS
  if(debugFPS) {
    if(frameCount % 120 == 0) {
      println("FPS: " + round(frameRate)); 
    }
  }
  
}

