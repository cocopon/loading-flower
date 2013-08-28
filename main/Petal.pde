/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Petal {
  private color rgb_;
  private float length_; 
  private float weight_;

  color getRgb() {
    return rgb_;
  }

  void setRgb(color rgb) {
   rgb_ = rgb;
  }

  float getLength() {
    return length_;
  }

  void setLength(float length) {
    length_ = length;
  }

  float getWeight() {
    return weight_;
  }

  void setWeight(float weight) {
    weight_ = weight;
  }

  void render(PGraphics pg, float x, float y, float r, float angle, float value) {
    pg.fill(rgb_, value * 255);
    pg.noStroke();

    pg.pushMatrix();
    pg.translate(x, y);
    pg.rotate(angle);
    pg.translate(r - length_, 0);
    pg.rect(0, -weight_ / 2, length_, weight_, weight_ / 2);
    pg.popMatrix();
  }
}
