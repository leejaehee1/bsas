import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu3 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention3 on DropDownMenu3 {
  String get name {
    switch (this) {
      case DropDownMenu3.DEFAULT0:
        return 'Sub-System1';
      case DropDownMenu3.MENU1:
        return 'Sub-System2';
      case DropDownMenu3.MENU2:
        return 'Sub-System3';
    }
  }
}

class DropdownButtonController3 extends GetxController {
  Rx<DropDownMenu3> currentItem3 = DropDownMenu3.DEFAULT0.obs;

  void changeDropDownMenu3(int? itemIndex) {
    var selectedItem3 =
        DropDownMenu3.values.where((menu) => menu.index == itemIndex).first;
    currentItem3(selectedItem3);
  }
}
