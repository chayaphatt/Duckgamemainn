int getCurrentHighScore() {
  if (difficultyLevel == 0) return highScoreEasy;
  if (difficultyLevel == 1) return highScoreMedium;
  return highScoreHard;
}

void updateHighScore() {
  boolean updated = false;
  if (difficultyLevel == 0 && score > highScoreEasy) {
    highScoreEasy = score;
    updated = true;
  } else if (difficultyLevel == 1 && score > highScoreMedium) {
    highScoreMedium = score;
    updated = true;
  } else if (difficultyLevel == 2 && score > highScoreHard) {
    highScoreHard = score;
    updated = true;
  }
  if (updated) saveHighScores();
}

void loadHighScores() {
  String[] lines = loadStrings(highScoreFile);
  if (lines != null && lines.length >= 3) {
    highScoreEasy = int(lines[0]);
    highScoreMedium = int(lines[1]);
    highScoreHard = int(lines[2]);
  }
}

void saveHighScores() {
  String[] lines = {
    str(highScoreEasy),
    str(highScoreMedium),
    str(highScoreHard)
  };
  saveStrings(highScoreFile, lines);
}
