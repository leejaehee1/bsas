import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller.dart';

class DropdownButtonWidget extends GetView<DropdownButtonController> {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu(value);
          },
          items: DropDownMenu.values
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
