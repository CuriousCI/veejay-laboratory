class Node {
  public boolean isVisible;

  public PVector position;
  public PShape model;

  public color stroke;

  public float size;
  public float rotation;

  public Node() {
    this.isVisible = true;

    this.position = new PVector(random(1000), random(1000), random(1000));
    this.model = new PShape();

    this.stroke = color(random(255), random(255), random(255));

    this.size = random(75);
    this.rotation = 0;
  }

  public void display() {
    if (this.isVisible) {
      pushMatrix();
      translate(this.position.x, this.position.y, this.position.z);
      rotateY(radians(rotation));

      stroke(this.stroke);
      fill(this.stroke);

      box(this.size);
      popMatrix();

      rotation += random(0.1, 2);
    }
  }
}
