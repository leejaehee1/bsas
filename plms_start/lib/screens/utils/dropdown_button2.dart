import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plms_start/screens/controller/dropdown_button_controller2.dart';

class DropdownButtonWidget2 extends GetView<DropdownButtonController2> {
  const DropdownButtonWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem2.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu2(value);
          },
          items: DropDownMenu2.values
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
