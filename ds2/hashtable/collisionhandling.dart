import 'dart:collection';

void main() {
  HashMap<int, String> hashTable = HashMap<int, String>();
  hashTable[1] = 'appple';
  hashTable[2] = 'banana';
  hashTable[3] = 'orange';
  hashTable[4] = 'grape';
  hashTable[5] = 'pineapple';

  //innserting collision causing elements
  hashTable[6] = 'mango';
  hashTable[7] = 'watermelon';
  hashTable[8] = 'strawberry';
  hashTable[9] = 'peach';

  //Access elemets from hashtable
  print('value of key3 : ${hashTable[3]}');
  print('value of key6 : ${hashTable[6]}');
  print('value of kwy9 : ${hashTable[9]}');

  print('HashTable : $hashTable');
}
