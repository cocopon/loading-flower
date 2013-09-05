/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Config {
  private String baseDir_;
  private color bg_;
  private int canvasSize_;
  private Flower flower_;
  private float rotSpeed_;

  Config(String baseDir) {
    baseDir_ = baseDir;
  }

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
    String configPath = baseDir_ + "/" + path;
    JSONObject json = loadJSONObject(configPath);
    String presetPath = baseDir_ + "/" + json.getString("preset");
    loadPreset(presetPath);
  }

  private void loadPreset(String path) {
    JSONObject json = loadJSONObject(path);
    float scale = json.getFloat("scale");

    bg_ = getColor(json.getString("background"));
    canvasSize_ = (int)(json.getInt("canvasSize") * scale);
    rotSpeed_ = json.getFloat("rotationSpeed");

    flower_ = new Flower(json.getInt("totalPetals"));
    flower_.setRadius(json.getFloat("radius") * scale);

    Petal petal = getPetal(json.getJSONObject("petal"), scale);
    flower_.setPetal(petal);
  }

  private Petal getPetal(JSONObject json, float scale) {
    String type = json.getString("type");
    Petal petal;

    if (type.equals("flexible")) {
      FlexiblePetal flexPetal = new FlexiblePetal();
      flexPetal.setDensity(json.getInt("density"));
      flexPetal.setLengthRange(getRange(json, "lengthRange"));
      flexPetal.setWeightRange(getRange(json, "weightRange"));
      petal = flexPetal;
    }
    else {
      petal = new NormalPetal();
    }

    petal.setLength(json.getFloat("length") * scale);
    petal.setWeight(json.getFloat("weight") * scale);
    petal.setRgb(getColor(json.getString("color")));
    petal.setAlphaRange(getRange(json, "alphaRange"));

    return petal;
  }

  private color getColor(String value) {
    return unhex("ff" + value);
  }

  private Range getRange(JSONObject json, String key) {
    JSONArray value = json.getJSONArray(key);
    return new Range(
        value.getFloat(0),
        value.getFloat(1));
  }
}
