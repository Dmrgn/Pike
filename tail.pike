// Tail class that trails the snake head
constant Entity = (program)"entity.pike";
inherit Entity;

void create(Graphics _g, int _gs, int _x, int _y) {
    // call entity constructor
    ::create(_g,_gs);
    // set starting x and y values
    x = _x;
    y = _y;
    // tail colour
    col = Image.Color("darkgreen");
}