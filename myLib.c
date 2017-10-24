#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen
void setPixel(int row, int col, unsigned short color) {
	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// Draw a rectangle at the specified location and size
void drawRect(int row, int col, int height, int width, unsigned short color) {
    volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
        DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
    }
}

// Fill the entire screen with a single color
void fillScreen(unsigned short color) {
    volatile unsigned short c = color;
    DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | (240*160));
}

// Draw an image at the specified location and size
void drawImage(int row, int col, int height, int width, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET(row + r, col, 240)], width);
    }
}

// Fill the entire screen with an image
void drawFullscreenImage(const unsigned short *image) {
    DMANow(3, (unsigned short*) image, videoBuffer, (240*160));

}

// Pause code execution until vertical blank begins
void waitForVBlank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}