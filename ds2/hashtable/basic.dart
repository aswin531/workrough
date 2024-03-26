import 'dart:collection';

void main() {
  HashMap<String, int> hashTable = HashMap<String, int>();
  hashTable['apple'] = 10;
  hashTable['banana'] = 20;
  hashTable['orange'] = 30;
  print('value of appple : ${hashTable['apple']}');
  print('value of oraange : ${hashTable['orange']}');
  print('value of banana : ${hashTable['banana']}');
  hashTable['apple'] = 25;
  hashTable.remove('orange');
  print('All Values : $hashTable');
}
