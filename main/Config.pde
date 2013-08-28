/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Config {
  private color bg_;
  private int canvasSize_;
  private Flower flower_;
  private float rotSpeed_;

  color getBackground() {
    return bg_;
  }

  int getCanvasSize() {
    return canvasSize_;
  }

  Flower getFlower() {
    return flower_;
  }

  float getRotationSpeed() {
    return rotSpeed_;
  }

  void load(String path) {
    JSONObject json = loadJSONObject(path);

    bg_ = getColor(json.getString("background"));
    canvasSize_ = json.getInt("canvasSize");
    rotSpeed_ = json.getFloat("rotationSpeed");

    flower_ = new Flower(json.getInt("totalPetals"));
    flower_.setRadius(json.getFloat("radius"));

    Petal petal = new Petal();
    petal.setLength(json.getFloat("petalLength"));
    petal.setWeight(json.getFloat("petalWeight"));
    petal.setRgb(getColor(json.getString("foreground")));
    flower_.setPetal(petal);
  }

  private color getColor(String value) {
    return unhex("ff" + value);
  }
}
