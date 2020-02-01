class Node {
  public boolean isVisible;
  private int seed;
  public int rare;

  public PVector position;
  public PShape model;

  public color stroke;
  public color fill;

  public float size;
  public float rotation;

  public Node(int seed, int index/*, String filename*/) {
    this.isVisible = true;

    randomSeed(seed / 100 + index * 123291);
    this.position = new PVector(random(3000), random(3000), random(3000));
    //this.model = loadShape(filename);

    randomSeed(seed);
    this.rare = int(random(1, 20));

    if (rare <= 3) {
      this.stroke = color(#FFFFFF);
      this.fill = color(#505050);
    } else if (rare >= 15) {
      this.fill = color(0, 0, 0, 0);
      this.stroke = color(seed % 1000, seed % 1000 / index, seed % 100 * index);
    } else {
      this.stroke = color(seed % 1000, seed % 1000 / index, seed % 100 * index);
      this.fill = color(seed % 100 * index, seed % 1000 / index, seed % 1000);
    }

    randomSeed(seed + index);
    this.size = random(20, 100);
    if (rare <= 3) {
      this.size = 300;
    }
    this.rotation = 0;
  }

  public void display() {
    if (this.isVisible) {
      pushMatrix();
      translate(this.position.x, this.position.y, this.position.z);
      rotateY(radians(rotation));

      stroke(this.stroke);
      fill(this.fill);

      box(this.size);
      //shape(this.model);
      popMatrix();

      if (rare > 5 && rare < 15) {
        rotation += random(1, 5);
      } else if (rare >= 15) {
        rotation += random(15, 20);
      } else if (rare == 1) {
        rotation -= random(3, 7);
      }
    }
  }
}
