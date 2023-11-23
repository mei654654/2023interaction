//障礙物跟紅點的陣列
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Reddot> reddots = new ArrayList<Reddot>();
Lilyellow lilyellow;

void setup() {
  size(800, 600);

  initializeObstacles();
  initializeCherries();
  // add initialized reddots and obstacles lists into the pacman
  // so it knows what to eat and what to collide against
  lilyellow = new Lilyellow(120, 150, 100, obstacles, reddots);
}

void initializeObstacles() {
  obstacles.add(new Obstacle(0, 0, width, 50));
  obstacles.add(new Obstacle(0, 0, 50, height));
  obstacles.add(new Obstacle(0, height - 50, width, height));
  obstacles.add(new Obstacle(width - 50, 0, width, height));
  obstacles.add(new Obstacle(200, 0, 50, 400));
  obstacles.add(new Obstacle(400, 350, 50, 200));
  obstacles.add(new Obstacle(600, 200, width, 50));
}

void initializeCherries() {
  reddots.add(new Reddot(120, 500, 50));
  reddots.add(new Reddot(400, 150, 50));
  reddots.add(new Reddot(600, 400, 50));
  reddots.add(new Reddot(700, 100, 50));
}

void draw() {
  background(255);  // white background

  lilyellow.update();
  lilyellow.draw();

  for (Obstacle o : obstacles) {
    o.draw();
  }
  for (Reddot c : reddots) {
    c.draw();
  }
}

void keyPressed() {
  if (key == 'r') { // 刷新櫻桃
    initializeCherries();
  }

  if (keyCode == UP) {
    lilyellow.up();
  }
  if (keyCode == DOWN) {
    lilyellow.down();
  }
  if (keyCode == LEFT) {
    lilyellow.left();
  }
  if (keyCode == RIGHT) {
    lilyellow.right();
  }
  if (key == ' ') {
    lilyellow.stop();
  }
}

class Obstacle {
  int x, y, w, h;

  public Obstacle(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  void draw() {
    rect(x, y, w, h);
  }
}

class Reddot {
  int x, y, size;
  boolean eaten = false;

  public Reddot(int _x, int _y, int _size) {
    x = _x;
    y = _y;
    size = _size;
  }

  void draw() {
    // draw cherry if not eaten yet
    if (!eaten) {
      fill(#F00505);
      ellipse(x, y, size, size);
    }
  }
}


class Lilyellow {
  // 宣告位置跟大小
  int x, y, size;
  // 張嘴（或閉嘴）
  boolean isOpening = true;
  // 運動方向（以度為單位）
  float direction = 90;

  // current mouth position in degrees
  float mouthDegrees = 0;
  // how much mouth can be open (so it simply goes from 0 to 45 degrees and back to 0 and again)
  float mouthMaxDegrees = 45;

  // how many steps in mouth opening animation
  int mouthOpeningSteps = 15;
  float mouthPositionStep = mouthMaxDegrees / mouthOpeningSteps;

  // movement vectors
  float dx, dy = 0;
  // how many pixels to move in either direction
  float moveStep = 5;

  ArrayList<Obstacle> obstacles;
  ArrayList<Reddot> reddots;

  public Lilyellow(int _x, int _y, int _size, ArrayList<Obstacle> _obstacles, ArrayList<Reddot> _cherries) {
    x = _x;
    y = _y;
    size = _size;
    obstacles = _obstacles;
    reddots = _cherries;
  }

  void draw() {
    // A bit of translation magic to get mouth animation done only for one position.
    // So pacman is drawn always in the (0,0) position and translated according to position on
    // the screen. Also, depending on the direction of movement, rotation is applied.
    pushMatrix();

    translate(x, y);
    rotate(radians(direction));

    // shape of pacman
    fill(#FFE75A);
    strokeWeight(3);

    arc(0, 0, size, size, radians(mouthDegrees), radians(360 - mouthDegrees), PIE);

    // eye
    fill(0);

    // we don't want to have eye below the mouth when direction is to the left hence this
    if (direction == 180) {
      ellipse(0 + 5, 0 + 20, 5, 5);
    } else {
      ellipse(0 + 5, 0 - 20, 5, 5);
    }

    popMatrix();
  }

  void update() {
    if (isOpening) {
      mouthDegrees += mouthPositionStep;
    } else {
      mouthDegrees -= mouthPositionStep;
    }

    // swap from opening to closing
    if (isOpening && mouthDegrees >= mouthMaxDegrees) {
      isOpening = false;
    }
    // swap from closing to opening
    if (!isOpening && mouthDegrees <= 0) {
      isOpening = true;
    }

    // if colides - stop, otherwise keep moving
    if (collides(x + dx, y + dy)) {
      stop();
    } else {
      x += dx;
      y += dy;
    }

    // eat whatever is in range to be eaten
    eat();
  }

  void up() {
    direction = 270;
    dx = 0;
    dy = -moveStep;
  }

  void down() {
    direction = 90;
    dx = 0;
    dy = moveStep;
  }

  void left() {
    direction = 180;
    dx = -moveStep;
    dy = 0;
  }

  void right() {
    direction = 0;
    dx = moveStep;
    dy = 0;
  }

  void stop() {
    dx = 0;
    dy = 0;
  }
 
  // Colision detection for obstacles - these are rectangles so we're checking
  // Lilyellow's FUTURE position (note nextX, nextY) with position of any of obstacles.
  // If FUTURE position will be in the collision return true otherwise false
  // (It's best to draw it on the paper to understand or show and tell).
  boolean collides(float nextX, float nextY) {
    for (Obstacle o : obstacles) {
      if ((nextX + (size / 2) >= o.x) && (nextX - (size / 2) <= o.x + o.w)
        && (nextY + (size / 2) >= o.y) && (nextY - (size / 2) <= o.y + o.h)
        ) {
        return true;
      }
    }
    return false;
  }

  // As above, but with circles. If collides in CURRENT position, mark cherry as eaten.
  void eat() {
    for (Reddot c : reddots) {
      if ((x + (size / 2) >= (c.x - (c.size/ 2))) && (x - (size / 2) <= c.x + (c.size /2))
        && (y + (size / 2) >= (c.y  - (c.size / 2))) && (y - (size / 2) <= c.y + (c.size / 2))) {
        c.eaten = true;
      }
    }
  }
}
