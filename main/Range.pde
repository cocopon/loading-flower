/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Range {
  private float min_;
  private float max_;

  Range(float min, float max) {
    min_ = min;
    max_ = max;
  }

  float getMin() {
    return min_;
  }

  float getMax() {
    return max_;
  }

  float normalize(float value) {
    if (min_ == max_) {
      return -1;
    }

    return (value - min_) / (max_ - min_);
  }

  float denormalize(float value) {
    return min_ + (max_ - min_) * min(max(value, 0.0), 1.0);
  }
}
