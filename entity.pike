// Entity class hosting any entity object with an x and a y and draw and tick method

// import graphics class
constant Graphics = (program)"graphics.pike";

// the x and y of this entity
int x,y;
// width and height of this entity
int width,height;
// the colour of this entity
Image.Color col;
// the graphics instance
Graphics g;
// width and height of each grid cell
int gs = 25;

// constructor
void create(Graphics _g, int _gs) {
    // pass reference to graphics
    g = _g;
    // pass reference to gameover
    // pass grid size
    gs = _gs;
}

// handle entity logic
void tick() {}

// draw this entity to the screen
void draw() {
    g.fillc(col);
    g.rect(x*gs,y*gs,gs,gs);
}
