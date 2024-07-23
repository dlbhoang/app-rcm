import 'package:flutter/material.dart';

class CurvedBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.blue; // Background color
    final Path path = Path();

    path.lineTo(0, size.height - 30); // Start from the bottom left

    // Draw a smooth curve
    path.quadraticBezierTo(
      size.width * 0.25, size.height, // Control point
      size.width * 0.5, size.height - 30, // End point of the curve
    );

    path.quadraticBezierTo(
      size.width * 0.75, size.height - 60, // Second control point
      size.width, size.height - 30, // End point of the second curve
    );

    path.lineTo(size.width, 0); // Go to the top right corner
    path.close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
