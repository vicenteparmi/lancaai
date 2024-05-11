import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MaterialYouShape extends StatefulWidget {
  const MaterialYouShape({super.key});

  @override
  MaterialYouShapeState createState() => MaterialYouShapeState();
}

class MaterialYouShapeState extends State<MaterialYouShape>
    with SingleTickerProviderStateMixin {
  ui.Image? _image;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 45),
      vsync: this,
    )..repeat();
    _loadImage();
  }

  Future<void> _loadImage() async {
    const imageProvider = AssetImage('assets/rita.jpg');
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final completer = Completer<ui.Image>();
    imageStream.addListener(ImageStreamListener((imageInfo, _) {
      completer.complete(imageInfo.image);
    }));
    _image = await completer.future;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            blurRadius: 100,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          // Image as background
          if (_image != null) {
            final Matrix4 transform = Matrix4.identity();
            final double imageAspect = _image!.width / _image!.height;
            final double boundsAspect = bounds.width / bounds.height;

            double scale;
            if (imageAspect > boundsAspect) {
              // Image is wider than bounds, scale to fit width
              scale = bounds.width / _image!.width;
            } else {
              // Image is taller than bounds, scale to fit height
              scale = bounds.height / _image!.height;
            }

            // Center the image
            final double dx = (bounds.width - _image!.width * scale) / 2;
            final double dy = (bounds.height - _image!.height * scale) / 2;
            transform.translate(dx, dy);
            transform.scale(scale);

            return ImageShader(
                _image!, TileMode.clamp, TileMode.clamp, transform.storage);
          } else {
            return LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ]).createShader(bounds);
          }
        },
        blendMode: BlendMode
            .srcIn, // Use the CustomPainter as a mask on top of the gradient
        child: RotationTransition(
          turns: _controller,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: CirclePainter(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Create the painter
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double waveHeight = 3; // animationState.value * 3;
    double waveWidth = 12; // animationState.value * 12;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 20;

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    List<Offset> points = [];
    for (double angle = 0; angle <= 2 * pi; angle += pi / 36) {
      final x = center.dx +
          (radius + sin(angle * waveWidth) * waveHeight) * cos(angle);
      final y = center.dy +
          (radius + sin(angle * waveWidth) * waveHeight) * sin(angle);
      points.add(Offset(x, y));
    }

    // Ensure the spline is closed properly
    points.add(points.first);

    final spline = CatmullRomSpline(points);

    final path = Path()
      ..addPolygon(
          spline.generateSamples().map((tn) => tn.value).toList(), true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
