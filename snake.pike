// Snake class is a subclass of entity used to represent the player snake
constant Entity = (program)"entity.pike";
inherit Entity;

// import tail class
constant Tail = (program)"tail.pike";
// import food class
constant Food = (program)"food.pike";

// velocity
int vx = 0, vy = 0;
// tail array
array(Tail) tail = ({}); 
// refernce to current food object
Food food;
// whether the snake has crashed
int gameover = 0;

void create(Graphics _g, int _gs, Food _food) {
    // call entities create constructor
    ::create(_g,_gs);
    // pass reference to food
    food = _food;
    // snake colour
    col = Image.Color("forestgreen");
}

// handle entity logic
void tick() {
    // for each tail object that isnt next to the head of the snake
    for (int i = sizeof(tail)-1 ; i >= 1 ; i--) {
        // check collision with snake
        if (x == tail[i].x && y == tail[i].y) {
            gameover = 1;
        }
        // this tail object moves forward to the next
        // tail object's position, only move forward if
        // food is not colliding
        if (!(x == food.x && y == food.y)) {
            tail[i]->x = tail[i-1]->x;
            tail[i]->y = tail[i-1]->y;
        }
    }
    // add new tail object if touching food
    if (x == food.x && y == food.y) {
        // add new tail object to begining of tail array
        tail = ({Tail(g, gs, x, y)}) + tail;
        // replace food
        food->place(this);
    }
    // move the first tail object to the snakes position
    tail[0]->x = x;
    tail[0]->y = y;
    // update snake position
    x += vx;
    y += vy;
    // limit snake position
    if (x < 0) x = 9;
    if (y < 0) y = 9; 
    x %= 10;
    y %= 10;
}

// draw this snake and its tail
void draw() {
    // run entity draw
    ::draw();
    // draw each tile object
    foreach(tail, Tail i) {
        i->draw();
    }
}

// handle keyboard input
void keyboard(SDL.Event event) {
    switch (event.keysym.sym) {
        // wasd controls set velocity to their respective direction
        case 119: //w
            vx = 0;
            vy = -1;
            break;
        case 115: //s
            vx = 0;
            vy = 1;
            break;
        case 97: //a
            vx = -1;
            vy = 0;
            break;
        case 100: //d
            vx = 1;
            vy = 0;
            break;
    }
    // print current key pressed
    // write(event.keysym.sym + " \n");
}