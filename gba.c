#include "gba.h"
#include "font.h"

// Pointer to the start of video memory
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Draws a rectangle in mode 3
void drawRect(int x, int y, int width, int height, volatile unsigned short color) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &color,& videoBuffer[OFFSET(x, y+r, SCREENWIDTH)], DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT | width);
    }
    
}

// Fills the screen in mode 3
void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT | DMA_16 | (SCREENHEIGHT * SCREENWIDTH));

}

// Checks for collision between two rectangles
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}

// Waits until drawing pixel 0 of line 160
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}


void drawChar(int x, int y, char ch, unsigned short color) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel(x + c, y + r, color);
        }
    }
}


void drawString(int x, int y, char *str, unsigned short color) {
    while (*str) {
        drawChar(x, y, *str, color);
        str++;
        x += 6;
    }
}


DMA *dma = (DMA *)0x40000B0;
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = DMA_ON | cnt;
}