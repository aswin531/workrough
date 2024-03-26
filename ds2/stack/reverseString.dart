class Stack {
  List _items = [];

  void push(String value) {
    _items.add(value);
  }

  String pop() {
    if (!isEmpty()) {
      return _items.removeLast();
    } else {
      return 'stack is empty'; // Return a string indicating that the stack is empty
    }
  }

  bool isEmpty() {
    return _items.isEmpty; // Return whether the stack is empty or not
  }
}

String revString(String input) {
  Stack stack = Stack();
  String reversedstr = '';
  for (int i = 0; i < input.length; i++) {
    stack.push(input[i]);
  }
  while (!stack.isEmpty()) {
    reversedstr += stack.pop();
  }
  return reversedstr;
}

void main() {
  String input = "Hello World";
  String reversed = revString(input);
  print('Original : $input');
  print('Reversed : $reversed');
}
