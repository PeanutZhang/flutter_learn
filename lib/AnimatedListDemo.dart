import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
class AnimatedListDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimateListState();
  }

}

class AnimateListState extends State<AnimatedListDemo>{

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = ListModel(listKey: _listKey, removedItemBuilder: _buildRemovedItem,initialItems: [1,2,3]);
    _nextItem =3;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('AnimatedList'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            new IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove,
              tooltip: 'remove the selected item',
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new AnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      slected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      slected: false,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }
}

class ListModel<E>{
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  }) : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animateList => listKey.currentState;
  void insert(int index,E item){
    _items.insert(index, item);
    _animateList.insertItem(index);
  }

  E removeAt(int index){
    final E removeItem = _items.removeAt(index);
    if(removeItem !=null){
      _animateList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removeItem, context, animation);
      });
    }
  }

  int get length => _items.length;
  E operator [](int index)=>_items[index];
  int indexOf(E item)=>_items.indexOf(item);

}



class CardItem extends StatelessWidget{

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool slected;
  const CardItem({Key key,
  @required this.animation,
    this.onTap,
    @required this.item,
    this.slected = false
  }):assert(animation !=null),
    assert(item !=null && item >0),
    assert(slected !=null),
    super(key:key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (slected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Padding(padding: const EdgeInsets.all(2.0),
     child: SizeTransition(
       sizeFactor: animation,
       axis: Axis.vertical,
       child: GestureDetector(
         behavior: HitTestBehavior.opaque,
         onTap: onTap,
         child: SizedBox(
           height: 128,
           child: Card(
             color: Colors.primaries[item % Colors.primaries.length],
             child: Center(
               child: Text('item $item',style: textStyle ,),
             ),
           ),
         ),
       ),
     ),
    );
  }

}



