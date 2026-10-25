int waveCount = 5;
float[] waveYBase;
float[] waveAmplitudes;
float[] yOscillationOffsets;
float waveOffset = 0;

void drawWaves() {
  noFill();
  stroke(255, 240);
  strokeWeight(2);
  for (int i = 0; i < waveCount; i++) {
    float base = waveYBase[i];
    float amplitude = waveAmplitudes[i];
    float yOffset = sin(waveOffset + yOscillationOffsets[i]) * 10;
    float yBase = base + yOffset;

    beginShape();
    for (float x = 0; x <= width; x += 10) {
      float y = yBase + sin(TWO_PI * (x / 100.0) + waveOffset + i) * amplitude;
      vertex(x, y);
    }
    endShape();
  }
  waveOffset += 0.02;
}
