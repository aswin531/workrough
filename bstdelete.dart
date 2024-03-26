
class Node {
  int? val;
  Node? left, right;
  Node(this.val);
}

class Bst {
  Node? root;
  Bst() {
    root = null;
  }
  void insert(val) {
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
    return searchRec(root, val);
  }

  bool searchRec(Node? node, val) {
    if (node == null) {
      return false;
    }
    if (val == node.val) {
      return true;
    }
    if (val < node.val) {
      return searchRec(node.left, val);
    } else {
      return searchRec(node.right, val);
    }
  }

  void inOrder(Node? node) {
    if (node != null) {
      inOrder(node.left);
      print(node.val);
      inOrder(node.right);
    }
  }

  Node? minValue(Node? node) {
    Node? current = node;
    while (current!.left != null) {
      current = current.left;
    }
    return current;
  }

  Node? deleteNode(Node? root, val) {
    if (root == null) {
      return root;
    }
    if (val < root.val) {
      root.left = deleteNode(root.left, val);
    } else if (val > root.val) {
      root.right = deleteNode(root.right, val);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
// The smallest value in the right subtree will be the leftmost node in the right subtree. So, _minValueNode(root.right) finds this smallest node.
// The key of the root node is then replaced with the key of this smallest node found (_minValueNode(root.right).key). This effectively preserves the ordering of the tree.
      root.val = minValue(root.right)!.val;
      root.right = deleteNode(root.right, root.val);
    }
    return root;
  }

  void delete(int key) {
    root = deleteNode(root, key);
  }
}

void main() {
  Bst bst = Bst();
  bst.insert(20);
  bst.insert(30);
  bst.insert(50);
  bst.insert(70);
  bst.insert(10);
  bst.insert(80);
  print('BST :');
  bst.inOrder(bst.root);
  print('searched element : ${bst.search(20)}');
  int keyToDelete = 50;
  bst.delete(keyToDelete);
  print('After deletion of $keyToDelete');
  bst.inOrder(bst.root);
}
