import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/routing/routes.dart';

class LoginButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;

  const LoginButton(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
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
          controller.forward().whenComplete(() {
            controller.reverse().then((value) async {
              Map result = await authController.signInWithGoogle();
              bool success = result['success'];
              String message = result['message'];
              if (!success) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              } else {
                Get.offAllNamed(RootRoute);
              }
            });
          });
        },
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              decoration: BoxDecoration(
                  color: widget.color, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(widget.icon, color: light, size: 20),
                  const SizedBox(width: 20),
                  Text(widget.text,
                      style: TextStyle(fontSize: 20, color: light))
                ],
              )),
        ));
  }
}
