int nodeWidth = 10;
int nodeHeight = 10;

void setup() {
  size (600, 600);
  
  background(0);
  stroke(255);
  fill(255);
  
  Node[] graph = generateGraph(int(random(2, 10)));
  traverseGraph(graph[0]);
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

void traverseGraph(Node root) {
  stroke(255, 0, 0);
  fill(255, 0, 0);
    
  ellipse(root.x, root.y, nodeWidth, nodeHeight);
   
}

class Node {
  
  float x;
  float y;
  
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
  
  Node[] adj() {
   return links; 
  }
  
}
