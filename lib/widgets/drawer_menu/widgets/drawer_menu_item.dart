import 'package:flutter/material.dart';
import 'package:getmage/constants/style.dart';

class DrawerMenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;
  const DrawerMenuItem(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: _size.width / 3,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: dark, blurRadius: 4)],
            color: dark,
            border: Border.fromBorderSide(BorderSide(color: light)),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20))),
        child: Column(
          children: [
            Icon(
              icon,
              color: light,
              size: 18,
            ),
            Text(text, style: TextStyle(color: light))
          ],
        ),
      ),
    );
  }
}
