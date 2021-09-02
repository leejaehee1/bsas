import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu6 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention6 on DropDownMenu6 {
  String get name {
    switch (this) {
      case DropDownMenu6.DEFAULT0:
        return 'Raised ON 1';
      case DropDownMenu6.MENU1:
        return 'Raised ON 2';
      case DropDownMenu6.MENU2:
        return 'Raised ON 3';
    }
  }
}

class DropdownButtonController6 extends GetxController {
  Rx<DropDownMenu6> currentItem2 = DropDownMenu6.DEFAULT0.obs;

  void changeDropDownMenu2(int? itemIndex) {
    var selectedItem2 =
        DropDownMenu6.values.where((menu) => menu.index == itemIndex).first;
    currentItem2(selectedItem2);
  }
}
