import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';
import 'package:inventory/domain/core/validator.dart';

class CountField extends StatelessWidget {
  const CountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      builder: (c) {
        return TextFormField(
          validator: FormFiledValidator.required,
          initialValue: c.item.count.toString(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          onChanged: c.onCountChanged,
          decoration: const InputDecoration(
            labelText: 'Count',
          ),
        );
      },
    );
  }
}
