class QueueNode {
  dynamic data;
  QueueNode? next;
  QueueNode(this.data);
}

class Queue {
  QueueNode? front;
  QueueNode? rear;
  void enqueue(dynamic data) {
    QueueNode newNode = QueueNode(data);
    if (rear == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  dynamic dequeue() {
    if (front == null) {
      print('Empty queue');
      return null;
    }
    dynamic data = front!.data;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    return data;
  }

  void display() {
    QueueNode? current = front;
    if (front == null) {
      print('Empty queue');
      return;
    }
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

String reverseString(String input) {
  Queue queue = Queue();
  for (int i = 0; i < input.length; i++) {
    queue.enqueue(input[i]);
  }
  String reversedString = '';
  while (queue.front != null) {
    reversedString = queue.dequeue()+reversedString;
  }
   return reversedString;
}

void main() {
    String inputstr = "Malayalam";
  print('Original: $inputstr');
  String reversed = reverseString(inputstr); 
  print('Reversed: $reversed'); 
}
