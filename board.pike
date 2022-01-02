// A class for drawing the board

// import graphics class
constant Graphics = (program)"graphics.pike";

// import colour class
import Image.Color;

// graphics instance
Graphics g;
// size of each grid cell
int gs;

// constructor
void create(Graphics _g, int _gs) {
    // pass reference to graphics object
    g = _g;
    // pass size of each grid cell
    gs = _gs;
}

// draw the board to the screen
void draw() {
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            g.fillc(((i%2+j%2)%2 == 0 ? Image.Color("#b38300") : Image.Color("#e6a800")));
            g.rect(i*gs,j*gs,gs,gs);
        }
    }
}