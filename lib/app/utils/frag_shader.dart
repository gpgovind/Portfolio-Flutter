import 'dart:math';
import 'package:flutter/material.dart';

class Bird {
  Offset position;
  double speed;
  double size;
  Color color;
  double initialYOffset;

  Bird({
    required this.position,
    required this.speed,
    required this.size,
    required this.color,
    required this.initialYOffset,
  });

  void update(Size canvasSize) {
    position = Offset(position.dx + speed,
        initialYOffset + sin(position.dx / 50) * (size / 2));

    if (position.dx > canvasSize.width + size) {
      reset(canvasSize);
    }
  }

  void reset(Size canvasSize) {
    final random = Random();

    position = Offset(
      -size * (1 + random.nextDouble()),
      random.nextDouble() * canvasSize.height,
    );
    speed = 1 + random.nextDouble() * 3;
    size = 10 + random.nextDouble() * 15;
    color = Colors.blue.withOpacity(0.5 + random.nextDouble() * 0.4);
    initialYOffset = position.dy;
  }
}

class BirdMigrationBackground extends StatefulWidget {
  const BirdMigrationBackground({super.key});

  @override
  _BirdMigrationBackgroundState createState() =>
      _BirdMigrationBackgroundState();
}

class _BirdMigrationBackgroundState extends State<BirdMigrationBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bird> _birds = [];
  final int _numberOfBirds = 30;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialSize = MediaQuery.of(context).size;
      for (int i = 0; i < _numberOfBirds; i++) {
        final random = Random();
        final initialX = random.nextDouble() * initialSize.width;
        final initialY = random.nextDouble() * initialSize.height;
        _birds.add(
          Bird(
            position: Offset(initialX, initialY),
            speed: 1 + random.nextDouble() * 3,
            size: 10 + random.nextDouble() * 15,
            color: Colors.blue.withOpacity(0.5 + random.nextDouble() * 0.4),
            initialYOffset: initialY,
          ),
        );
      }
    });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final canvasSize = constraints.biggest;
        return CustomPaint(
          size: canvasSize,
          painter: BirdPainter(_birds, _controller, canvasSize),
        );
      },
    );
  }
}

class BirdPainter extends CustomPainter {
  final List<Bird> birds;
  final AnimationController controller;
  final Size canvasSize;

  // The 'repaint' argument ensures that paint() is called whenever the controller ticks,
  // making the animation smooth.
  BirdPainter(this.birds, this.controller, this.canvasSize)
      : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    // Iterate through each bird and draw it.
    for (final bird in birds) {
      bird.update(
          canvasSize); // Update the bird's position for the current frame.

      final birdPaint = Paint()
        ..color = bird.color // Use the bird's assigned color.
        ..style = PaintingStyle.fill; // Fill the bird shape.

      // Create a more realistic bird shape using Path.
      Path birdPath = Path();

      // Body (a slightly elongated oval)
      double bodyWidth = bird.size * 0.8;
      double bodyHeight = bird.size * 0.4;
      Rect bodyRect = Rect.fromCenter(
          center: bird.position, width: bodyWidth, height: bodyHeight);
      birdPath.addOval(bodyRect);

      // Head (a small circle on top-left of the body)
      double headRadius = bird.size * 0.2;
      Offset headCenter = Offset(bird.position.dx - bodyWidth * 0.3,
          bird.position.dy - bodyHeight * 0.3);
      birdPath.addOval(Rect.fromCircle(center: headCenter, radius: headRadius));

      // Tail (a small triangle or tapered shape on the right)
      birdPath.moveTo(bird.position.dx + bodyWidth * 0.4,
          bird.position.dy); // Start near the back of the body
      birdPath.lineTo(bird.position.dx + bodyWidth * 0.6,
          bird.position.dy + bodyHeight * 0.2); // Tail point 1
      birdPath.lineTo(bird.position.dx + bodyWidth * 0.6,
          bird.position.dy - bodyHeight * 0.2); // Tail point 2
      birdPath.close();

      // Wings (more defined than simple V-shape)
      // Left wing
      birdPath.moveTo(bird.position.dx - bodyWidth * 0.2,
          bird.position.dy - bodyHeight * 0.1); // Base near body
      birdPath.lineTo(bird.position.dx - bodyWidth * 0.8,
          bird.position.dy - bodyHeight * 0.8); // Tip of the wing up
      birdPath.lineTo(bird.position.dx - bodyWidth * 0.5,
          bird.position.dy); // Bottom trailing edge
      birdPath.close();

      // Right wing
      birdPath.moveTo(bird.position.dx + bodyWidth * 0.2,
          bird.position.dy - bodyHeight * 0.1); // Base near body
      birdPath.lineTo(bird.position.dx + bodyWidth * 0.8,
          bird.position.dy - bodyHeight * 0.8); // Tip of the wing up
      birdPath.lineTo(bird.position.dx + bodyWidth * 0.5,
          bird.position.dy); // Bottom trailing edge
      birdPath.close();

      canvas.drawPath(birdPath, birdPaint); // Draw the complete bird shape.
    }
  }

  @override
  bool shouldRepaint(covariant BirdPainter oldDelegate) {
    // This method is called by Flutter to determine if the painter needs to be repainted.
    // Since we are using `super(repaint: controller)` in the constructor, the repainting
    // is already handled by the animation controller's ticks. Thus, we can safely
    // return `false` here as external changes to properties would not be common.
    return false;
  }
}
