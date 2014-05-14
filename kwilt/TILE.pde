
/*

Tile Class

Holds an instance of Hype to draw one quilt to one tile

*/


class Tile {
  
  // Globals
  HDrawablePool pool;
  PApplet parent;
  int tileWidth = TILE_WIDTH;
  int tileHeight = TILE_HEIGHT;
  int xpos;
  int ypos;
  int index;

  Tile(PApplet _applet, int _index) {
    parent = _applet;
    index = _index;
  }
  

  void setup() {
    H.init(parent).background(#202020);
  
    final HColorPool colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);
  
    PShape svg1 = loadShape("art_01.svg");
    PShape svg2 = loadShape("art_02.svg");
    PShape svg3 = loadShape("art_03.svg");
    PShape svg4 = loadShape("art_04.svg");
    PShape svg5 = loadShape("art_05.svg");
    PShape svg6 = loadShape("art_06.svg");
  
    pool = new HDrawablePool(121);
    pool.autoAddToStage()
      .add (new HShape(svg1).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
      .add (new HShape(svg2).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
      .add (new HShape(svg3).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
      .add (new HShape(svg4).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
      .add (new HShape(svg5).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
      .add (new HShape(svg6).strokeJoin(ROUND).strokeCap(ROUND).anchorAt(H.CENTER))
      .layout (
        new HGridLayout()
        .startX(70)
        .startY(70)
        .spacing(50,50)
        .cols(11)
      )
      .onCreate (
          new HCallback() {
            public void run(Object obj) {
              HShape s = (HShape) obj;
              s.stroke(#000000).strokeWeight(2).rotation( ((int)random(4)) * 90 );
              s.randomColors(colors).fillOnly();
              HDrawable d = (HDrawable) obj;
              d.loc(TILE_WIDTH * index, height/2).anchorAt(H.CENTER);
          }
        }
      )
      .requestAll();
  
    
  }
  
  void update() {
    
    
  }
  
  void draw() {
    H.drawStage();
    
  }
  
  
} /* eoc */
