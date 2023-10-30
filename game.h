#define bullet_speed -2
#define enemys_per_tick 3
#define bullet_width 2
#define bullet_height 4
#define num_enemies 20
#define enemy_width 5
#define enemy_height 5
#define generate_time 180
#define emit_time 20

#define heart_row 2
#define heart_col 2
#define heart_size 5
#define heart_space 3


// struct of planes, contains both enemy and player
typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int width;
    int height;
    unsigned short color;
    int xVelocity;
    int yVelocity;
    int status;
} PLANE;

typedef struct{
    int x;
    int y;
    int oldx;
    int oldy;
    int yVelocity;
    int status;
} BULLET;


// variables
extern PLANE player;
extern PLANE enemies[20];
extern int score;

// function prototypes
void initGame();
void initPlayer();
void initEnemy();
void updateGame();
void updatePlayer();
void updateBall();
void drawGame();
void drawPlayer();
void drawBall();
void generate_enemies();
void updateEnemy();