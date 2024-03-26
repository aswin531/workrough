class Node {
  dynamic data;
  Node? next;
  Node(this.data);
}
class Queue {
  Node? front;
  Node? rear;
  void enqueue(dynamic data) {
    Node? newNode = Node(data);
    if (rear == null) {
      front = rear = newNode;
      return;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }
  void dequeue() {
    if (front == null) {
      print('Queue is Empty');
    }
    front = front!.next;
    if (front == null) {
      rear = null;
    }
  }
  void display() {
    Node? current = front;
    if (front == null) {
      print('List is Empty');
      return;
    }
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  Queue queue = Queue();
  print('enqued : \n');
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);
  queue.display();
  print('dequeued :\n');
  queue.dequeue();
  queue.display();
}
