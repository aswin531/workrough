void insertion(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}
void main() {
  List<int> sub = [55, 44, 3, 555, 121];
  print('original : $sub');
  insertion(sub);
  print('sorted : $sub');
}
