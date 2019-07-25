

 import 'package:flutter/cupertino.dart';
 import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class RandomWordsState extends State<RandomWords>{


  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);


  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();
        final index = i ~/ 2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildRow(WordPair suggestion) {
    return new ListTile(
      title: new Text(suggestion.asCamelCase,
        style: _biggerFont,),
    );
  }
}



