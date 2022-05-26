import 'package:flutter/material.dart';
import 'package:getmage/constants/style.dart';

class TopModal extends StatefulWidget {
  const TopModal({Key? key}) : super(key: key);

  @override
  State<TopModal> createState() => _TopModalState();
}

class _TopModalState extends State<TopModal> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.elliptical(40, 20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: grey),
            height: 2,
            width: 50,
          ),
          const SizedBox(height: 10),
          Text('FILTERS', style: TextStyle(fontSize: 12, color: grey)),
          Divider(color: grey, indent: 20, endIndent: 20),
        ],
      ),
    );
  }
}
