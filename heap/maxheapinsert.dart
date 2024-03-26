//Add the new element at the end of the heap.
//Heapify upwards to maintain the max heap property.
class MaxHeap {
  List<int> heap = [];
  MaxHeap() {
    heap;
  }
  void insert(int value) {
    heap.add(value); // Add the new element at the end
    heapifyUp(heap.length - 1); // Heapify upwards
  }

  //helper to helpifyUp upwards
  void heapifyUp(int index) {
    int parentIndex = (index - 1) ~/ 2;
    while (index > 0 && heap[index] > heap[parentIndex]) {
      //swap because violated maxheap => current element with its parent
      int temp = heap[index];
      heap[index] = heap[parentIndex];
      heap[parentIndex] = temp;
      index = parentIndex;
      parentIndex = (index - 1) ~/ 2;
    }
  }

  void printMaxHeap() {
    print(heap);
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.insert(10);
  maxHeap.insert(20);
  maxHeap.insert(15);
  maxHeap.insert(30);
  maxHeap.insert(25);
  print(' \nMAXHEAP :');
  maxHeap.printMaxHeap();
}
// Swap and Update Indices:
// After identifying that the heap property is violated (i.e., heap[index] > heap[parentIndex]), the function swaps the values of the current node (heap[index]) and its parent node (heap[parentIndex]). This swap ensures that the larger value moves up the heap towards the root, adhering to the max-heap property.
// Following the swap, the function updates the index variable to the parentIndex. This update is essential because after swapping, the current node has moved up to the position previously occupied by its parent. Therefore, we need to continue checking the heap property from the parent's perspective.
// Additionally, the function recalculates the parentIndex for the new parent node. This recalculation ensures that we have the correct parent index for the newly updated index. Since index now represents the position of the previously parent node, its parent node (new parent) would be at (index - 1) ~/ 2. Therefore, parentIndex is recalculated to (index - 1) ~/ 2 to ensure consistency in checking the heap property in the next iteration of the loop.
// In summary, after the swap operation in heapifyUp, both index and parentIndex are updated to reflect the changes in the heap structure. The index is moved up to the position of the parent node (after swapping), and parentIndex is recalculated to represent the new parent node based on the updated index. This ensures that the next iteration of the loop correctly checks the heap property from the perspective of the newly positioned node.