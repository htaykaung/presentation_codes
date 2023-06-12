import 'package:flutter/material.dart';

class NeumorphismButton extends StatefulWidget {
  const NeumorphismButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isRounded = false,
    this.width = 50,
    this.height = 50,
  });

  final double width;
  final double height;
  final bool isRounded;
  final IconData icon;
  final Function() onPressed;

  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  final Color color = const HSLColor.fromAHSL(1, 210, 0.57, 0.91).toColor();

  bool downing = false;

  @override
  void initState() {
    downing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) => setState(() {
        downing = true;
      }),
      onTapCancel: () => setState(() => downing = false),
      onTapUp: (d) => setState(() {
        downing = false;
      }),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(widget.isRounded ? widget.width / 2 : 10),
            color: color,
            boxShadow: downing
                ? [
                    BoxShadow(
                        color: Colors.grey[700]!,
                        offset: const Offset(8, 8),
                        spreadRadius: 1,
                        blurRadius: 20)
                  ]
                : [
                    BoxShadow(
                        color: Colors.grey[700]!,
                        offset: const Offset(8, 8),
                        spreadRadius: 1,
                        blurRadius: 20),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-8, -8),
                        spreadRadius: 1,
                        blurRadius: 20)
                  ]),
        child: Icon(
          widget.icon,
          size: 28,
        ),
      ),
    );
  }
}
