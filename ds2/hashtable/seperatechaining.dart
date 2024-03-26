import 'dart:collection';

void main() {
  HashMap<int, List<String>> hashTable = HashMap<int, List<String>>();
  insert(hashTable, 1, 'apple');
  insert(hashTable, 2, 'banana');
  insert(hashTable, 3, 'orange');
  insert(hashTable, 4, 'grape');
  insert(hashTable, 5, 'pineapple');
  //causing collision
  insert(hashTable, 6, 'mango');
  insert(hashTable, 7, 'watermelon');
  insert(hashTable, 8, 'strawberry');
  insert(hashTable, 9, 'peach');
  print('value of key 1 : ${getValue(hashTable, 1)}');
  print('vakue of key 2 : ${getValue(hashTable, 2)}');
  print('value of key 6 : ${getValue(hashTable, 2)}');
}

void insert(HashMap<int, List<String>> hashTable, int key, String value) {
  int index = key % 10;
  if (!hashTable.containsKey(index)) {
    hashTable[index] = [];
  }
  hashTable[index]!.add(value);
}

List<String>? getValue(HashMap<int, List<String>> hashTable, int key) {
  int index = key % 10;
  return hashTable[index];
}
