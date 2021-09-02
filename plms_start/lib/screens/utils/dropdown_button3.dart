import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller3.dart';

class DropdownButtonWidget3 extends GetView<DropdownButtonController3> {
  const DropdownButtonWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem3.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu3(value);
          },
          items: DropDownMenu3.values
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
