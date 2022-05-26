import 'package:flutter/material.dart';
import 'package:getmage/constants/style.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String text;
  final int numbers;
  const CustomSliverAppbar(
      {Key? key, required this.text, required this.numbers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      actions: [Container()],
      title: Row(
        children: [
          SizedBox(width: 50),
          Text(text, style: TextStyle(fontSize: 20, color: dark)),
          Expanded(child: Container()),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: '${numbers}\n',
                    style: TextStyle(fontSize: 16, color: dark)),
                TextSpan(
                    text: numbers < 2 ? 'item ' : 'items',
                    style: TextStyle(fontSize: 12, color: dark)),
              ])),
          SizedBox(width: 50),
        ],
      ),
      backgroundColor: grey,
    );
  }
}
