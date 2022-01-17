import 'package:flutter/material.dart';

class CurvesPage extends StatelessWidget {
  const CurvesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvesPainter(),
      child: Container(),
    );
  }
}

class CurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, 200)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 200.0)
      ..lineTo(size.width, 0.0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
