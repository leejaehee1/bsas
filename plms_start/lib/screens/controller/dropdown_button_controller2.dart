import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu2 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention2 on DropDownMenu2 {
  String get name {
    switch (this) {
      case DropDownMenu2.DEFAULT0:
        return 'System1';
      case DropDownMenu2.MENU1:
        return 'System2';
      case DropDownMenu2.MENU2:
        return 'System3';
    }
  }
}

class DropdownButtonController2 extends GetxController {
  Rx<DropDownMenu2> currentItem2 = DropDownMenu2.DEFAULT0.obs;

  void changeDropDownMenu2(int? itemIndex) {
    var selectedItem2 =
        DropDownMenu2.values.where((menu) => menu.index == itemIndex).first;
    currentItem2(selectedItem2);
  }
}
