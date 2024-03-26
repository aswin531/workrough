class MinHeap {
  List<int> heap = [];
  MinHeap() {
    heap = [];
  }
  void insert(int value) {
    heap.add(value);
    heapCheck(heap.length - 1);
  }

  void heapCheck(int index) {
    if (index <= 0) {
      return;
    }
    int parentIndex = (index - 1) ~/ 2;
    if (heap[parentIndex] > heap[index]) {
      swap(parentIndex, index);
      heapCheck(parentIndex);
    }
  }

  void swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  List<int> getHeap() {
    return heap;
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(3);
  minHeap.insert(2);
  minHeap.insert(1);
  minHeap.insert(4);
  print('\nMINHEAP : ${minHeap.getHeap()}');
}
