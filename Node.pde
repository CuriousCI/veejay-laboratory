class Node {
  public boolean isVisible;
  private int seed;
  private int index;

  public PVector position;
  public PShape model;

  public color stroke;
  public color fill;

  public float size;
  public float rotation;

  public Node(int seed, int index) {
    this.isVisible = true;
    this.seed = seed;
    this.index = index;

    //this.position = new PVector(random(1000), random(1000), random(1000));
    this.position = new PVector(seed % 10, (seed % 100) / 10, (seed % 1000) / 100);
    this.model = new PShape();

    this.stroke = color(seed % 1000, seed % 1000 / index, seed % 100 * index);
    this.fill = color(seed % 100 * index, seed % 1000 / index, seed % 1000);

    this.size = random(seed % 100 + 20);
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

      rotation += random(this.seed % 10 / 2);
    }
  }
}
