class TreeNode {
  TreeNode? left;
  TreeNode? right;
  int data;
  TreeNode(this.data);
}

class BinarySearch {
  TreeNode? root;
  BinarySearch();
  void insert(int data) {
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

  bool? contains(int data) {
    return containsRec(root, data);
  }

  bool? containsRec(TreeNode? node, int data) {
    if (node == null) {
      return false;
    }
    if (data == node.data) {
      return true;
    } else if (data < node.data) {
      return containsRec(node.left, data);
    } else {
      return containsRec(node.right, data);
    }
  }

  int? delete(int data) {
    root = deleteRec(root, data);
    return null;
  }

  TreeNode? deleteRec(TreeNode? node, int data) {
    if (node == null) {
      return null;
    }
    if (data < node.data) {
      node.left = deleteRec(node.left, data);
    } else if (data > node.data) {
      node.right = deleteRec(node.right, data);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.data = findMinValue(node.right)!;
      node.right = deleteRec(node.right, node.data);
    }
    return node;
  }

  int? findMinValue(TreeNode? node) {
    int minValue = node!.data;
    while (node.left != null) {
      minValue = node.left!.data;
      // node = node.left;
    }
    return minValue;
  }

  String? printTree() {
    _inOrderTraversal(root);
    return '';
  }

  void _inOrderTraversal(TreeNode? node) {
    if (node != null) {
      _inOrderTraversal(node.left);
      print(node.data);
      _inOrderTraversal(node.right);
    }
  }
}

void main() {
  var bst = BinarySearch();
  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(2);
  bst.insert(7);
  bst.insert(12);
  bst.insert(20);
  print('FIVE is present : ${bst.contains(5)}');
  print('THREE is present : ${bst.contains(3)}');
  print('NINE is present : ${bst.contains(9)}');
  print('After Insertion before Deletion :');
  bst.printTree();
  bst.delete(5);
  print('After Deletion :');
  bst.printTree();
  print('DISPLAYING the Details : ');
  bst.printTree();
}
