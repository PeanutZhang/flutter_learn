import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {


  final String photo;
  final VoidCallback onTap;
  final double width;

  PhotoWidget({Key key, this.photo, this.onTap, this.width}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      child: Hero(tag: photo,
          child:Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.asset(photo,fit: BoxFit.contain,),
            ),
          )
      ),
    );
  }

}