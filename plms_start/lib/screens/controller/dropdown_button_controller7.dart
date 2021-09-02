import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/dropbox_text.dart';

enum DropDownMenu7 { DEFAULT0, MENU1, MENU2 }

extension DropDownMenuExtention7 on DropDownMenu7 {
  String get name {
    switch (this) {
      case DropDownMenu7.DEFAULT0:
        return 'Taget Date1';
      case DropDownMenu7.MENU1:
        return 'Taget Date2';
      case DropDownMenu7.MENU2:
        return 'Taget Date3';
    }
  }
}

class DropdownButtonController7 extends GetxController {
  Rx<DropDownMenu7> currentItem2 = DropDownMenu7.DEFAULT0.obs;

  void changeDropDownMenu2(int? itemIndex) {
    var selectedItem2 =
        DropDownMenu7.values.where((menu) => menu.index == itemIndex).first;
    currentItem2(selectedItem2);
  }
}
