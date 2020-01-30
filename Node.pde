class Node {
  public boolean isVisible;
  private int seed;

  public PVector position;
  public PShape model;

  public color stroke;
  public color fill;

  public float size;
  public float rotation;

  public Node(int seed, int index) {
    this.isVisible = true;
    this.seed = seed;

    randomSeed(index);
    this.position = new PVector(random(1000), random(1000), random(1000));
    this.model = new PShape();

    this.stroke = color(seed % 1000, seed % 1000 / index, seed % 100 * index);
    this.fill = color(seed % 100 * index, seed % 1000 / index, seed % 1000);

    randomSeed(seed);
    this.size = random(20, 100);
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
      popMatrix();

      rotation += random(random(1, 5));
    }
  }
}
