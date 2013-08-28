/*
 * LoadingFlower
 * (C) 2013 cocopon.
 *
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
class Exporter {
  private static final String FILE_EXT = ".png";

  private PGraphics pg_;
  private String dir_;
  private int total_;
  private int index_;

  Exporter(PGraphics pg, String dir, int total) {
    total_ = total;
    dir_ = dir;
    pg_ = pg;
  }

  boolean export() {
    if (index_ >= total_) {
      return false;
    }

    pg_.save(dir_ + "/" + nf(index_, 3) + FILE_EXT);
    index_++;

    return true;
  }
}
