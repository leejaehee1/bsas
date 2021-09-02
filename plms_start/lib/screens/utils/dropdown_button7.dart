import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller7.dart';

class DropdownButtonWidget7 extends GetView<DropdownButtonController7> {
  const DropdownButtonWidget7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
          isExpanded: true,
          value: controller.currentItem2.value.index,
          onChanged: (int? value) {
            controller.changeDropDownMenu2(value);
          },
          items: DropDownMenu7.values
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
