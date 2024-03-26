import 'dart:collection';

List<List<int>> graph = [
  [1, 2],
  [0, 3, 4],
  [0, 5],
  [1],
  [1],
  [2]
];

int bfsShortestPath(int start, int target) {
  Queue<int> queue = Queue();
  Set<int> visited = Set();
  List<int> distance = List.filled(graph.length, 0);

  queue.add(start);
  visited.add(start);

  while (queue.isNotEmpty) {
    int current = queue.removeFirst();
    if (current == target) {
      return distance[current];
    }
    for (int neighbor in graph[current]) {
      if (!visited.contains(neighbor)) {
        visited.add(neighbor);
        distance[neighbor] = distance[current] + 1;
        queue.add(neighbor);
      }
    }
  }
  return -1; 
}

void main() {
  int shortestPath =
      bfsShortestPath(5, 1); 
  print(
      "Shortest Path Length: $shortestPath"); 
}
