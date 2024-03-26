class MaxHeap {
  List<int> heap = [];
  MaxHeap() {
    heap;
  }
  int parent(int index) {
    return (index - 1) ~/ 2;
  }

  int left(int index) {
    return (2 * index) + 1;
  }

  int right(int index) {
    return (2 * index) + 2;
  }

  void insert(val) {
    heap.add(val);
    heapifyUp(heap.length - 1);
  }

  void heapifyUp(int index) {
    if (index <= 0) {
      return null;
    }
    int parentIndex = parent(index);
    if (heap[parentIndex] < heap[index]) {
      int temp = heap[parentIndex];
      heap[parentIndex] = heap[index];
      heap[index] = temp;
      heapifyUp(parentIndex);
    }
  }

  void heapifyDown(int index) {
    int leftChildindex = left(index);
    int rightChildindex = right(index);
    int largest = index;
    if (leftChildindex < heap.length && heap[leftChildindex] > heap[largest]) {
      largest = leftChildindex;
    }
    if (rightChildindex < heap.length &&
        heap[rightChildindex] > heap[largest]) {
      largest = rightChildindex;
    }
    if (largest != index) {
      int temp = heap[index];
      heap[index] = heap[largest];
      heap[largest] = temp;
      heapifyDown(largest);
    }
  }

  int? extractMax() {
    if (heap.isEmpty) {
      print('empty heap');
    }
    int max = heap[0];
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    heapifyDown(0);
    return max;
  }

  int? peakMax() {
    if (heap.isEmpty) {
      print('empty heap');
    }
    return heap[0];
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(10);
  maxHeap.insert(5);
  maxHeap.insert(17);
  maxHeap.insert(8);
  maxHeap.insert(20);
  print('peak value : ${maxHeap.peakMax()}');
  print('extracted : ${maxHeap.extractMax()}');
  print('MAXHEAP affter extraction : ${maxHeap.peakMax()}');
  print('heap : ${maxHeap.heap}');
}
