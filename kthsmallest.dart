class Node {
  int? val;
  Node? left, right;
  Node(this.val);
}

class BT {
  Node? root;
  BT() {
    root = null;
  }
  void insert(int val) {
    root = insertRec(root, val);
  }

  Node insertRec(Node? node, val) {
    if (node == null) {
      return Node(val);
    }
    if (val < node.val) {
      node.left = insertRec(node.left, val);
    } else {
      node.right = insertRec(node.right, val);
    }
    return node;
  }

  int? kthSmallest(int k) {
    List<int> elements = [];
    void inOrderTraversal(Node? root) {
      if (root != null) {
        inOrderTraversal(root.left);
        elements.add(root.val!);
        inOrderTraversal(root.right);
      }
    }

    inOrderTraversal(root);
    if (k > 0 && k <= elements.length) {
      return elements[k - 1];
    } else {
      return null;
    }
  }
}

void main() {
  BT bt = BT();
  bt.insert(50);
  bt.insert(30);
  bt.insert(20);
  bt.insert(40);
  bt.insert(70);
  bt.insert(60);
  bt.insert(80);
  int k = 3;
  int? kthsmallest = bt.kthSmallest(k);
  if (kthsmallest != null) {
    print(' $k th Smallest Element : ${kthsmallest}');
  } else {
    print('NO $k th smallest element!! ');
  }
}
