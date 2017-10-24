#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "BallUp.h"
#include "BallDown.h"
#include "BallLeft.h"
#include "BallRight.h"

// Variables
PLAYER player;
BALL ball;
BLOCK blocks[BLOCKCOUNT];
BLOCK blocks2[BLOCKCOUNT];
int blocksRemaining;
int loseGame;
int gamesLost;

void initGame () {
	initPlayer();
	initBall();
	initBlocks();
	// Begin the logic for blocks that are active/erased
	blocksRemaining = BLOCKCOUNT * 2;
	// So that the user can also start a new game after losing
	loseGame = 0;
}

// Initialize Player's Attributes
void initPlayer() {
	player.row = 153;
	player.col = 110;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = (3/2);
	player.height = 4;
	player.width = 25;
	player.color = NAVY;
}

// Initialize pool of blocks
void initBlocks() {
	int row = 5;
	int row2 = 50;
	for (int i = 0; i < BLOCKCOUNT; i++) {
		// Update row every 5 blocks
		if (!(i % 5) && i != 0) {
			row += 15;
		}
		// Alternating colored blocks
		if(i % 2) {
			blocks[i].color = BLACK;
		} else {
			blocks[i].color = RED;
		}
		// Initialize attributes
		blocks[i].height = 10;
		blocks[i].width = 40;
		blocks[i].row = row;
		blocks[i].active = 1;
		blocks[i].erased =  0;
		// Mod since col will eventually be greater than 240
		blocks[i].col = (4 + ((blocks[i].width + 8) * i )) % SCREENWIDTH;
	}
	for (int i = 0; i < BLOCKCOUNT; i++) {
		// Update row every 5 blocks
		if (!(i % 5) && i != 0) {
			row2 += 15;
		}
		// Alternating colored blocks
		if(i % 2) {
			blocks2[i].color = RED;
		} else {
			blocks2[i].color = BLACK;
		}
		// Initialize attributes
		blocks2[i].height = 10;
		blocks2[i].width = 40;
		blocks2[i].row = row2;
		blocks2[i].active = 1;
		blocks2[i].erased =  0;
		// Mod since col will eventually be greater than 240
		blocks2[i].col = (4 + ((blocks[i].width + 8) * i )) % SCREENWIDTH;
	}

}

// Initialize Ball's Attributes
void initBall() {
	ball.height = 10;
	ball.width = 10;
	ball.row = player.row - 10;
	ball.col = player.col + 5;
	ball.rdel = 1;
	ball.cdel = 1;
	ball.oldRow = ball.row;
	ball.oldCol = ball.col;
	ball.started = 0;
}

// Calls the update functions on ALL the structs every frame
void updateGame() {
	updatePlayer();
	updateBall();
	for (int i = 0; i < 15; i++) {
		updateBlock(&blocks[i]);
		updateBlock(&blocks2[i]);
	}
}

// Handles player movement and cDirection handles which direction the ball goes
void updatePlayer() {
	if (BUTTON_HELD(BUTTON_LEFT) 
		&& player.col >= player.cdel) {
		player.col -= player.cdel;
		player.cDirection = -1;
	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width - 1 < SCREENWIDTH - player.cdel) {
		player.col += player.cdel;
		player.cDirection = 1;
	} else {
		player.cDirection = 0;
	}
}

void updateBall() {
	// Releases ball from paddle
	if (BUTTON_PRESSED(BUTTON_A) && !ball.started) {
		ball.started = 1; // So that this and first if statement only happen once
		ball.cdel *= player.cDirection;
		ball.rdel *= -1;
	} else if (!ball.started) { // When ball hasn't been released yet
		if (BUTTON_HELD(BUTTON_LEFT)
			&& ball.col >= ball.cdel + 5) {
				ball.oldCol = ball.col;
				ball.col -= ball.cdel * (3/2);
		} else if (BUTTON_HELD(BUTTON_RIGHT)
			&& ball.col + ball.width - 1 < SCREENWIDTH - ball.cdel - 5) {
			ball.oldCol = ball.col;
				ball.col += ball.cdel * (3/2);
		}
	} else if (BUTTON_PRESSED(BUTTON_A) && ball.started) { // for faster wins
		ball.cdel /= 2;
	} else { // Once ball is released
		ball.oldCol = ball.col;
		ball.oldRow = ball.row;
		ball.row += ball.rdel;
		ball.col += ball.cdel;
		// Collision With Walls and Player
		if (ball.row <= 1) {
			ball.rdel *= -1;
		} else if (collision(ball.row, ball.col, ball.height, ball.width,
										player.row - 2, player.col, player.height, player.width)) {
			ball.rdel *= -1;
			ball.cdel = player.cDirection;
		}
		// Ball touches sides of screen
		if (ball.col <= 1 || ball.col + ball.width-1 >= SCREENWIDTH-2) {
			ball.cdel *= -1;
		}
		// Hitting the grounds leads to lose
		if (ball.row == 150) {
			loseGame = 1;
			gamesLost++;
		}
	}
}

void updateBlock(BLOCK* block) {
	if (block -> active && collision(block -> row, block -> col, block -> height, block -> width,
		ball.row, ball.col, ball.height, ball.width)) {
		// Put block back in the pool
		block -> active = 0;
		ball.cdel *= -1;
		ball.rdel *= -1;
		// Update the score
		blocksRemaining--;
	}
}

// Runs every frame
void drawGame() {
	drawPlayer();
	drawBall();
	// Draw all of the blocks
	for (int i = 0; i < BLOCKCOUNT; i++) {
		drawBlock(&blocks[i]);
		drawBlock(&blocks2[i]);
	}
}

void drawPlayer() {
	// erases player from old location and draws into new one
	drawRect(player.oldRow, player.oldCol, player.height, player.width, WHITE);
	drawRect(player.row, player.col, player.height, player.width, player.color);
	player.oldRow = player.row;
	player.oldCol = player.col;
}

void drawBall() {
	// Erases old location of ball and draws into new location
	drawRect(ball.oldRow, ball.oldCol, ball.height, ball.width, WHITE);
	// Ball going in the up direction
	if (!ball.started || (ball.rdel < 0)) {
		drawImage(ball.row, ball.col, ball.height, ball.width, BallUpBitmap);
	}
	// Ball going in the down direction
	if (ball.started && ball.rdel > 0) {
		drawImage(ball.row, ball.col, ball.height, ball.width, BallDownBitmap);
	}
	// Ball going in the left direction
	if (ball.started && ball.cdel < 0) {
		drawImage(ball.row, ball.col, ball.height, ball.width, BallLeftBitmap);
	}
	// Ball going in the right direction
	if (ball.started && ball.cdel > 0) {
		drawImage(ball.row, ball.col, ball.height, ball.width, BallRightBitmap);
	}
}

void drawBlock(BLOCK* block) {
	// connects with collision logic so that if a block should be erased, it is erased
	if(block -> active) {
		drawRect(block -> row, block -> col, block -> height, block -> width, block -> color);
	} else if (!block -> erased) {
		drawRect(block -> row, block -> col, block -> height, block -> width, WHITE);
		block -> erased = 1;
	}
}
