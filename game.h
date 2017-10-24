// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int cDirection;
} PLAYER;

// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	int started;
} BALL;

// Block Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BLOCK;

// Constant
#define BLOCKCOUNT 15

// Variables
extern PLAYER player;
extern BALL ball;
extern BLOCK blocks[BLOCKCOUNT];
extern BLOCK blocks2[BLOCKCOUNT];
extern int blocksRemaining;
extern int loseGame;
extern int gamesLost;

// Prototypes
void initGame();
void initPlayer();
void initBlocks();
void initBall();
void updateGame();
void updatePlayer();
void updateBall();
void updateBlock(BLOCK *);
void drawGame();
void drawPlayer();
void drawBall();
void drawBlock(BLOCK *);