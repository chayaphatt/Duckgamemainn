int score = 0;
int highScoreEasy = 0;
int highScoreMedium = 0;
int highScoreHard = 0;
int timeLeft = 30;
int lastTime = 0;
boolean isGameOver = false;
boolean inMainMenu = true;

int buttonX, buttonY, buttonW = 180, buttonH = 50;

int hitEffectDuration = 300;

color[] duckColors;
ArrayList<Duck> ducks;
int duckCount = 3;
int fixedDuckSize = 80;

String difficulty = "Medium";
int difficultyLevel = 1;

String highScoreFile = "high_scores.txt";

void setupDuckColors() {
  duckColors = new color[10];
  duckColors[0] = color(255, 255, 0);
  duckColors[1] = color(255, 200, 0);
  duckColors[2] = color(255, 150, 0);
  duckColors[3] = color(255, 100, 50);
  duckColors[4] = color(255, 80, 80);
  duckColors[5] = color(255, 50, 100);
  duckColors[6] = color(255, 100, 200);
  duckColors[7] = color(150, 100, 255);
  duckColors[8] = color(100, 200, 255);
  duckColors[9] = color(0, 220, 180);
}
