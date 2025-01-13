import 'package:flutter/material.dart';

class DonutRevealWidget extends StatefulWidget {
  final String imagePath;
  final double size; // Size of the container
  final Duration animationDuration;

  const DonutRevealWidget({
    super.key,
    required this.imagePath,
    this.size = 200.0,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  _DonutRevealWidgetState createState() => _DonutRevealWidgetState();
}

class _DonutRevealWidgetState extends State<DonutRevealWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showImage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow effect
        Container(
          width: widget.size + 20,
          height: widget.size + 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
        ),
        // Donut reveal effect
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipPath(
              clipper: DonutClipper(_animation.value),
              child: Container(
                width: widget.size + 20,
                height: widget.size + 20,
                color: Colors.white,
              ),
            );
          },
        ),
        // Show image after animation
        if (_showImage)
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}

class DonutClipper extends CustomClipper<Path> {
  final double progress;

  DonutClipper(this.progress);

  @override
  Path getClip(Size size) {
    final Path path = Path();
    double innerRadius = size.width * (0.5 - (progress * 0.5));
    double outerRadius = size.width * 0.5;

    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: outerRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: innerRadius));
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
