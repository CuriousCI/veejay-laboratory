public class TextBox extends Button {
  private boolean edited;

  public TextBox() {
    super();
  }

  public TextBox(String text, float x, float y, float _width, float _height) {
    super(text, x, y, _width, _height);

    this.edited = false;
  }

  public boolean isEdited() {
    return this.edited;
  }

  public void edit() {
    if (this.isEdited()) {
      if (keyPressed) {
        if (int(key) == 65535) {
          if (this.getText().length() > 0) {
            this.setText(this.getText().substring(0, this.getText().length() - 1));
          }
        } else {
          this.setText(this.getText() + key);
        }
        keyPressed = false;
      } else if (!this.hasMouseInside() && mousePressed) {
        this.edited = false;
        closeKeyboard();
      }
    } else {
      if (this.isClicked()) {
        this.edited = true;
        openKeyboard();
      }
    }
  }

  @Override
    public void displayObject() {
    if (this.hasMouseInside()) {
      stroke(#FFFFFF);
      strokeWeight(1);
      fill(#000000);
      rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
    }
    super.displayObject();
  }
}
