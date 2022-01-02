// food class to hold a red food object
constant Entity = (program)"entity.pike";
inherit Entity;

// import snake class
constant Snake = (program)"snake.pike";
// import tail class
constant Tail = (program)"tail.pike";

void create(Graphics _g, int _gs) {
    ::create(_g, _gs);
    // tail colour
    col = Image.Color("red");
}

void place(Snake snake) {
    // if the food is colliding with the snake or its tail
    int iscolliding = 1;
    // find a spot that doesnt collide
    do {
        // set food coords to random position
        x = random(10);
        y = random(10);
        // if iscolliding never gets set to 1, it sh]ould be 0
        iscolliding = 0;
        // for each tail object in the snake
        foreach(snake->tail, Tail i) {
            if (i->x == x && i->y == y)
                iscolliding = 1;
        }
        // check if snake head is colliding
        if (snake->x == x && snake->y == y)
            iscolliding = 1;
    } while(iscolliding);
}