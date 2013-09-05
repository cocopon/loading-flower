/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class FlexiblePetal extends Petal {
  private int density_;
  private Range lengthRange_;
  private Range weightRange_;

  int getDensity() {
    return density_;
  }

  void setDensity(int density) {
    density_ = density;
  }

  Range getLengthRange() {
    return lengthRange_;
  }

  void setLengthRange(Range range) {
    lengthRange_ = range;
  }

  Range getWeightRange() {
    return weightRange_;
  }

  void setWeightRange(Range range) {
    weightRange_ = range;
  }

  void render(PGraphics pg, float x, float y, float r, float angle, float value) {
    float v = abs(pow(value - 0.5, density_)) / pow(0.5, density_);
 
    pg.fill(rgb_, alphaRange_.denormalize(v) * 255);
    pg.noStroke();

    pg.pushMatrix();
    pg.translate(x, y);
    pg.rotate(angle);
    pg.translate(r - length_, 0);
    pg.scale(
        lengthRange_.denormalize(v),
        weightRange_.denormalize(v));
    pg.rect(0, -weight_ / 2, length_, weight_, weight_ / 2);
    pg.popMatrix();
  }
}
