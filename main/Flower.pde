/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Flower {
  private int totalPetals_;
  private float x_, y_;
  private float radius_;
  private float value_;
  private Petal petal_;

  Flower(int totalPetals) {
    totalPetals_ = totalPetals;
    setValue(0);
  }

  float getX() {
    return x_;
  }

  void setX(float x) {
    x_ = x;
  }

  float getY() {
    return y_;
  }

  void setY(float y) {
    y_ = y;
  }

  Petal getPetal() {
    return petal_;
  }

  void setPetal(Petal petal) {
    petal_ = petal;
  }

  float getRadius() {
    return radius_;
  }

  void setRadius(float radius) {
    radius_ = radius;
  }

  float getValue() {
    return value_;
  }

  void setValue(float value) {
    value_ = value;
  }

  void draw(PGraphics pg) {
    float value;
    float per;
    float petalValue;
    int i;

    value = getValue();
    value = value - floor(value);

    for (i = 0; i < totalPetals_; i++) {
      per = (float)i / totalPetals_;
      petalValue = (per > value)
        ? per - value
        : 1.0 - (value - per);

      petal_.render(
        pg,
        x_, y_,
        radius_,
        per * 2 * PI,
        petalValue);
    }    
  }
}
