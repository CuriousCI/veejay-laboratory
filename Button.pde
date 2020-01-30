class Button extends Label {
  public Button() {
    super();
  }

  public Button(String text, float x, float y, float _width, float _height) {
    super(text, x, y, _width, _height);
  }

  public boolean hasMouseInside() {
    return
      mouseX > this.getX() &&
      mouseX < this.getX() + this.getWidth() &&
      mouseY > this.getY() && 
      mouseY < this.getY() + this.getHeight();
  }

  public boolean isClicked() {
    return this.hasMouseInside() && mousePressed && this.isVisible();
  }

  @Override
    protected void displayBackground() {
    fill(255, 255, 255, 50);
    stroke(#FFFFFF);
    strokeWeight(5);
    rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
  }

  @Override
    public void displayObject() {
    super.displayObject();
    //if (this.hasMouseInside()) {
    //  //fill(#EEDDDD, 100);
    //  //strokeWeight(1);
    //  noStroke();
    //  fill(#FFFFFF);
    //  rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
    //}
  }
}
