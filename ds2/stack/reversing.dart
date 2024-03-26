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
  dynamic pop(){
    if(top == null){
      print('stack unerflow');
      return ;
    }
  dynamic poppedData = top!.data;
  top = top!.next;
  return poppedData;
  }
  void display() {
    Node? current = top;
    while(top!=null){
      print(current!.data);
      current = current.next;
    }
  }
}
String reversed(String str){
  Stack stack = Stack();
  String reversed ='';
  for(int i=0;i<str.length;i++){
    stack.push(str[i]);
  }
  while(stack.top!=null){
    reversed += stack.pop();
  }
  return reversed;
}
void main(){
  String original = 'I am a Flutter Developer';
  String reversedstr = reversed(original);
  print('original : $original \n');
  print('reversed : $reversedstr');
}