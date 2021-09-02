import 'package:get/get.dart';

enum DropDownMenu { DEFAULT, MENU1, MENU2 }
var aa = Get.arguments;
int len = aa.lenght;
// var bb = server.getReq('category');

extension DropDownMenuExtention on DropDownMenu {
  dynamic get name {
    // for (int idx; idx < len; idx++) {}

    switch (this) {
      case DropDownMenu.DEFAULT:
        return 'bb';
      case DropDownMenu.MENU1:
        return aa.result[1]['category'];
      case DropDownMenu.MENU2:
        return aa.result[2]['category'];
    }
  }
}

class DropdownButtonController extends GetxController {
  Rx<DropDownMenu> currentItem = DropDownMenu.DEFAULT.obs;

  void changeDropDownMenu(int? itemIndex) {
    var selectedItem =
        DropDownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectedItem);
  }
}
