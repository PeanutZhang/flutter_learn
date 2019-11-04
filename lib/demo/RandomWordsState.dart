

 import 'package:flutter/cupertino.dart';
 import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/demo/main.dart';

class RandomWordsState extends State<RandomWords>{


  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0,color:Color.fromRGBO(155, 155, 155, 0.2),decorationColor: Color.fromARGB(155, 155, 1555, 155));
  final _saved = new Set<WordPair>();


  Widget _buildSuggestions(){
    print('build is going');
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        print('itembuild isgoing----');
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
        actions: <Widget>[new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

  void  _pushSaved(){

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      final tiles = _saved.map(
          (pair) {
            return new ListTile(
              title: new Text(pair.asPascalCase,
              style: _biggerFont),
              trailing: new Icon(Icons.favorite,color: Colors.red,),
              onTap: () {
                print('print the items');
              },
            );
          }
      );
      final divided = ListTile.divideTiles(tiles: tiles,
      context: context).toList();
      return new Scaffold(
       appBar: new AppBar(title: new Text('saved suggestion'),),
        body: new ListView(children: divided,),
      );
    }));
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _saved.contains(suggestion);

    return new ListTile(
      title: new Text(suggestion.asCamelCase,
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved? Icons.favorite:Icons.favorite_border,
       color: alreadySaved ?Colors.red:null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(suggestion);
          }else{
            _saved.add(suggestion);
          }
        });
      },
    );
  }
}



