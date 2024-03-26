class Node {
  int? val;
  Node? left, right;
  Node(this.val);
}

class BST {
  Node? root;
  BST() {
    root = null;
  }
  void insert(int val) {
    root = insertRec(root, val);
  }

  Node? insertRec(Node? node, val) {
    if (node == null) {
      return Node(val);
    }
    if (val < node.val) {
      node.left = insertRec(node.left, val);
    } else if (val > node.val) {
      node.right = insertRec(node.right, val);
    }
    return node;
  }

  bool search(val) {
    return _searchRec(root, val);
  }

  bool _searchRec(Node? node, int val) {
    if (node == null) {
      return false;
    }
    if (val == node.val) {
      return true;
    }
    if (val < node.val!) {
      return _searchRec(node.left, val);
    } else {
      return _searchRec(node.right, val);
    }
  }

  void inOrder(Node? node) {
    if (node != null) {
      inOrder(node.left);
      print(node.val);
      inOrder(node.right);
    }
    // inOrder(node);
  }
}

void main() {
  BST bst = BST();
  bst.insert(50);
  bst.insert(30);
  bst.insert(20);
  bst.insert(40);
  bst.insert(70);
  bst.insert(60);
  bst.insert(80);
  print('INORDER BST : ');
  bst.inOrder(bst.root);
  print('\n Searched element : ');
  print('${bst.search(40)}');
  print('${bst.search(100)}');
}
