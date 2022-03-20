import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';
import 'package:inventory/domain/core/validator.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      builder: (c) {
        return TextFormField(
          initialValue: c.item.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: FormFiledValidator.required,
          onChanged: c.onNameChanged,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
        );
      },
    );
  }
}
