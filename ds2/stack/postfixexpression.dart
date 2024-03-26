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
      return;
    }
    Node? temp = top;
    top = top!.next;
    return temp!.data;
  }
  void display() {
    Node? current = top;
    while(current!=null){
      print(current.data);
      current = current.data;
    }
  }
}
double evaluateexp(String exp){
  Stack stack = Stack();
  for(int i=0;i<exp.length;i++){
    String token = exp[i];
    if(token == '+' || token == '-' || token == '*' || token == '/'){
      double operand2 = double.parse(stack.pop());
      double operand1 = double.parse(stack.pop());
      switch(token){
        case '+':
        stack.push((operand1+operand2).toString());
        break;
        case '-':
        stack.push((operand1 - operand2).toString());
        break;
        case '*':
        stack.push((operand1 * operand2).toString());
        break;
        case '/':
        stack.push((operand1 / operand2).toString());
        break;
      }
    }else{
      stack.push(token);
    }
  }
  return double.parse(stack.pop());
}

void main() {
  String postexp = '200+2*';
  print('original expression : $postexp \n');
  print('Result : ${evaluateexp(postexp)} \n');
}