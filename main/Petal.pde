/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Petal {
  protected color rgb_;
  protected float length_; 
  protected float weight_;
  protected Range alphaRange_;

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

  Range getAlphaRange() {
    return alphaRange_;
  }

  void setAlphaRange(Range range) {
    alphaRange_ = range;
  }

  void render(PGraphics pg, float x, float y, float r, float angle, float value) {
  }
}
