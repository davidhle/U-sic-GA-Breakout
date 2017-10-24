# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 41 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);
void drawImage(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage(const unsigned short *image);


void waitForVBlank();
# 69 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 80 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 120 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);


void initialize();


void goToSplash();
void splash();
void goToTutorial();
void tutorial();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel(int row, int col, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}


void drawRect(int row, int col, int height, int width, unsigned short color) {
    volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
        DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}


void fillScreen(unsigned short color) {
    volatile unsigned short c = color;
    DMANow(3, &c, videoBuffer, (2 << 23) | (240*160));
}


void drawImage(int row, int col, int height, int width, const unsigned short *image) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
    }
}


void drawFullscreenImage(const unsigned short *image) {
    DMANow(3, (unsigned short*) image, videoBuffer, (240*160));

}


void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
