class TrieNode {
  late Map<String, TrieNode> children;
  late bool isEndOfString;
  TrieNode() {
    children = {};
    isEndOfString = false;
  }
}

class Trie {
  TrieNode? root;

  Trie() {
    root = TrieNode();
  }
  void insert(String key) {
    TrieNode? current = root;
    for (int i = 0; i < key.length; i++) {
      String char = key[i];
      if (!current!.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      current = current.children[char];
    }
    current!.isEndOfString = true;
  }

bool search(String key) {
  TrieNode? current = root;
  for (int i = 0; i < key.length; i++) {
    String char = key[i];
    if (!current!.children.containsKey(char)) {
      return false;
    }
    current = current.children[char]; 
  }
  return current != null && current.isEndOfString;
}


  bool startWith(String prefix) {
    TrieNode? current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current!.children.containsKey(char)) {
        return false;
      }
      current = current.children[char];
    }
    return true;
  }

  bool delete(String key) {
    return deleteHelper(root!, key, 0);
  }

    bool deleteHelper(TrieNode node, String key, int depth) {
    if (depth == key.length) {
      if (!node.isEndOfString) return false;
      node.isEndOfString = false;
      return node.children.isEmpty;
    }
    String char = key[depth];
    if (!node.children.containsKey(char)) return false;
    bool shouldDeleteCurrentNode = deleteHelper(node.children[char]!, key, depth + 1);
    if (shouldDeleteCurrentNode) {
      node.children.remove(char);
      return node.children.isEmpty && !node.isEndOfString;
    }
    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("dart");
  print(trie.search("dart"));
  trie.delete("dart");
  print(trie.search("dart"));
}
