class Graph {
  late Map<int, List<int>> list;
  Graph() {
    list = {};
  }
  void addVertex(int vertex) {
    if (!list.containsKey(vertex)) {
      list[vertex] = [];
    }
  }
  void addEdge(int source, int destination) {
    if (!list.containsKey(source)) {
      addVertex(source);
    }
    if (!list.containsKey(destination)) {
      addVertex(destination);
    }
    list[source]!.add(destination);

  }

  void printGraph() {
    for (var vertex in list.keys) {
      print("$vertex -> ${list[vertex]}");
    }
  }
}

void main() {
  Graph graph = Graph();
  graph.addEdge(0, 1);
  graph.addEdge(2, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 5);
  graph.addEdge(2, 3);
  graph.addEdge(4, 3);

  print("Graph Representation:");
  graph.printGraph();
}