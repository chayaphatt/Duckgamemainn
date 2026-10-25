class Bomb extends Duck {
  Bomb() {
    super();
  }

  @Override
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

        drawBomb(x, appearY, size);
      } else {
        if (millis() - hitTimer < hitEffectDuration) {
          float shake = sin(millis() * 0.05) * 5;
          drawBomb(x + shake, appearY, size);
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

  void drawBomb(float x, float y, int size) {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(150, 0, 0);
    ellipse(0, 0, size, size * 0.8);
    fill(50, 0, 0);
    ellipse(0, 0, size * 0.7, size * 0.5);

    stroke(255, 150, 0);
    strokeWeight(3);
    line(-size*0.2, -size*0.4, size*0.2, -size*0.6);
    popMatrix();
  }
}
