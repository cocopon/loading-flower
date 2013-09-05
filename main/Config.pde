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
    
    float scale = json.getFloat("scale");

    bg_ = getColor(json.getString("background"));
    canvasSize_ = (int)(json.getInt("canvasSize") * scale);
    rotSpeed_ = json.getFloat("rotationSpeed");

    flower_ = new Flower(json.getInt("totalPetals"));
    flower_.setRadius(json.getFloat("radius") * scale);

    Petal petal = new NormalPetal();
    petal.setLength(json.getFloat("petalLength") * scale);
    petal.setWeight(json.getFloat("petalWeight") * scale);
    petal.setRgb(getColor(json.getString("foreground")));
    flower_.setPetal(petal);
  }

  private color getColor(String value) {
    return unhex("ff" + value);
  }
}
