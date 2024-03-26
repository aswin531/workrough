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

TreeNode? insertRec(TreeNode? node, int data) {
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

  bool search(int data) {
    return searchRec(root, data);
  }

  bool searchRec(TreeNode? node, int data) {
    if (node == null) {
      return false;
    }
    if (node.data == data) {
      return true;
    }
    if (data < node.data) {
      return searchRec(node.left, data);
    } else {
      return searchRec(node.right, data);
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
  print(bst.search(5));
  print(bst.search(30));
  print(bst.search(7));
    print(bst.search(10));
  print(bst.search(15));
  print(bst.search(77));
}
