/*
Created By: 
    Daniel Morgan 2022-01-01

Description:
    A simple game of snake written in pike using
    the Standard Directmedia Layer library. It 
    was created with maximizing pike's object 
    orientiedness in mind.

Requirements:
    Requires pike 8.0, can be installed with most
    package managers on Linux. Or from 
    https://pike.lysator.liu.se/download/
    Requires the SDL module for pike, installed 
    in the modules directory of 
    /usr/local/lib/pike8.0/modules on Linux. 
    (comes with most pike installs)
*/

// import standard directmedia layer
import SDL;

// import App class
constant App = (program)"app.pike";

int main() {

    // instansiate new app
    App app = App("Snake");

    // initialize
    app->init();

    while(app->running) {
        // handle events
        app->events();
        // run app logic
        app->tick();
        // render new frame
        app->render();
    }

    // close and exit
    app->cleanup(0);
    return -1;

}