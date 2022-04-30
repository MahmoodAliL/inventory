import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';
import 'package:inventory/domain/core/validator.dart';

class PriceField extends StatelessWidget {
  const PriceField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      builder: (c) {
        return TextFormField(
          validator: FormFiledValidator.required,
          initialValue: c.item.price.toString(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,8}'))
          ],
          onChanged: c.onPriceChanged,
          decoration: const InputDecoration(
            labelText: 'Price',
          ),
        );
      },
    );
  }
}
