// Graphics class that contains graphics wrappers for interacting with SDL

// import Color module from Image
import Image.Color;

// current fill colour
Image.Color col = Image.Color("black");
// current surface
SDL.Surface surfDisplay;

// constructor
void create(SDL.Surface surface) {
    surfDisplay = surface;
}


// sets the currect fill colour by string
void fills(string _colour) {
    col = Image.Color.guess(_colour);
}
// sets the currect fill colour by greyscale
void fillg(int _g) {
    col = Image.Color(_g,_g,_g);
}
// sets the currect fill colour by greyscale
void fillc(Image.Color _c) {
    col = _c;
}
// sets the currect fill colour
void fill(int r, int g, int b) {
    col = Image.Color(r,g,b);
}


// draws a rect with the current fill colour
void rect(int x, int y, int w, int h) {
    SDL.Rect rect = SDL.Rect(x,y,w,h);
    surfDisplay.fill_rect(surfDisplay->format->map_rgb(col), rect);
}

// sets the background to the current fill colour (clears screen)
void background() {
    surfDisplay.fill(surfDisplay->format->map_rgb(col));
}