class MinHeap {
  List<int> heap = [];
  MinHeap() {
    heap;
  }
  int parent(int index) {
    return (index - 1) ~/ 2;
  }

  int leftChild(int index) {
    return 2 * index + 1;
  }

  int rightChild(int index) {
    return 2 * index + 2;
  }

  void swap(int index, int index2) {
    int temp = heap[index];
    heap[index] = heap[index2];
    heap[index2] = temp;
  }

  void heapifyDown(int index) {
    int left = leftChild(index);
    int right = rightChild(index);
    int smallest = index;
    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }
    if (right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }
    if (smallest != index) {
      heapifyDown(smallest);
    }
  }

  int? remove(int value) {
    int index = heap.indexOf(value);
    if (index < 0) {
      return null;
    }
    int removedValue = heap[index];
    swap(index, heap.length - 1);
    heap.removeLast();
    heapifyDown(index);
    return removedValue;
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.heap = [51,55,42,78,99,66,54,20,10,33,5656];
  print('\nOriginal min Heap :');
  minHeap.printHeap();
  int? removedValue = minHeap.remove(555);
  if (removedValue != null) {
    print('\n Removed Value :$removedValue');
    print('\nAfter Removal :');
    minHeap.printHeap();
  } else {
    print('\nElement not Found in HEAP !\n');
  }
}
