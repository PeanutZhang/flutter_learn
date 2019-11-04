import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
class PickImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: PickImageWidget(),
    );
  }

}
class PickImageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PickImageState();
  }

}

class PickImageState extends State<PickImageWidget>{

  File _image;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _image==null?Text('No image seclected'):Image.file(_image,width: 440,height: 420,),
      floatingActionButton: FloatingActionButton(onPressed: getImage,
      tooltip: 'pick image',
      child: Icon(Icons.add_a_photo),
      ),
    );
  }

}