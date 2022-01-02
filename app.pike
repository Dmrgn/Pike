// App class that handles an instance of this app

// import the graphics class
constant Graphics = (program)"graphics.pike";
// import game object classes
constant Snake = (program)"snake.pike";
constant Food = (program)"food.pike";
constant Board = (program)"board.pike";


// import System module (for timer)
import System;

// the name of this app
string name;
// if the app is running
int running = 1;

// cap the fps to this number
constant fps = 10;
// time to spend rendering each frame
constant frameTime = 1000/fps;
// the main SDL display surface
SDL.Surface surfDisplay;
// graphics instance
Graphics g;
// frame timer, see how long a frame took to create
System.Timer frameTimer;

// size of each grid tile in pixels
constant gs = 40;
// width and height of window
constant width = gs*10;
// snake object
Snake snake;
// food object
Food food;
// the board object
Board board;

// the app object constructor
void create(void|string _name) {
    if (stringp(_name))
        name = _name;
    else 
        name = "App";
    write(name + " has been created!\n");
}

// init a new app
void init() {
    // init SDL
    if (SDL.init(SDL.INIT_EVERYTHING) < 0) {
        error("SDL failed to init...\n");
    }
    // create display surface
    if (SDL.video_mode_ok(width, width, 32, SDL.HWSURFACE | SDL.DOUBLEBUF)) {
        surfDisplay = SDL.set_video_mode(width, width, 32, SDL.HWSURFACE | SDL.DOUBLEBUF);
    } else {
        error("Client doesn't support target video mode\n");
    }
    // set window caption
    SDL.set_caption(name, name);
    // init graphics instance
    g = Graphics(surfDisplay);
    // init frameTimer
    frameTimer = System.Timer();

    // init snake and food
    food = Food(g, gs);
    snake = Snake(g, gs, food);
    // init board
    board = Board(g, gs);
}

// handle sdl events (keyboard input etc)
void events() {
    // empty SDL Event
    SDL.Event event = SDL.Event();
    // while there is an event on the stack to check
    while(event->poll()) {
        // pop the next event off the stack
        event->get();
        // handle snake keyboard events
        // write(event->type+"\n");
        switch (event->type) {
            case SDL.QUIT: // when the window is closed
                running = 0;
                break;
            case SDL.KEYDOWN: // when the mouse is pressed
                snake->keyboard(event);
                break;
        }
    }
}

// handle main app logic
void tick() {
    // reset frameTimer
    frameTimer->get();
    // tick all entities
    snake->tick();
    // if game over, reset
    if (snake->gameover) {
        write("off tuff");
        // init snake and food
        food = Food(g, gs);
        snake = Snake(g, gs, food);
        // init board
        board = Board(g, gs);
        snake->gameover = 0;
    }
}

// handle rendering a new frame
void render() {
    // clear background
    g.fillg(255);
    g.background();
    // draw the board
    board->draw();
    // draw food
    food->draw();
    // draw the snake
    snake->draw();
    // present current frame
    SDL.update_rect(0,0,0,0);
    // wait to meet required framerate
    System.usleep((int)((frameTime-frameTimer->get())*1000));
}

// run an error message and close the program
void error(string|int code) {
    // if the passed value is a string, print the error message and exit with code 1
    // if the passed value is a integer, print the error code and exit with that code
    if (intp(code)) {
        write("Code with error code " + code + " occured\n");
        cleanup(code);
    } else {
        write(code);
        cleanup(1);
    }
}

// quit this app and cleanup everything
void cleanup(int code) {
    // quit sdl
    SDL.quit();
    // exit program
    exit(code);
}