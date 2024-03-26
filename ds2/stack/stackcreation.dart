class Node{
  dynamic data;
  Node? next;
  Node(this.data);
}
class Stack{
  Node? top;
  void push(dynamic data){
    Node newNode = Node(data);
    if(top == null){
      top = newNode;
    }else{
      newNode.next = top;
      top = newNode;
    }
  }
  void pop(){
    if(top == null){
      print('STACK UNDERFLOW');
      return;
    }
    top = top!.next;
  }
  void display() {
    Node? current = top;
    while(current!=null){
      print(current.data);
      current = current.next;
    }
  }
}
void main() {
  Stack stack = Stack();
  stack.push(9);
  stack.push(10);
  stack.push(20);
  stack.push(100);
  stack.push(120);
  stack.pop();
  // stack.pop();
  // stack.pop();
  stack.display();
}