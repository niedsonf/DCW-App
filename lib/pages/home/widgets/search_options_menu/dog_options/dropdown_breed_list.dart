import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/dog_breed_list.dart';
import 'package:getmage/constants/style.dart';

class DropdownBreedList extends StatefulWidget {
  const DropdownBreedList({Key? key}) : super(key: key);

  @override
  State<DropdownBreedList> createState() => _DropdownBreedListState();
}

class _DropdownBreedListState extends State<DropdownBreedList> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Obx(
      () => SizedBox(
        width: _width * 0.75,
        child: DropdownButtonFormField(
          dropdownColor: dark,
          menuMaxHeight: 500,
          alignment: AlignmentDirectional.center,
          icon: Icon(Icons.arrow_upward, color: light, size: 20),
          decoration: InputDecoration(
              floatingLabelStyle: TextStyle(),
              prefixIcon: Icon(FontAwesomeIcons.dog, color: light, size: 18),
              contentPadding: const EdgeInsets.all(15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              label: Text('Choose a breed',
                  style: TextStyle(fontSize: 14, color: grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: light),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: light),
                  borderRadius: BorderRadius.circular(20))),
          value: dogController.activeBreed.value,
          items: dogBreedList.entries
              .map((e) => DropdownMenuItem(
                  child:
                      Text(e.key, style: TextStyle(fontSize: 18, color: light)),
                  value: e.value))
              .toList(),
          onChanged: (value) {
            dogController.changeActiveBreed(value.toString());
          },
        ),
      ),
    );
  }
}
