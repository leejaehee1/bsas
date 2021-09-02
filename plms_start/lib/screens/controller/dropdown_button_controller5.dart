import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu5 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention5 on DropDownMenu5 {
  String get name {
    switch (this) {
      case DropDownMenu5.DEFAULT0:
        return 'Discipline1';
      case DropDownMenu5.MENU1:
        return 'Discipline2';
      case DropDownMenu5.MENU2:
        return 'Discipline3';
    }
  }
}

class DropdownButtonController5 extends GetxController {
  Rx<DropDownMenu5> currentItem5 = DropDownMenu5.DEFAULT0.obs;

  void changeDropDownMenu5(int? itemIndex) {
    var selectedItem5 =
        DropDownMenu5.values.where((menu) => menu.index == itemIndex).first;
    currentItem5(selectedItem5);
  }
}
