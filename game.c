#include "gba.h"
#include "game.h"
#include "sound.h"
#include <stdlib.h>


PLANE player;
PLANE enemies[20];
BULLET bullets[100];


int score;
int spawned;
int enemy_count;
int generate_count;
int bullet_count;

enum{
    ENEMY_RUINED=1,
    ENEMY_ALIVE,
    PLAYER_NORMAL,
    PLAYER_MIDDLE,
    PLAYER_LOW,
    BULLET_ALIVE,
    BULLET_RUINED
};

void initGame() {
    score = 0;
    enemy_count = num_enemies;
    generate_count = 0;
    bullet_count = 0;
    initPlayer();
    initEnemy();
    initBullet();
}

void initPlayer() {
    player.y = 152;
    player.x = 117;
    player.oldy = player.y;
    player.oldx = player.x;
    player.xVelocity = 3;
    player.height = 7;
    player.width = 7;
    player.color = BLUE;
    player.status = 3;
}

void initEnemy(){
    for(int i=0;i<20;i++){
        enemies[i].status = ENEMY_RUINED;
        enemies[i].color = RED;
        enemies[i].width = enemy_width;
        
    }
}

void initBullet(){
    for(int i=0;i<100;i++){
        bullets[i].yVelocity = bullet_speed;
        bullets[i].status = BULLET_RUINED;
    }
}

void updateGame() {
    updatePlayer();
    updateEnemy();
}

void generate_enemies(){
    for(int i=0;i<enemys_per_tick;i++){
        for(int j=0;j<20;j++){
            if (enemies[j].status == ENEMY_RUINED){
                enemies[j].status = ENEMY_ALIVE;
                enemies[j].x = rand() % (SCREENWIDTH - enemy_width);
                enemies[j].y = 0;
                enemies[j].xVelocity = rand() % 2 + 1;
                enemies[j].yVelocity = 1;
                if(rand() % 2 == 0){
                    enemies[j].xVelocity *= -1;
                }
                enemies[j].oldx = enemies[j].x;
                enemies[j].oldy = enemies[j].y;
                break;
            }
        }
    }
}

void generate_bullet(){
    for(int i=0;i<100;i++){
        if(bullets[i].status == BULLET_ALIVE){
            continue;
        }
        bullets[i].status = BULLET_ALIVE;
        bullets[i].oldx = player.x + 2;
        bullets[i].x = player.x + 2;
        bullets[i].y = player.y - 1;
        bullets[i].yVelocity = bullet_speed;
        REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(2);
        REG_SND2FREQ = NOTE_G6 | SND_RESET;
        return;
    }

}


void updatePlayer() {
    bullet_count++;
    player.oldx = player.x;
    player.oldy = player.y;
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x-1 > 0)) {
        player.x -= player.xVelocity;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH-1)) {
        player.x += player.xVelocity;
    } 

    if (BUTTON_HELD(BUTTON_UP)){
        if(bullet_count > emit_time){
            generate_bullet();
            bullet_count = 0;
        }
    }
  
}

void updateEnemy(){
    generate_count--;
    if(generate_count <= 0){
        generate_count = generate_time;
        generate_enemies();
    }

    for(int i=0;i<20;i++){
        if(enemies[i].status == ENEMY_RUINED){
            continue;
        }

        if (enemies[i].y >= SCREENHEIGHT) { 
            enemies[i].status = ENEMY_RUINED;
        }
        if (enemies[i].x <= 0-enemies[i].xVelocity) {
            enemies[i].xVelocity *= -1;
        }
        if (enemies[i].x + enemies[i].width >= 239 - enemies[i].xVelocity) {
            enemies[i].xVelocity *= -1;
        }

        {
            int dx = player.x - enemies[i].x;
            int dy = player.y - enemies[i].y;
            
            if(dx > -1 * player.width && dx < enemy_width && dy > -1 * player.height && dy < enemy_height){
                player.status--;
                enemies[i].status = ENEMY_RUINED;
                drawRect(enemies[i].x,enemies[i].y, enemy_width, enemy_height, BLACK);
		        drawRect(heart_col + (heart_size + heart_space) * player.status, heart_row, heart_size, heart_size, BLACK);

            }
        }
        




        for(int j=0;j<100;j++){
            if(bullets[j].status == BULLET_RUINED){
                continue;
            }

            int dx = bullets[j].x - enemies[i].x;
            int dy = bullets[j].y - enemies[i].y;

            if(dx > -1 * bullet_width && dx < enemy_width && dy > -1 * bullet_height && dy < enemy_height){
                bullets[j].status = BULLET_RUINED;
                enemies[i].status = ENEMY_RUINED;

                score += 1;
                drawRect(enemies[i].x,enemies[i].y, enemy_width, enemy_height, BLACK);
                drawRect(bullets[j].x,bullets[j].y, bullet_width, bullet_height, BLACK);

                REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
                REG_SND2FREQ = NOTE_FS3 | SND_RESET;

            }
        }

        enemies[i].oldx = enemies[i].x;
        enemies[i].oldy = enemies[i].y;
        enemies[i].x += enemies[i].xVelocity;
        enemies[i].y += enemies[i].yVelocity;

        if(enemies[i].x + enemies[i].width >= 239){
            enemies[i].x = 239 - enemies[i].width;
        }

    }

    // handling bullets
    for(int j=0;j<100;j++){
        if(bullets[j].status != BULLET_ALIVE){
            continue;
        }
    
        if(bullets[j].y < -1 * bullet_height){
            bullets[j].status = BULLET_RUINED;
        }

        bullets[j].oldy = bullets[j].y;
        bullets[j].y += bullet_speed;
    }


}

void drawGame() {
    drawPlayer();
    drawBall();
}

void drawPlayer() {
    drawRect(player.oldx, player.oldy, player.width, player.height, BLACK);
    if(player.status == 3){
        drawRect(player.x, player.y, player.width, player.height, COLOR(0,0,31));
    }
    if(player.status == 2){
        drawRect(player.x, player.y, player.width, player.height, COLOR(15,0,31));
    }
    if(player.status == 1){
        drawRect(player.x, player.y, player.width, player.height, COLOR(31,0,31));
    }
    drawRect(player.x, player.y, 2, 3, BLACK);
    drawRect(player.width + player.x - 2, player.y, 2, 3, BLACK);

    // draw heart
    for(int i=0;i<player.status;i++){
		drawRect(heart_col + (heart_size + heart_space) * i, heart_row, heart_size, heart_size, YELLOW);
	}
}

void drawBall() {
    for(int i=0;i<20;i++){
        if(enemies[i].status == ENEMY_RUINED){
            continue;
        }

        drawRect(enemies[i].oldx,enemies[i].oldy, enemy_width, enemy_height, BLACK);
        drawRect(enemies[i].x, enemies[i].y, enemy_width, enemy_height, enemies[i].color);
    }

    for(int i=0;i<100;i++){
        if(bullets[i].status == BULLET_RUINED){
            continue;
        }

        drawRect(bullets[i].oldx,bullets[i].oldy, bullet_width, bullet_height, BLACK);
        drawRect(bullets[i].x, bullets[i].y, bullet_width, bullet_height, GREEN);
    }

    
}
