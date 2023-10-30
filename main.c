#include <stdlib.h>
#include <stdio.h>
#include "font.h"
#include "gba.h"
#include "game.h"
#include "sound.h"

void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

void srand();

char buffer[41];

// states
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

unsigned short buttons;
unsigned short oldButtons;

int rSeed;

int main()
{
    initialize();

    while (1)
    {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (state) {
            case START:
                start();
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

void initialize()
{
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);
    buttons = REG_BUTTONS;
    oldButtons = 0;
    goToStart();
}

void goToStart() {
    fillScreen(TEAL);
    drawString(100, 60, "WELCOME ", GREEN);
    drawString(116, 80, "TO ", GREEN);
    drawString(100, 100, "STARWAR ", GREEN);
    state = START;
    rSeed = 0;
}

void start() {
    rSeed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
        goToGame();
        initGame();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}

void game() {
    updateGame();
    sprintf(buffer, "score: %u", score);
    waitForVBlank();
    drawGame();
    drawRect(220, 1, 18, 8, BLACK);
    drawString(180, 1, buffer, YELLOW);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (player.status <= 0) {
        goToLose();
    }
    if (score == 10) {
        goToWin();
    }
}

void goToPause() {
    fillScreen(SKYBLUE);
    drawString(75, 75, "Game Now Pausing", YELLOW); 
    waitForVBlank();
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    fillScreen(GREEN);
    drawString(90, 75, "YOU WIN!", BLACK);
    waitForVBlank();
    state = WIN;
}
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(ROGUE);
    drawString(90, 75, "YOU LOSE!", YELLOW);
    waitForVBlank();
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}