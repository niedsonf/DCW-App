import 'package:flutter/material.dart';
import 'package:getmage/constants/style.dart';

class ActionButton extends StatefulWidget {
  final Color? bgColor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;
  const ActionButton(
      {Key? key,
      required this.bgColor,
      required this.iconColor,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50));
    scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller
            .forward()
            .whenComplete(() => controller.reverse())
            .then((value) => widget.onTap());
      },
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.bgColor,
              border: Border.all(color: widget.iconColor, width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(widget.icon, size: 30, color: widget.iconColor),
          ),
        ),
      ),
    );
  }
}
