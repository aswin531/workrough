class TrieNode {
  late Map<String, TrieNode> children;
  bool? isEndOfWord;
  TrieNode() {
    children = {};
    isEndOfWord = false;
  }
}

class Trie {
  late TrieNode root;
  Trie() {
    root = TrieNode();
  }
  void insert(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  
}
