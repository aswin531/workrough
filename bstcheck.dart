class Treenode {
  dynamic val;
  Treenode? left;
  Treenode? right;
  Treenode(this.val);
}

bool isBST(Treenode root) {
  List<int> inorderList = [];
  void inOrder(Treenode? node) {
    if (node != null) {
      inOrder(node.left);
      inorderList.add(node.val);
      inOrder(node.right);
    }
  }
  inOrder(root); 
  for (int i = 1; i < inorderList.length; i++) {
    if (inorderList[i] <= inorderList[i - 1]) {
      return false;
    }
  }
  return true;
}

void main() {
  Treenode root = Treenode(2);
  root.left = Treenode(1);
  root.right = Treenode(3);
  root.right = Treenode(5);
  root.left = Treenode(2);
  root.right = Treenode(6);
  print(' ${isBST(root)}');
}
