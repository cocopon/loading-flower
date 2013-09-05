/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class NormalPetal extends Petal {
  void render(PGraphics pg, float x, float y, float r, float angle, float value) {
    pg.fill(rgb_, alphaRange_.denormalize(value) * 255);
    pg.noStroke();

    pg.pushMatrix();
    pg.translate(x, y);
    pg.rotate(angle);
    pg.translate(r - length_, 0);
    pg.rect(0, -weight_ / 2, length_, weight_, weight_ / 2);
    pg.popMatrix();
  }
}
