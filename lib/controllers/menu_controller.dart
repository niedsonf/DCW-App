import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/style.dart';

const DogMenuItem = 'Dogs';
const CatMenuItem = 'Cats';
const WaifuMenuItem = 'Waifus';

List<String> menuItems = [DogMenuItem, CatMenuItem, WaifuMenuItem];

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = CatMenuItem.obs;
  var hoverItem = ''.obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) {
      hoverItem.value = itemName;
    }
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case CatMenuItem:
        return _customIcon(FontAwesomeIcons.cat, itemName);
      case DogMenuItem:
        return _customIcon(FontAwesomeIcons.dog, itemName);
      case WaifuMenuItem:
        return _customIcon(FontAwesomeIcons.gift, itemName);
      default:
        return _customIcon(FontAwesomeIcons.gift, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(icon, size: 20, color: grey);
    }
    return Icon(icon, size: 16, color: isHovering(itemName) ? grey : grey);
  }
}
