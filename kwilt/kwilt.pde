
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
  size(TILE_WIDTH * NUMBER_OF_TILES, TILE_HEIGHT);  
  smooth();

  // Create Tiles
  for(int i = 0; i < tiles.length; i++) {
    tiles[i] = new Tile(this, i + 1); 
    tiles[i].setup();
  }
  
}


// DRAW

void draw() {
  
  timer();
  
}

void drawTiles() {
  for(int i = 0; i < tiles.length; i++) {
    tiles[i].draw();
  }
}

void timer() {
   if(millis() - time >= 1000) {
      println(int(frameRate) + "   " + millis());
      drawTiles();
      time = millis(); 
   } 
}
