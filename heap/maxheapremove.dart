// ==> Find the index of the element you want to remove.
// ==> Replace the element to be removed with the last element in the heap.
// ==> Perform a sift-down operation on the element at the index where the replacement occurred to restore the heap property.

class MaxHeap {
  List<int> heap = [];
  int parent(int index) => (index - 1) ~/ 2;
  int leftChild(int index) => 2 * index + 1;
  int rightChild(int index) => 2 * index + 2;
  void heapifyUp(int index) {
    while (index > 0 && heap[parent(index)] < heap[index]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  void heapifyDown(int index) {
    int maxIndex = index;
    int left = leftChild(index);
    int right = rightChild(index);
    if (left < heap.length && heap[left] > heap[maxIndex]) {
      maxIndex = left;
    }
    if (right < heap.length && heap[right] > heap[maxIndex]) {
      maxIndex = right;
    }
    if (maxIndex != index) {
      swap(index, maxIndex);
      heapifyDown(maxIndex);
    }
  }

  void swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = heap[index1];
  }

  void insert(int data) {
    heap.add(data);
    heapifyUp(heap.length - 1);
  }

  int removeMax() {
    if (heap.isEmpty) {
      print('wmpty');
    }
    int max = heap[0];
    heap[0] = heap[heap.length - 1];
    heap.removeLast();
    heapifyDown(0);
    return max;
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(10);
  maxHeap.insert(5);
  maxHeap.insert(20);
  maxHeap.insert(8);
  maxHeap.insert(15);
  print('\n Original Max HEaP : \n');
  maxHeap.printHeap();
  print('\n');
  maxHeap.removeMax();
  print('\n Max HEAP after Removing : \n');
  maxHeap.printHeap();
  print('\n');
}
