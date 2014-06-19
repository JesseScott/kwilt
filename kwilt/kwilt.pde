
/*

*/


// IMPORTS





// VARIABLES

public static final int TILE_WIDTH = 720;
public static final int TILE_HEIGHT = 540;
public static final int TILE_SECTION = 60;
public static final int NUMBER_OF_TILES = 2;

Tile[] tiles = new Tile[NUMBER_OF_TILES];

int time = 0;


// SETUP

void setup() {
  
  // Screen
  size(TILE_WIDTH * NUMBER_OF_TILES, TILE_HEIGHT, P2D);  
  smooth();

  // Create Tiles
  for(int i = 0; i < tiles.length; i++) {
    tiles[i] = new Tile(this, i); 
    tiles[i].setup();
  }
  
}


// DRAW

void draw() {
  background(0);
  
  // Shapes
  for(int i = 0; i < tiles.length; i++) {
    tiles[i].draw();
  }
  
}

