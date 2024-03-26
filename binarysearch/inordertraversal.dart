class TreeNode {
  dynamic data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}

class BSt {
  TreeNode? root;
  
  void insert(dynamic data) {
    root = insertRec(root, data);
  }

  TreeNode? insertRec(TreeNode? node, data) {
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

  void inorderTraversal() {
    traversalRec(root);
  }

  void traversalRec(TreeNode? node) {
    if (node != null) {
      traversalRec(node.left);
      print(node.data);
      traversalRec(node.right);
    }
  }
}

void main() {
  BSt bst = BSt();
  bst.insert(51);
  bst.insert(30);
  bst.insert(7);
  bst.insert(145);
  bst.insert(44);
  print("In-order traversal:");
  bst.inorderTraversal();
}
