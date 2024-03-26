void selectiosort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    var minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    var temp = arr[minIndex];
    arr[minIndex] = arr[i];
    arr[i] = temp;
  }
}

void main() {
  List<int> arr = [64, 25, 12, 22, 11];
  print('Array og : $arr');
  selectiosort(arr);
  print('Sorted : $arr');
}
