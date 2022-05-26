import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/services/user.dart';

class CustomSliverChild extends StatefulWidget {
  final List? urlList;
  const CustomSliverChild({Key? key, required this.urlList}) : super(key: key);

  @override
  State<CustomSliverChild> createState() => _CustomSliverChildState();
}

class _CustomSliverChildState extends State<CustomSliverChild> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate((context, index) {
          return Image.network(widget.urlList![index]);
        }, childCount: widget.urlList?.length));
  }
}
