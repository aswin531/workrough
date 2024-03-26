
class graph {
  late Map<int, List<int>> adjacencyList;
  graph() {
    adjacencyList = {};
  }
  void addEdge(int v, int w) {
    if (!adjacencyList.containsKey(v)) {
      adjacencyList[v] = [];
    }
    adjacencyList[v]!.add(w);
  }

  void BFS(int startVertex) {
    Set<int> visited = Set();
    List<int> queue = [];
    visited.add(startVertex);
    queue.add(startVertex);
    while (queue.isNotEmpty) {
      int currentVertex = queue.removeAt(0);
      print('$currentVertex');
      List<int>? neighbours = adjacencyList[currentVertex];
      if (neighbours != null) {
        for (int neighbour in neighbours) {
          if (!visited.contains(neighbour)) {
            visited.add(neighbour);
            queue.add(neighbour);
          }
        }
      }
    }
  }
}

void main() {
  graph garph = graph();
  garph.addEdge(0, 1);
  garph.addEdge(0, 2);
  garph.addEdge(1, 2);
  garph.addEdge(2, 0);
  garph.addEdge(2, 3);
  garph.addEdge(3, 3);
  
  print("BFS starting from vertex 2:");
  garph.BFS(2); 
}
