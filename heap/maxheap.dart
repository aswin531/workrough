class MaxHeap {
  List<int>? heap;
  MaxHeap() {
    heap = [];
  }
  // Function to get the index of the parent node
  int parent(int index) {
    return (index - 1) ~/ 2;
  }

  //function to get the index of left child
  int leftChild(int index) {
    return 2 * index + 1;
  }

  //function to get the index of right child
  int rightChild(int index) {
    return 2 * index + 1;
  }

  //function to swap
  void swap(int index1, int index2) {
    int temp = heap![index1];
    heap![index1] = heap![index2];
    heap![index2] = temp;
  }

  //function to heapifyUp
  void heapifyUp(int index) {
    while (index > 0 && heap![parent(index)] < heap![index]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  //function to heapifyDown
  void heapifyDown(int index) {
    int lagest = index;
    int left = leftChild(index);
    int right = rightChild(index);
    if (left < heap!.length && heap![left] > heap![lagest]) {
      lagest = left;
    }
    if (right < heap!.length && heap![right] > heap![lagest]) {
      lagest = right;
    }
    if (lagest != index) {
      swap(index, lagest);
      heapifyDown(lagest);
    }
  }

  //function to insert an element into heap
  void insert(int data) {
    heap!.add(data);
    heapifyUp(heap!.length - 1);
  }

  //function to remove and return the maximum element from the heap
  int removeMax() {
    if (heap!.isEmpty) {
      print('Heap is empty');
    }
    int max = heap![0];
    heap![0] = heap![heap!.length - 1];
    heap!.removeLast();
    heapifyDown(0);
    return max;
  }

  void buildHeap(List<int> array) {
    heap = List.from(array);
    for (int i = (heap!.length ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void printMaxheap() {
    print(heap);
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(10);
  maxHeap.insert(5);
  maxHeap.insert(15);
  maxHeap.insert(3);
  maxHeap.insert(7);
  maxHeap.insert(20);
  print('\n HEAP :');
  maxHeap.printMaxheap();
  print('\nRemoving An Element : ');
  print(maxHeap.removeMax());
  print('\nAfter Removing :');
  maxHeap.printMaxheap();
  print('\nCreating a HEAP with BuilHeap');
  List<int> array = [9, 4, 8, 2, 11];
  maxHeap.buildHeap(array);
  maxHeap.printMaxheap();
}
