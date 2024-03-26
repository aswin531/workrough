class TrieNode {
  late Map<String, TrieNode> children;
  late bool idEndOfString;
  TrieNode() {
    children = {};
    idEndOfString = false;
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
    current!.idEndOfString = true;
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
    return current != null && current.idEndOfString;
  }
  bool startsWith(String prefix) {
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
}

void main() {
  Trie trie = Trie();
  trie.insert('flutter');
  trie.insert('developer');
  print(trie.search('flutter'));
  print(trie.search('dev'));
  trie.insert('dev');
  print(trie.startsWith('dev'));
  print(trie.startsWith('search'));
  print(trie.startsWith('flut'));
}
