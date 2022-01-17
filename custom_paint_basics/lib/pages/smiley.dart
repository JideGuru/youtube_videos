import 'package:flutter/material.dart';

class SmileyPage extends StatelessWidget {
  const SmileyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SmileyPainter(),
      child: Container(),
    );
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    Paint eyePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    // Draw face Circle
    Offset center = Offset(size.width / 2.0, size.height / 2.0);
    canvas.drawCircle(center, 100.0, paint);

    // Draw Left Eye
    Offset leftEyePosition = Offset(size.width / 2.5, size.height / 2.2);
    Rect leftEyeRect =
        Rect.fromCenter(center: leftEyePosition, width: 10.0, height: 15.0);
    canvas.drawOval(leftEyeRect, eyePaint);

    // Draw Right eye
    Offset rightEyePosition = Offset(size.width / 1.7, size.height / 2.2);
    Rect rightEyeRect =
        Rect.fromCenter(center: rightEyePosition, width: 10.0, height: 15.0);
    canvas.drawOval(rightEyeRect, eyePaint);

    // Draw Mouth
    Path mouthPath = Path()
      ..moveTo(size.width / 2.9, size.height / 1.9)
      ..quadraticBezierTo(size.width / 2.0, size.height / 1.6, size.width / 1.5,
          size.height / 1.9);
    // ..lineTo(size.width / 1.5, size.height/ 1.8);
    canvas.drawPath(mouthPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
