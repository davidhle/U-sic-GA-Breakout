// WELCOME TO U[SIC]GA BREAKOUT
// HAVE FUN :)
// David Le
// CS 2261 HW3

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "Splash.h"
#include "tutorial.h"
#include "win.h"
#include "lose.h"
#include "pause.h"

// States
enum { SPLASH, TUTORIAL, GAME, PAUSE, WIN, LOSE };
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Text Buffer
char buffer[41];

int main() {
    initialize();
    while(1) {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
        	case SPLASH:
        		splash();
        		break;
            case TUTORIAL:
                tutorial();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    // Set up the first state
    goToSplash();
}

void goToSplash() {
	drawFullscreenImage(SplashBitmap);
	state = SPLASH;
}

void splash() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToTutorial();
	}
}

// Sets up the start state
void goToTutorial() {
    drawFullscreenImage(tutorialBitmap);
    state = TUTORIAL;
}

// Runs every frame of the start state
void tutorial() {
    // Lock the framerate to 60 fps
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {
    fillScreen(WHITE);
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    sprintf(buffer, "%d", blocksRemaining);
    waitForVBlank();
    drawGame();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	goToPause();
    } else if (blocksRemaining == 0) {
    	goToWin();
    } else if (loseGame) {
    	goToLose();
    } 
}

// Sets up the pause state
void goToPause() {
    drawFullscreenImage(pauseBitmap);
    // Write how many blocks are left 
    drawString(85, 55, "Blocks Remaining: ", WHITE);
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    // Lock the framerate to 60 fps
    waitForVBlank();

    // Erase the old number and write the new one
    drawRect(85, 160, 10, 12, GRAY);
    drawString(85,160, buffer, WHITE);

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
            goToGame();
    }
}

// Sets up the win state
void goToWin() {
    drawFullscreenImage(winBitmap);
    state = WIN;
}

// Runs every frame of the win state
void win() {
    // Lock the framerate to 60 fps
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
    	initialize();
    }
}

// Sets up the lose state
void goToLose() {
    drawFullscreenImage(loseBitmap);
    // Printing the number of blocks left
    drawString(98,89, buffer, WHITE);
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {     
    // Lock the framerate to 60 fps
    waitForVBlank();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))  {
        initialize();  
    }
}