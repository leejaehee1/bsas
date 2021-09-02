import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu4 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention4 on DropDownMenu4 {
  String get name {
    switch (this) {
      case DropDownMenu4.DEFAULT0:
        return 'Action on1';
      case DropDownMenu4.MENU1:
        return 'Action on2';
      case DropDownMenu4.MENU2:
        return 'Action on3';
    }
  }
}

class DropdownButtonController4 extends GetxController {
  Rx<DropDownMenu4> currentItem4 = DropDownMenu4.DEFAULT0.obs;

  void changeDropDownMenu4(int? itemIndex) {
    var selectedItem4 =
        DropDownMenu4.values.where((menu) => menu.index == itemIndex).first;
    currentItem4(selectedItem4);
  }
}
