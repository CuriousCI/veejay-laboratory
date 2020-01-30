ArrayList<Node> nodes;
int nodesCount;
int focusedElementIndex;

PVector cameraEye, cameraDirection;

Panel mainMenu; 

boolean updateVector(PVector start, PVector end) {
  int speed = 20;

  if (start.dist(end) > speed) {
    start.x += (end.x - start.x) / speed;
    start.y += (end.y - start.y) / speed;
    start.z += (end.z - start.z) / speed;
    return true;
  } else {
    return false;
  }
}

void settings() {
  size(640, 400, P3D);
}

void setup() {
  mainMenu = new Panel(0, 0, width, height) {
    @Override
      protected void displayBackground() {
      fill(#FFFFFF);
      stroke(#AA0000);
      strokeWeight(0.1);
      rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
    }
  };

  focusedElementIndex = 1;

  nodes = new ArrayList<Node>();
  nodesCount = 5;
  for (int _ = 0; _ < nodesCount; _++) {
    nodes.add(new Node());
  }
  for (Node alpha : nodes) {
    for (Node beta : nodes) {
      if (alpha.position.dist(beta.position) < 150) {
        alpha.position.add(beta.position);
      }
    }
  }

  cameraEye = new PVector(0, 0, 0);
  cameraDirection = new PVector(0, 0, 0);
}

void draw() {
  background(0);

  if (mainMenu.isVisible()) {
    mainMenu.display();
  } else {

    lights();

    if (!updateVector(cameraDirection, nodes.get(focusedElementIndex + 1).position)) {
      if (!updateVector(cameraEye, nodes.get(focusedElementIndex).position)) {
        focusedElementIndex++;
        if (focusedElementIndex == nodesCount - 1) {
          focusedElementIndex = 0;
        }
      }
    }

    camera(
      cameraEye.x, 
      cameraEye.y, 
      cameraEye.z, 
      cameraDirection.x, 
      cameraDirection.y, 
      cameraDirection.z, 
      0, 1, 0);

    for (Node node : nodes) {
      node.display();
    }
  }
}
