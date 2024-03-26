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
      current = current.children[char]!;
    }
    current!.isEndOfString = true;
  }

  int countWordsWithPrefix(String prefix) {
    TrieNode? current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current!.children.containsKey(char)) {
        return 0;
      }
      current = current.children[char]!;
    }
    return countWords(current!);
  }

  int countWords(TrieNode node) {
    int count = 0;
    if (node.isEndOfString) {
      count++;
    }
    for (var child in node.children.values) {
      count += countWords(child);
    }
    return count;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("flutter");
  trie.insert("app");
  trie.insert("appdeveloper");
  trie.insert("dart");
  print('count of the words starts with given key :');
  print(trie.countWordsWithPrefix("flut"));
}
