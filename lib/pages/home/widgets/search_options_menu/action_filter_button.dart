import 'package:flutter/material.dart';
import 'package:getmage/constants/style.dart';

class ActionFilterButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Function() onTap;
  const ActionFilterButton(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  State<ActionFilterButton> createState() => _ActionFilterButtonState();
}

class _ActionFilterButtonState extends State<ActionFilterButton>
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
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        controller
            .forward()
            .whenComplete(() => controller.reverse())
            .then((value) => Navigator.pop(context));
      },
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          width: _width * 0.3,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      widget.color == Colors.transparent ? light : widget.color,
                  width: 0.3),
              color: widget.color,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.text, style: TextStyle(fontSize: 18, color: light)),
              Icon(widget.icon, size: 25, color: light)
            ],
          ),
        ),
      ),
    );
  }
}
