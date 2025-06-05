import 'dart:math';
import 'package:flutter/material.dart';

class MeteorAnimationScreen extends StatefulWidget {
  const MeteorAnimationScreen({super.key});

  @override
  _MeteorAnimationScreenState createState() => _MeteorAnimationScreenState();
}

class _MeteorAnimationScreenState extends State<MeteorAnimationScreen>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin for animation controller
  late AnimationController _controller;
  late Animation<double> _animation;

  // Meteor properties
  double meteorRadius = 30.0;
  double trailLength = 180.0; // Slightly longer trail
  int trailParticles = 30; // More particles for a smoother trail

  // Star properties
  final Random _random = Random();
  List<Offset> starPositions = [];
  int numberOfStars = 200; // More stars for a denser background

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8), // Duration for one full orbit
    )..repeat(); // Repeat the animation indefinitely

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          // Rebuilds the widget on every animation tick
        });
      });

    // Generate star positions once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateStars(MediaQuery.of(context).size);
    });
  }

  void _generateStars(Size size) {
    starPositions.clear();
    for (int i = 0; i < numberOfStars; i++) {
      starPositions.add(Offset(
        _random.nextDouble() * size.width,
        _random.nextDouble() * size.height,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: CustomPaint(
          size: Size.infinite, // Take up all available space
          painter: ShiningMeteorPainter(
            animationValue: _animation.value,
            meteorRadius: meteorRadius,
            trailLength: trailLength,
            trailParticles: trailParticles,
            starPositions: starPositions, // Pass star positions
          ),
        ),
      );
    
  }
}

class ShiningMeteorPainter extends CustomPainter {
  final double animationValue;
  final double meteorRadius;
  final double trailLength;
  final int trailParticles;
  final List<Offset> starPositions; // For drawing stars

  ShiningMeteorPainter({
    required this.animationValue,
    required this.meteorRadius,
    required this.trailLength,
    required this.trailParticles,
    required this.starPositions,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // --- Draw the Starry Background ---
    final starPaint = Paint()..color = Colors.white;
    for (final position in starPositions) {
      canvas.drawCircle(position, 0.5 + Random().nextDouble() * 1.5,
          starPaint); // Varied star sizes
    }

    // Simulate an elliptical orbit
    final orbitRadiusX = size.width * 0.35;
    final orbitRadiusY = size.height * 0.25;

    // Calculate meteor's position based on animation value
    final angle = animationValue * 2 * pi; // 0 to 2*pi
    final x = centerX + orbitRadiusX * cos(angle);
    final y = centerY + orbitRadiusY * sin(angle);

    // Simulate depth: smaller when further (top), larger when closer (bottom)
    final depthScale = 1.0 + (sin(angle) * 0.2); // Range from approx 0.8 to 1.2
    final currentMeteorRadius = meteorRadius * depthScale;

    // Calculate meteor's rotation angle (makes it appear to spin)
    final meteorRotationAngle =
        animationValue * 4 * pi; // Spins twice as fast as orbit

    // --- Draw the Trail ---
    for (int i = 0; i < trailParticles; i++) {
      final particleProgress = i / trailParticles; // 0.0 to 1.0
      final particleAlpha = (1.0 - particleProgress) * 255; // Fades out
      final particleSize = currentMeteorRadius *
          0.1 *
          (1 - particleProgress) *
          (1 +
              0.5 *
                  sin(particleProgress * 10 +
                      animationValue * pi)); // Twinkle effect

      final particleOffset = Offset(
        x -
            trailLength *
                particleProgress *
                cos(angle + pi * 0.9), // Slightly offset trail direction
        y - trailLength * particleProgress * sin(angle + pi * 0.9),
      );

      final trailPaint = Paint()
        ..color = Color.lerp(Colors.lightBlueAccent, Colors.purpleAccent,
                particleProgress)! // Mixed colors for trail
            .withOpacity(particleAlpha.toInt() / 255.0)
        ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal, 5.0); // Stronger glow for trail

      canvas.drawCircle(particleOffset, particleSize, trailPaint);
    }

    // --- Draw the Meteor Body ---
    final meteorCenter = Offset(x, y);

    // Save canvas state before transformations
    canvas.save();

    // Move origin to meteor center for rotation
    canvas.translate(meteorCenter.dx, meteorCenter.dy);
    // Apply rotation for the meteor itself
    canvas.rotate(meteorRotationAngle);
    // Move origin back
    canvas.translate(-meteorCenter.dx, -meteorCenter.dy);

    // Radial gradient for 3D spherical effect (from top-left light source)
    final gradient = RadialGradient(
      center: Alignment.topLeft, // Light source from top-left
      radius: 0.8,
      colors: const [
        Color(0xFFE0FFFF), // Azure (Brightest highlight)
        Color(0xFF87CEFA), // Light blue
        Color(0xFF4682B4), // Steel blue
        Color(0xFF00008B), // Dark blue
        Color(0xFF000030), // Very dark blue for deep shadow/edge
      ],
      stops: const [0.0, 0.3, 0.6, 0.9, 1.0],
    );

    final meteorPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: meteorCenter, radius: currentMeteorRadius),
      )
      ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal, 10.0); // Significantly stronger glow

    canvas.drawCircle(meteorCenter, currentMeteorRadius, meteorPaint);

    // --- Add a bright core/flare for "shining" effect ---
    final corePaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal, 15.0); // Even stronger blur for core
    canvas.drawCircle(meteorCenter, currentMeteorRadius * 0.4, corePaint);

    final smallerCorePaint = Paint()
      ..color = Colors.cyanAccent.withOpacity(0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0);
    canvas.drawCircle(
        meteorCenter.translate(
            -currentMeteorRadius * 0.1, -currentMeteorRadius * 0.1),
        currentMeteorRadius * 0.15,
        smallerCorePaint);

    // Restore canvas state
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ShiningMeteorPainter oldDelegate) {
    // Only repaint if animation value changes or star positions (though stars are static after init)
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.starPositions != starPositions;
  }
}
