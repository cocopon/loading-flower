/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
static final String CONFIG_BASE_DIR = "..";
static final String CONFIG_FILE = "config.json";
static final String OUTPUT_DIR = "../tmp";

Config config_;
PGraphics pg_;
Exporter exporter_;


void setup() {
  smooth();
  frameRate(30);
  rectMode(CENTER);
  shapeMode(CENTER);

  config_ = new Config(CONFIG_BASE_DIR);
  config_.load(CONFIG_FILE);

  int size = config_.getCanvasSize();
  size(size, size);

  Flower flower = config_.getFlower();
  flower.setX(width / 2);
  flower.setY(height / 2);

  pg_ = createGraphics(width, height, JAVA2D);
  pg_.rectMode(CENTER);

  int totalFrames = (int)(1.0 / config_.getRotationSpeed());
  exporter_ = new Exporter(pg_, OUTPUT_DIR, totalFrames);
}


void draw() {
  clear();

  pg_.beginDraw();
  pg_.background(config_.getBackground());

  Flower flower = config_.getFlower();
  flower.draw(pg_);
  flower.setValue(flower.getValue() + config_.getRotationSpeed());

  pg_.endDraw();
  image(pg_, 0, 0);

  if (!exporter_.export()) {
    exit();
  }
}
