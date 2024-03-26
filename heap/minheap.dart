class MinHeap {
  List<int>? heap;
  MinHeap() {
    heap = [];
  }
  //function for getting index of the parent node
  int parent(int index) {
    return (index - 1) ~/ 2;
  }

//function to get index of left child
  int leftchild(int index) {
    return 2 * index + 1;
  }

//function to get index of the right child
  int rightchild(int index) {
    return 2 * index + 2;
  }

//function to swap 2 elements in the heap
  void swap(int index1, int index2) {
    int temp = heap![index1];
    heap![index1] = heap![index2];
    heap![index2] = temp;
  }

  //function to heapify up
  void heapifyUp(int index) {
    while (index > 0 && heap![parent(index)] > heap![index]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  //function to heapify down
  void heapifyDown(int index) {
    int smallest = index;
    int left = leftchild(index);
    int right = rightchild(index);
    if (left < heap!.length && heap![left] < heap![smallest]) {
      smallest = left;
    }
    if (right < heap!.length && heap![right] < heap![smallest]) {
      smallest = right;
    }
    if (smallest != index) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  //function to insert an element into the heap
  void insert(int value) {
    heap!.add(value);
    heapifyUp(heap!.length - 1);
  }

  //function to remove and return the minimum element from the heap
  int? removeMin() {
    if (heap!.isEmpty) {
      print('Heap Emppty');
    }
    int min = heap![0];
    heap![0] = heap![heap!.length - 1];
    heap?.removeLast();
    heapifyDown(0);
    return min;
  }

  //function to build a heap from an array
  void buildHeap(List<int> array) {
    heap = List.from(array);
    for (int i = (heap!.length ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void displayHeap() {
    print(heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.insert(10);
  minHeap.insert(5);
  minHeap.insert(15);
  minHeap.insert(3);
  minHeap.insert(7);
  minHeap.insert(20);
  print('\nHEAP : ');
  minHeap.displayHeap();
  print('\nMinimum Element :');
  print(minHeap.removeMin());
  minHeap.displayHeap();
  print('Building Heap from an ARRAY :');
  List<int> array = [9, 4, 8, 2, 11];
  minHeap.buildHeap(array);
  minHeap.displayHeap();
  print('\nBuilding Heap from an ARRAY 2:');
  List<int> array2 = [99, 44, 88, 22, 11];
  minHeap.buildHeap(array2);
  minHeap.displayHeap();
}
