import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller4.dart';

class DropdownButtonWidget4 extends GetView<DropdownButtonController4> {
  const DropdownButtonWidget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem4.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu4(value);
          },
          items: DropDownMenu4.values
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
