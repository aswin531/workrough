class TreeNode {
  dynamic val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val);
}

TreeNode insert(TreeNode? node, dynamic val) {
  if (node == null) {
    return TreeNode(val);
  }
  if (val < node.val) {
    node.left = insert(node.left, val);
  } else {
    node.right = insert(node.right, val);
  }
  // Therefore, the insert function returns the root node of the subtree where the insertion took place,
  //ensuring that changes made during are reflected correctly in the parent nodes and ultimately in the entire tree.
  return node;
}

bool isBST(TreeNode? node) {
  List<int> listNode = [];
  void inOrderTraversal(TreeNode? node) {
    if (node != null) {
      inOrderTraversal(node.left);
      listNode.add(node.val);
      inOrderTraversal(node.right);
    }
  }

  inOrderTraversal(node);
  for (int i = 1; i < listNode.length; i++) {
    if (listNode[i] <= listNode[i - 1]) {
      return false;
    }
  }
  print('its a BST');
  return true;
}

void main() {
  TreeNode root = TreeNode(2);
  root.left = TreeNode(1);
  root.right = TreeNode(3);
  print('Binary Tree IS : ');
  print(isBST(root));
  root = insert(root, 5);
  root = insert(root, 4);
  print('Binary Tree IS : ');
  print(isBST(root));
}
