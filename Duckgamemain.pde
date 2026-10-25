void setup() {
  size(800, 800, P3D);
  frameRate(60);

  waveYBase = new float[waveCount];
  waveAmplitudes = new float[waveCount];
  yOscillationOffsets = new float[waveCount];

  for (int i = 0; i < waveCount; i++) {
    waveYBase[i] = map(i, 0, waveCount - 1, 150, height - 50);
    waveAmplitudes[i] = random(8, 20);
    yOscillationOffsets[i] = random(TWO_PI);
  }

  setupDuckColors();
  ducks = new ArrayList<Duck>();

  loadHighScores();
}

void draw() {
  background(0, 150, 255);
  drawWaves();

  if (inMainMenu) {
    drawMainMenu();
    return;
  }

  if (millis() - lastTime >= 1000) {
    timeLeft--;
    lastTime = millis();
  }

  if (timeLeft <= 0) {
    isGameOver = true;
    updateHighScore();
    drawGameOverScreen();
    return;
  }

  int level = (30 - timeLeft) / 10;
  duckCount = 3 + level;
  while (ducks.size() < duckCount) {
    if (random(1) < 0.2) {
      ducks.add(new Bomb());
    } else {
      ducks.add(new Duck());
    }
  }

  for (Duck d : ducks) {
    d.update();
  }

  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("Score: " + score, 10, 20);
  text("High Score: " + getCurrentHighScore(), 10, 40);
  text("Time: " + timeLeft, width - 100, 20);
  text("Difficulty: " + difficulty, width / 2 - 60, 20);
}

void mousePressed() {
  if (inMainMenu) {
    if (mouseX > buttonX && mouseX < buttonX + buttonW &&
        mouseY > buttonY && mouseY < buttonY + buttonH) {
      inMainMenu = false;
      resetGame();
      return;
    }

    // Difficulty Buttons
    int diffButtonW = 100;
    int diffButtonH = 40;
    int spacing = 20;
    int startX = width / 2 - (diffButtonW * 3 + spacing * 2) / 2;
    int y = buttonY + buttonH + 70;
    for (int i = 0; i < 3; i++) {
      int x = startX + i * (diffButtonW + spacing);
      if (mouseX > x && mouseX < x + diffButtonW &&
          mouseY > y && mouseY < y + diffButtonH) {
        difficultyLevel = i;
        if (i == 0) difficulty = "Easy";
        else if (i == 1) difficulty = "Medium";
        else difficulty = "Hard";
      }
    }
    return;
  }

  if (isGameOver) {
    if (mouseX > buttonX && mouseX < buttonX + buttonW &&
        mouseY > buttonY && mouseY < buttonY + buttonH) {
      resetGame();
    } else if (mouseX > buttonX && mouseX < buttonX + buttonW &&
               mouseY > buttonY + buttonH && mouseY < buttonY + 2 * buttonH + 10) {
      inMainMenu = true;
      isGameOver = false;
      loop();
    }
    return;
  }

  for (Duck d : ducks) {
      if (d.checkHit(mouseX, mouseY)) {
      score += d.isSpecial ? 20 : 1;
      if (d instanceof Bomb) {
        score -= 10;
        if (score < 0) score = 0;
      } else {
        score++;
      }
    }
  }
}

void resetGame() {
  score = 0;
  timeLeft = 30;
  lastTime = millis();
  isGameOver = false;
  ducks.clear();

  int baseDucks = 3;
  if (difficultyLevel == 0) duckCount = baseDucks;
  else if (difficultyLevel == 1) duckCount = baseDucks + 1;
  else duckCount = baseDucks + 2;

  for (int i = 0; i < duckCount; i++) {
    ducks.add(new Duck());
  }
  loop();
}



  
