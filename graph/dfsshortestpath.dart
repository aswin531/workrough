List<List<int>> graph = [
  [1, 2],   
  [0, 3, 4],
  [0, 5],   
  [1],      
  [1],      
  [2]       
];

bool dfsShortestPath(int current, int target, Set<int> visited, List<int> path) {
  if (current == target) {
    print("Shortest Path: $path");
    return true;
  }
  for (int neighbor in graph[current]) {
    if (!visited.contains(neighbor)) {
      visited.add(neighbor);
      path.add(neighbor);
      if (dfsShortestPath(neighbor, target, visited, path)) {
        return true;
      }
      path.removeLast(); 
    }
  }
  return false;
}

void main() {
  Set<int> visited = {};
  List<int> path = [];
  visited.add(1);
  path.add(1);
  dfsShortestPath(0, 5, visited, path);
}
