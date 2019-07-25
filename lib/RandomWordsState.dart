

 import 'package:flutter/cupertino.dart';
 import 'package:english_words/english_words.dart';

import 'main.dart';

class RandomWordsState extends State<RandomWords>{


  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);


  Widget _buildSuggestions(){
    return new ListView(
      padding: const EdgeInsets.all(16.0),

    );
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    return new Text(wordPair.asPascalCase);
  }
}

