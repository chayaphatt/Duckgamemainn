
void drawMainMenu() {
  fill(0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Duck Game", width / 2, height / 2 - 120);

  // Start Button
  buttonX = width / 2 - buttonW / 2;
  buttonY = height / 2 - 30;
  fill(255);
  stroke(0);
  rect(buttonX, buttonY, buttonW, buttonH, 10);
  fill(0);
  textSize(20);
  text("Start Game", width / 2, buttonY + buttonH / 2);

  // Difficulty Selection
  textSize(18);
  fill(0);
  text("Difficulty:", width / 2, buttonY + buttonH + 50);

  int diffButtonW = 100;
  int diffButtonH = 40;
  int spacing = 20;

  String[] labels = { "Easy", "Medium", "Hard" };
  for (int i = 0; i < 3; i++) {
    int x = width / 2 - (diffButtonW * 3 + spacing * 2) / 2 + i * (diffButtonW + spacing);
    int y = buttonY + buttonH + 70;
    fill(difficultyLevel == i ? color(255, 220, 0) : 255);
    stroke(0);
    rect(x, y, diffButtonW, diffButtonH, 8);
    fill(0);
    text(labels[i], x + diffButtonW / 2, y + diffButtonH / 2);
  }

  // Scoreboard
  fill(0);
  textSize(20);
  text("High Scores", width / 2, buttonY + buttonH + 140);
  textSize(16);
  textAlign(CENTER);
  text("Easy: " + highScoreEasy, width / 2, buttonY + buttonH + 170);
  text("Medium: " + highScoreMedium, width / 2, buttonY + buttonH + 190);
  text("Hard: " + highScoreHard, width / 2, buttonY + buttonH + 210);
}

void drawGameOverScreen() {
  background(0, 100, 180);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("Game Over", width / 2, height / 2 - 100);

  textSize(24);
  text("Your Score: " + score, width / 2, height / 2 - 40);
  text("High Scores:", width / 2, height / 2);

  textSize(18);
  text("Easy: " + highScoreEasy, width / 2, height / 2 + 30);
  text("Medium: " + highScoreMedium, width / 2, height / 2 + 50);
  text("Hard: " + highScoreHard, width / 2, height / 2 + 70);

  // Restart Button
  buttonX = width / 2 - buttonW / 2;
  buttonY = height / 2 + 100;
  fill(255);
  stroke(0);
  rect(buttonX, buttonY, buttonW, buttonH, 10);
  fill(0);
  textSize(20);
  text("Restart", width / 2, buttonY + buttonH / 2);

  // Main Menu Button
  fill(255);
  stroke(0);
  rect(buttonX, buttonY + buttonH + 10, buttonW, buttonH, 10);
  fill(0);
  text("Main Menu", width / 2, buttonY + buttonH + 10 + buttonH / 2);
  
  noLoop();
}
