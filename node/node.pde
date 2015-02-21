void setup() {
  size (600, 600);
  
  background(0);
  stroke(255);
  fill(255);
  
  Node[] graph = generateGraph(int(random(2, 10)));
  traverseGraph(graph);
}

Node[] generateGraph(int size) {
  
  Node[] graph = new Node[size];
  
  for (int i = 0; i < size; i++) {
    graph[i] = new Node(random(0, width-20), random(0, height-20)); 

    if (i > 0) {
     
      graph[i].connect(graph[int(random(0, i))]);
    
    }
  }
  
  return graph;
}

void traverseGraph(Node[] graph) {
  stroke(255, 0, 0);
  fill(255, 0, 0);
  
  Node current = graph[1];
  
  ellipse(current.x, current.y, current.nodeWidth, current.nodeHeight);
  
  println(current.linkCount);
  
  for (int j = 0; j < current.linkCount; j++) {
      ellipse(current.links[j].x, current.links[j].y, current.nodeWidth, current.nodeHeight);
  }
  

  
}

class Node {
  
  float x;
  float y;
  int nodeWidth = 10;
  int nodeHeight = 10;
  
  int linkCount = 0;
  Node[] links = new Node[1000];
  
  Node(float x, float y) {
    this.x = x;
    this.y = y;
    update();
  }
 
  void connect(Node target) {
    links[linkCount] = target;
    linkCount++;
    line(this.x, this.y, target.x, target.y);
  }
  
  void update() {
    ellipse(this.x, this.y, nodeWidth, nodeHeight);
  }
  
}
