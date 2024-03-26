class Node {
  dynamic val;
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

  bool? search(val) {
    return searchRec(root, val);
  }

  bool? searchRec(Node? node, val) {
    if (node == null) {
      return false;
    }
    if (val == node.val) {
      return true;
    }
    if (val < node.val) {
      return searchRec(node.left, val);
    }
    if (val > node.val) {
      return searchRec(node.right, val);
    }
    return null;
  }

  Node? minValue(Node? root) {
    Node? current = root;
    while (current!.left != null) {
      current = current.left;
    }
    return current;
  }

  Node? deleteNode(Node? node, val) {
    if (node == null) {
      return node;
    }
    if (val < node.val) {
      node.left = deleteNode(node.left, val);
    } else if (val > node.val) {
      node.right = deleteNode(node.right, val);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.val = minValue(node.right)!.val;
      node.right = deleteNode(node.right, val);
    }
    return node;
  }

  void delete(val) {
    root = deleteNode(root, val);
  }

  void inOrder(Node? node) {
    inOrderRec(node);
  }

  void inOrderRec(Node? node) {
    if (node != null) {
      inOrderRec(node.left);
      print(node.val);
      inOrderRec(node.right);
    }
  }
  // int findClosest(int target){
  //     return findClosestValue(root,target)
  // }
}

void main() {
  Bst bst = Bst();
  bst.insert(10);
  bst.insert(50);
  bst.insert(4);
  bst.insert(5);
  print('${bst.search(4)}');
  bst.inOrder(bst.root);
  bst.delete(4);
  bst.inOrder(bst.root);
}
