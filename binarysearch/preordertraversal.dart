class TreeNode {
  dynamic data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}

class BST {
  TreeNode? root;
  // BST();
  void insert(dynamic data) {
    root = insertRec(root, data);
  }

  TreeNode? insertRec(TreeNode? node, dynamic data) {
    if (node == null) {
      return TreeNode(data);
    }
    if (data < node.data) {
      node.left = insertRec(node.left, data);
    } else if (data > node.data) {
      node.right = insertRec(node.right, data);
    }
    return node;
  }

  void preorderTraversal(TreeNode? node) {
    if (node != null) {
      print('${node.data}');
      preorderTraversal(node.left);
      preorderTraversal(node.right);
    }
  }
}

void main() {
  BST bst = BST();
  bst.insert(100);
  bst.insert(200);
  bst.insert(300);
  bst.insert(1);
  bst.insert(150);
  bst.insert(14);
  print('\n PREORDER TRAVERSAL :');
  bst.preorderTraversal(bst.root);
}
