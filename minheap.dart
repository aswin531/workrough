class MinHeap {
  List<int> heap = [];
  MinHeap() {
    heap;
  }
  void insert(val) {
    heap.add(val);
    heapifyUp(heap.length - 1);
  }

  int deleteMin() {
    if (heap.isEmpty) {
      print('heap is empty');
    }
    int minItem = heap[0];
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    heapifyDown(0);
    return minItem;
  }

  void heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[parentIndex] > heap[index]) {
        int temp = heap[parentIndex];
        heap[parentIndex] = heap[index];
        heap[index] = temp;
        heapifyUp(parentIndex);
      } else {
        break;
      }
    }
  }

  void heapifyDown(int index) {
    while (true) {
      int left = (2 * index) + 1;
      int right = (2 * index) + 2;
      int smallest = index;
      if (left < heap.length && heap[left] < heap[smallest]) {
        smallest = left;
      }
      if (right < heap.length && heap[right] < heap[smallest]) {
        smallest = right;
      }
      if (smallest != index) {
        int temp = heap[index];
        heap[index] = heap[smallest];
        heap[smallest] = temp;
        heapifyDown(smallest);
      } else
        break;
    }
  }

  void display() {
    print(heap);
  }
}

void main() {
  final minHeap = MinHeap()
    ..insert(10)
    ..insert(5)
    ..insert(15)
    ..insert(20)
    ..insert(8)
    ..display()
    ..deleteMin()
    ..display();
}
