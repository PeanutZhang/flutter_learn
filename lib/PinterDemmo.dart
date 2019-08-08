import 'package:flutter/material.dart';

class PinterDemmo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Signature()       ,
    );
  }

}

class SignaturePinter extends CustomPainter{

  final List<Offset> points;
  SignaturePinter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = new Paint()
        ..color = Colors.blue
        ..strokeCap = StrokeCap.round
        ..strokeWidth= 5.0;
    for(int i ; i<points.length-1;i++){
      if(points[i] != null && points[i+1] !=null){
        canvas.drawLine(points[i],points[i+1], paint);
      }
    }

  }

  @override
  bool shouldRepaint(SignaturePinter other) {
    // TODO: implement shouldRepaint
    return other.points != points;
  }

}

class Signature extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignatureState();
  }

}

class SignatureState extends State<Signature>{
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails detail){
        setState(() {

          RenderBox  referenceBox = context.findRenderObject();
          Offset locationOffset = referenceBox.globalToLocal(detail.globalPosition);
          _points = List.from(_points)..add(locationOffset);

        });
      },
      onPanEnd: (DragEndDetails details)=>_points.add(null),
      child:CustomPaint(painter:SignaturePinter(_points)),
    );
  }

}
