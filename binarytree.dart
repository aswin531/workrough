class TreeNode {
  int? value;
  TreeNode? left, right;
  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;
  BinaryTree() {
    root = null;
  }
  void insert(int value) {
    root = insertRec(root, value);
  }

  TreeNode? insertRec(TreeNode? node, int value) {
    if (node == null) {
      return TreeNode(value);
    }
    if (value < node.value!) {
      node.left = insertRec(node.left, value);
    } else if (value > node.value!) {
      node.right = insertRec(node.right, value);
    }
    return node;
  }
  void inOrderTraversal(TreeNode? node) {
    if (node != null) {
      inOrderTraversal(node.left);
      print(node.value);
      inOrderTraversal(node.right);
    }
  }
}

void main() {
  BinaryTree binaryTree = BinaryTree();
  binaryTree.insert(50);
  binaryTree.insert(30);
  binaryTree.insert(20);
  binaryTree.insert(40);
  binaryTree.insert(70);
  binaryTree.insert(60);
  binaryTree.insert(80);
  print('\nINORDER TRAVERSAL BINARY TREE :');
  binaryTree.inOrderTraversal(binaryTree.root);
  print('\n');
}
