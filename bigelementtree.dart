class TreeNode {
  int? val;
  TreeNode? left, right;
  TreeNode(this.val);
}

class BT {
  TreeNode? root;
  BT() {
    root = null;
  }
  void insert(int val) {
    root = insertRec(root, val);
  }

  TreeNode? insertRec(TreeNode? node, value) {
    if (node == null) {
      return TreeNode(value);
    }
    if (value < node.val) {
      node.left = insertRec(node.left, value);
    } else if (value > node.val) {
      node.right = insertRec(node.right, value);
    }
    return node;
  }

  // void inorderTraversal(TreeNode? node) {
  //   if (node != null) {
  //     inorderTraversal(node.left);
  //     print(node.val);
  //     inorderTraversal(node.right);
  //   }
  // }

  int? findLargetElement() {
    if (root == null) {
      return null;
    }
    TreeNode? current = root;
    while (current!.right != null) {
      current = current.right;
    }
    return current.val;
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
  print("\nBINARY TREE :");
  // bt.inorderTraversal(bt.root);
    print('Largest Element :  ${bt.findLargetElement()}');
}
