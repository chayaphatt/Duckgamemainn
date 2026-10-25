class Duck {
  int x, y;
  float appearY;
  int size;
  boolean isHit = false;
  boolean visible = true;
  boolean animatingUp = true;
  boolean animatingDown = false;
  int appearTime;
  int invisibleTime;
  int lastAppearTime;
  int hitTimer;
 boolean isSpecial = false;
  Duck() {
    respawn();
  }
void update() {
    if (visible) {
      if (!isHit) {
        if (animatingUp) {
          appearY = lerp(appearY, y, 0.1);
          if (abs(appearY - y) < 1) {
            appearY = y;
            animatingUp = false;
          }
        } else if (millis() - lastAppearTime > appearTime) {
          animatingDown = true;
        }

        if (animatingDown) {
          appearY = lerp(appearY, height + 100, 0.07);
          if (appearY > height) {
            visible = false;
            animatingDown = false;
            lastAppearTime = millis();
          }
        }
  if (isSpecial) {
          drawFrog(x, appearY, size);
        } else {
          drawCuteDuck(x, appearY, size);
        }
      } else {
        if (millis() - hitTimer < hitEffectDuration) {
          float shake = sin(millis() * 0.05) * 5;
          if (isSpecial) {
            drawFrog(x + shake, appearY, size);
          } else {
            drawCuteDuck(x + shake, appearY, size);
          }
        } else {
          visible = false;
          lastAppearTime = millis();
        }
      }
    } else {
      if (millis() - lastAppearTime > invisibleTime) {
        respawn();
      }
    }
  }


  void respawn() {
    x = int(random(50, width - 50));
    y = int(random(220, height - 100));
    appearY = height + 100;
    size = fixedDuckSize;
    isHit = false;
    visible = true;
    animatingUp = true;
    animatingDown = false;
    lastAppearTime = millis();

    int speedUp = (30 - timeLeft) / 10;
    int appearSpeedMod = difficultyLevel * 100;
    int invisibleSpeedMod = difficultyLevel * 80;

    appearTime = int(random(1000 - speedUp * 150 - appearSpeedMod, 1600 - speedUp * 150 - appearSpeedMod));
    invisibleTime = int(random(600 - speedUp * 100 - invisibleSpeedMod, 1200 - speedUp * 100 - invisibleSpeedMod));
    isSpecial = random(1) < 0.2; 
}

  boolean checkHit(int mx, int my) {
    if (visible && !isHit && dist(mx, my, x, appearY) < size / 2) {
      isHit = true;
      hitTimer = millis();
      return true;
    }
    return false;
  }
}
