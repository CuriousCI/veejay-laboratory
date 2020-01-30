int seed;

ArrayList<Node> nodes;
int nodesCount;
int focusedElementIndex;

PVector cameraEye, cameraDirection;

Panel mainMenu; 
Button start;
Label name;
TextBox nameInput;

int calculateSeed(String name) {
  int result = 0;
  for (int index = 0; index < name.length(); index++) {
    result += int(name.charAt(index) * 39);
  }
  return result;
}

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

void updateCamera() {
  camera(
    cameraEye.x, 
    cameraEye.y, 
    cameraEye.z, 
    cameraDirection.x, 
    cameraDirection.y, 
    cameraDirection.z, 
    0, 1, 0);
}

void updateFocus() {
  if (!updateVector(cameraDirection, nodes.get(focusedElementIndex + 1).position)) {
    if (!updateVector(cameraEye, nodes.get(focusedElementIndex).position)) {
      focusedElementIndex++;
      if (focusedElementIndex == nodesCount - 1) {
        focusedElementIndex = 0;
      }
    }
  }
}

void displayGraph() {
  for (Node node : nodes) {
    node.display();
  }
}

void setupNodes() {
  focusedElementIndex = 1;

  nodes = new ArrayList<Node>();
  if (seed % 10 >= 5) {
    nodesCount = seed % 10;
  } else {
    nodesCount = 5;
  }
  for (int index = 0; index < nodesCount; index++) {
    nodes.add(new Node(seed, index + 1));
  }

  cameraEye = new PVector(0, 0, 0);
  cameraDirection = new PVector(0, 0, 0);
}

void settings() {
  fullScreen(P3D);
}

void setup() {
  orientation(LANDSCAPE);
  frameRate(60);

  PFont font = loadFont("Monospaced.plain-200.vlw");
  textFont(font);
  textAlign(LEFT, CENTER);

  seed = 0;

  name = new Label("nome", width * 0.1, height * 0.1, width * 0.8, height * 0.12);
  nameInput = new TextBox("", width * 0.1, height * 0.25, width * 0.8, height * 0.1);
  start = new Button("start", width * 0.1, height * 0.45, width * 0.8, height * 0.4);
  mainMenu = new Panel(0, 0, width, height);

  mainMenu.add(start);
  mainMenu.add(name);
  mainMenu.add(nameInput);
}

void draw() {
  background(0);

  if (mainMenu.isVisible()) {
    mainMenu.display();
    execute();
  } else {
    lights();

    textSize(height * 0.5);
    text(nameInput.getText(), width * 0.05, width * 0.05);

    updateCamera();
    updateFocus();
    displayGraph();
  }
}

void keyPressed() {
  nameInput.edit();
}

void execute() {
  if (start.isClicked()) {
    mainMenu.setVisible(false);

    seed = calculateSeed(nameInput.getText());
    setupNodes();
  }

  nameInput.edit();
}
