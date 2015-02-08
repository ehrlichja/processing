void setup() {
  size (600, 600);
  
  background(0);
  stroke(255);
  fill(255);
  
  Node[] graph = generateGraph(int(random(5, 14)));
  
  
}

Node[] generateGraph(int size) {
  
  Node[] graph = new Node[size];
  
  for (int i = 0; i < size; i++) {
    graph[i] = new Node(random(0, width-20), random(0, height-20)); 
  }
  
  for (int i = 0; i < size; i++) {
    
    int targetID = -1;
    
    while (targetID != -1 && targetID != i) {
      println(targetID);
      targetID = int(random(0, size));
    }
    
    graph[i].connect(graph[targetID]);
  }
  
  return graph;
}

class Node {
  
  float x;
  float y;
  int nodeWidth = 10;
  int nodeHeight = 10;
  
  Node(float x, float y) {
    this.x = x;
    this.y = y;
    update();
  }
 
  void connect(Node target) {
    line(this.x, this.y, target.x, target.y);
  }
  
  void update() {
    ellipse(this.x, this.y, nodeWidth, nodeHeight);
  }
  
}
