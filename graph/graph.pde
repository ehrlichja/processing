int nodeWidth = 10;
int nodeHeight = 10;

void setup() {
  size (600, 600);
  
  background(0);
  stroke(255);
  fill(255);
  
  Node root = generateGraph(int(random(2, 10)));
  traverseGraph(root);
}

Node generateGraph(int size) {
  
  Node root = new Node(randomWidth(), randomHeight());
  
  root.connect(new Node(randomWidth(), randomHeight()));
  
  return root;
}

void traverseGraph(Node root) {
  stroke(255, 0, 0);
  fill(255, 0, 0);
    
  drawNode(root.x, root.y);
  
  println(root.adj());
  
  for (Node node : root.adj()) {
    if (node != null) {
      drawNode(node.x, node.y);
      drawEdge(root, node);
    }
  }
  
}

void drawNode(float x, float y) {
  ellipse(x, y, nodeWidth, nodeHeight);
}

float randomWidth() {
  return random(0, width-20);
}

float randomHeight() {
  return random(0, height-20);
}

void drawEdge(Node first, Node second) {
  stroke(255);
  line(first.x, first.y, second.x, second.y);
}

class Node {
  
  float x;
  float y;
  
  int linkCount = 0;
  Node[] links = new Node[1000];
  
  Node(float x, float y) {
    this.x = x;
    this.y = y;
  }
 
  void connect(Node target) {
    links[linkCount] = target;
    linkCount++;
  }
  
  Node[] adj() {
   return links; 
  }
  
}
