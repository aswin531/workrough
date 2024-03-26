class Node{
  dynamic data;
  Node? next;
  Node(this.data);
}
class Stack{
  Node? top;
 
  bool isEmpty() {
    return top == null;
  }
  void push(dynamic data){
    Node? newNode = Node(data);
    if(top == null){
      top = newNode;
    }else{
      newNode.next = top;
      top = newNode;
    }
  }
    dynamic pop(){
      if(top == null){
        print('stack underflow');
        return;
      }
     Node? temp = top;
  top = top!.next;
  return temp!.data;
    }
    void display() {
      Node? current = top;
      while(top!=null) {
        print(current!.data);
        current = current.data;
      }
    }
  }

bool isBracketMatching(String exp){
  Stack stack = Stack();
  Map<String, String> brackets = {'(' : ')', '[':']', '{':'}'};
  for(int i = 0;i<exp.length;i++){
    String char = exp[i];
    if(brackets.keys.contains(char)) {
      stack.push(char);
    }else if(brackets.values.contains(char)){
      if(stack.isEmpty()){
        return false;
      }
      dynamic top = stack.pop();
      if(brackets[top] != char) {
        return false;
      }
    }
  }
  return stack.isEmpty();
}

void main() {
  String exp = '([()])';
  print('Expression : $exp');
  print('Brackets Metched : ${isBracketMatching(exp)}');
}