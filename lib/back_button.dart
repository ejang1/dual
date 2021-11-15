import 'package:flutter/material.dart';

class BackButtonShape extends CustomPainter{
  BackButtonShape();
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint1 =Paint()
        ..color = Colors.amber
        ..style =PaintingStyle.fill
        ..strokeCap = StrokeCap.round
    ;

    Path path =Path();
    path.moveTo(size.height,size.width);
    path.lineTo(size.height, 0);
    path.lineTo(0,size.height/2);

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}