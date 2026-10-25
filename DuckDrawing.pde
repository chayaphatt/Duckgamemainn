void drawCuteDuck(float x, float y, int size) {
  pushMatrix();
  translate(x, y);

  int colorIndex = constrain(score, 0, 99) / 10;
  fill(duckColors[colorIndex]);
  noStroke();

  ellipse(0, 0, size, size * 0.8);
  fill(duckColors[colorIndex] - 40);
  ellipse(size * 0.2, 0, size * 0.3, size * 0.3);

  fill(duckColors[colorIndex]);
  ellipse(-size * 0.35, -size * 0.4, size * 0.5, size * 0.5);

  fill(0);
  ellipse(-size * 0.4, -size * 0.45, size * 0.07, size * 0.07);
  fill(255);
  ellipse(-size * 0.395, -size * 0.455, size * 0.03, size * 0.03);

  fill(255, 150, 0);
  triangle(-size * 0.55, -size * 0.4, -size * 0.75, -size * 0.35, -size * 0.75, -size * 0.45);

  fill(duckColors[colorIndex] - 30);
  triangle(size * 0.45, 0, size * 0.65, -10, size * 0.65, 10);

  popMatrix();
}
void drawFrog(float x, float y, int size) {
  pushMatrix();
  translate(x, y);

  fill(50, 200, 50);
  noStroke();
  ellipse(0, 0, size * 0.9, size * 0.6);

  fill(80, 255, 80);
  ellipse(0, -size * 0.4, size * 0.8, size * 0.7);

  fill(255);
  ellipse(-size * 0.25, -size * 0.5, size * 0.25, size * 0.25);
  ellipse(size * 0.25, -size * 0.5, size * 0.25, size * 0.25);

  fill(0);
  ellipse(-size * 0.25, -size * 0.5, size * 0.1, size * 0.1);
  ellipse(size * 0.25, -size * 0.5, size * 0.1, size * 0.1);

  fill(0);
  ellipse(-size * 0.1, -size * 0.25, size * 0.05, size * 0.05);
  ellipse(size * 0.1, -size * 0.25, size * 0.05, size * 0.05);

  stroke(0, 180, 0);
  strokeWeight(3);
  noFill();
  arc(0, -size * 0.15, size * 0.5, size * 0.3, 0, PI);

  noStroke();
  fill(255);
  for (float px = -size * 0.3; px < size * 0.4; px += size * 0.15) {
    for (float py = -size * 0.1; py < size * 0.3; py += size * 0.15) {
      ellipse(px, py, size * 0.07, size * 0.07);
    }
  }
  popMatrix();
}
