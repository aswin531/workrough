class TreeNode {
  dynamic data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}

class BST {
  TreeNode? root;
  void insert(dynamic data) {
    root = insertRec(root, data);
  }

  TreeNode? insertRec(TreeNode? root, data) {
    if (root == null) {
      root = TreeNode(data);
      return root;
    }
    if (data < root.data) {
      root.left = insertRec(root.left, data);
    } else if (data > root.data) {
      root.right = insertRec(root.right, data);
    }
    return root;
  }

  void postorderTraversal(TreeNode? root) {
    if (root != null) {
      postorderTraversal(root.left);
      postorderTraversal(root.right);
      print(root.data);
    }
  }
}

void main() {
  BST bst = BST();
  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);
  bst.insert(12);
  bst.insert(18);
  print('\nPOST ORDER TRAVERSAL :');
  bst.postorderTraversal(bst.root);
}
