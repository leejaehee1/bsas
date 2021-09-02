import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller6.dart';

class DropdownButtonWidget6 extends GetView<DropdownButtonController6> {
  const DropdownButtonWidget6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem2.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu2(value);
          },
          items: DropDownMenu6.values
              .map(
                (menu) => DropdownMenuItem(
                  value: menu.index,
                  child: Text(menu.name),
                ),
              )
              .toList()),
    );
  }
}
