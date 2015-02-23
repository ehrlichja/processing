int nodeWidth = 10;
int nodeHeight = 10;
Graph graph;
Pair root = new Pair(100, 100);

int time = second();


void setup() {
  size (600, 600);
  
  background(0);
  stroke(255);
  fill(255);
  
}

void draw() {
  
  if (second() != time) {
    background(0);
    graph = generateGraph(50, root);
    dfs(graph, root);
    time = second();  
  }
  
  
 

}

void dfs(Graph graph, Pair node) {

  if (graph.adj(node) == null) return;

  for (Pair n : graph.adj(node)) {
    if (!n.marked) {
      n.marked = true;
      dfs(graph, n);
      drawNode(n);
      drawEdge(n, node);
    }
    
  }
  
}

Graph generateGraph(int size, Pair root) {
  Graph graph = new Graph(size);
  ArrayList<Pair> pairs = new ArrayList();

  
  pairs.add(root);
  
  for (int i=1; i<size; i++) {
    pairs.add(new Pair(int(random(1, width)), int(random(1, height)))); 
  }
  
  for (Pair pair : pairs) {
    Pair target = pairs.get(int(random(1, pairs.size())));
    graph.connect(pair.x, pair.y, target.x, target.y);
  }
  
  return graph;
}

void drawNode(Pair node) {
  stroke(255, 0, 235);
  fill(255, 0, 0);
  ellipse(node.x, node.y, nodeWidth, nodeHeight);
}

void drawEdge(Pair node1, Pair node2) {
  line(node1.x, node1.y, node2.x, node2.y);
}

float randomWidth() {
  return random(0, width-20);
}

float randomHeight() {
  return random(0, height-20);
}

class Graph {
  
  float x;
  float y;
  boolean visited = false;
  
  private HashMap<Pair, ArrayList<Pair>> adj;
    
  Graph (int size) {
    this.x = x;
    this.y = y;
    adj = new HashMap();
  }
  
  HashMap<Pair, ArrayList<Pair>> adj() {
    return adj;
  }
  
  ArrayList<Pair> adj(Pair node) {
    return adj.get(node); 
  }
  
  public void connect(int x1, int y1, int x2, int y2) {
    this.addNodes(x1, y1, x2, y2);
    this.addNodes(x2, y2, x1, y1);
  }
  
  private void addNodes(int x1, int y1, int x2, int y2) {
    
    Pair node1 = new Pair(x1, y1);
    Pair node2 = new Pair(x2, y2);
    
    ArrayList<Pair> a;
    
    if (adj.containsKey(node1)) {
      a = adj.get(node1);
    } else {
      a = new ArrayList();
    }
    
    a.add(node2);
    adj.put(node1, a);
    
  }
 
}

class Pair {
 
 int x;
 int y;
 boolean marked = false;
 
 Pair(int x, int y) {
  this.x = x;
  this.y = y; 
 }
 
 @Override
 public boolean equals(Object object) {
   
   Pair that = (Pair) object;
   
   if (this.x == that.x && this.y == that.y) return true;
   
   return false;
   
 }
 
 @Override
 public int hashCode() {
   final int prime = 31;
   int result = 1;
   result = prime * result + (this.x + this.y);
   return 1; 
 }
 
 String toString() {
   return x + " by " + y; 
 }
  
}
