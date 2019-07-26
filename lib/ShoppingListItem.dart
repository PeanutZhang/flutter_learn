import 'package:flutter/material.dart';

import 'Product.dart';

typedef void CartChangeCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangeCallback callback;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      title: new Text(product.name,style: _getTextStyle(context),),
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      onTap: ()=>callback(product,!inCart),
    );
  }

  ShoppingListItem({Product product, this.inCart, this.callback})
      : product = product,
        super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!inCart)return null;
    return new TextStyle(
      color: Colors.black54,
      decoration:TextDecoration.lineThrough
    );
  }




}
