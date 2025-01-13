import 'package:flutter/material.dart';
import 'package:project_3d/Constants/colors.dart';
import 'package:project_3d/Constants/textstyle.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    required this.label,
    this.shadowColor,
    required this.onPressed,
  }) : super(key: key);

  final String label;

  final Color? shadowColor;
  final VoidCallback onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _isHovered ? 8 : 0,
              bottom: _isHovered ? 8 : 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: widget.shadowColor ?? Colors.grey.shade300,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label.toUpperCase(),
                      style: customTextStyle(
                        fontSize: 20,
                        color: _isHovered ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
            // Foreground button
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(left: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                color: _isHovered ? widget.shadowColor : Colors.white,
                border: Border.all(color: textColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label.toUpperCase(),
                    style: customTextStyle(
                      fontSize: 20,
                      color: _isHovered ? Colors.white : Colors.black,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _isHovered ? 10 : 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
