class Node {
  dynamic data;
  Node? left, right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;
  void insert(dynamic data) {
    Node? current = root;
    if (current == null) {
      root = Node(data);
      return; 
    }
    while (true) {
      if (data < current!.data) {
        if (current.left == null) {
          current.left = Node(data);
          break;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = Node(data);
          break;
        } else {
          current = current.right;
        }
      }
    }
  }

  bool contains(dynamic data) {
    Node? current = root;
    while (current != null) {
      if (data < current.data) {
        current = current.left;
      } else if (data > current.data) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void delete(dynamic data) {
    deleteHelper(data, root, null);
  }

  void deleteHelper(dynamic data, Node? current, Node? parentNode) {
    while (current != null) {
      if (data < current.data) {
        parentNode = current;
        current = current.left;
      } else if (data > current.data) {
        parentNode = current;
        current = current.right;
      } else {
        if (current.left != null && current.right != null) {
          current.data = getMinValue(current.right);
          deleteHelper(current.data, current.right, current);
        } else {
          if (parentNode == null) {
            if (current.right == null) {
              root = current.left;
            } else {
              root = current.right;
            }
          } else {
            if (parentNode.right == null) {
              parentNode.left = current.left;
            }else{
              
            }
          }
        }
      }
    }
  }

  // ignore: unused_element
  int? getMinValue(Node? current) {
    if (current!.left == null) {
      return current.data;
    } else {
      return getMinValue(current.left);
    }
  }

  void displayInOrder(Node? node) {
    if (node != null) {
      displayInOrder(node.left);
      print(node.data);
      displayInOrder(node.right);
    }
  }

  void display() {
    print('Stored Values : ');
    displayInOrder(root);
  }
}

void main() {
  BinarySearchTree binarySearchTree = BinarySearchTree();
  binarySearchTree.insert(10);
  binarySearchTree.insert(80);
  binarySearchTree.insert(20);
  binarySearchTree.insert(0);
  binarySearchTree.insert(30);
  binarySearchTree.insert(40);
  binarySearchTree.insert(50);
  binarySearchTree.display();
  print('\n Boolean Result : ${binarySearchTree.contains(30)}\n');
}
