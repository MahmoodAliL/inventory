import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppDimens.defaultBorderRadius,
      ),
      content: const Text('Do you really want to delete this item?'),
      actions: [
        TextButton(
          onPressed: () => Get.back<dynamic>(),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () async {
            await FormController.to.deleteItem();
          },
          child: const Text('DELETE'),
        ),
      ],
    );
  }
}
