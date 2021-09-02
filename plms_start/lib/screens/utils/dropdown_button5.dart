import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller5.dart';

class DropdownButtonWidget5 extends GetView<DropdownButtonController5> {
  const DropdownButtonWidget5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem5.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu5(value);
          },
          items: DropDownMenu5.values
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
