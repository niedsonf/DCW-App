import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/controllers/menu_controller.dart';
import 'package:getmage/pages/home/widgets/search_options_menu/action_filter_button.dart';
import 'package:getmage/pages/home/widgets/search_options_menu/dog_options/dropdown_breed_list.dart';
import 'package:getmage/pages/home/widgets/search_options_menu/top_modal.dart';

class SettingsModal extends StatefulWidget {
  final AnimationController animationController;
  const SettingsModal({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<SettingsModal> createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {
          Navigator.pop(context);
        },
        enableDrag: true,
        backgroundColor: Colors.transparent,
        animationController: widget.animationController,
        builder: (BuildContext context) => Container(
            height: 600,
            decoration: BoxDecoration(
                color: dark,
                boxShadow: [BoxShadow(color: grey, blurRadius: 1)],
                borderRadius: const BorderRadius.vertical(
                    top: Radius.elliptical(40, 20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopModal(),
                Expanded(child: Container()),
                if (menuController.activeItem.value == DogMenuItem)
                  DropdownBreedList(),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ActionFilterButton(
                        onTap: () {},
                        text: 'Reset',
                        icon: Icons.restore,
                        color: Colors.transparent),
                    ActionFilterButton(
                        onTap: () {},
                        text: 'Apply',
                        icon: Icons.check,
                        color: Colors.green),
                  ],
                ),
                Expanded(child: Container()),
              ],
            )));
  }
}
