import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/app/pages/home/controller/list_controller.dart';

class ConfirmResetDataDialog extends StatelessWidget {
  const ConfirmResetDataDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppDimens.defaultBorderRadius,
      ),
      title: const Text('Reset Data'),
      content: const Text(
        'ONLY  Name of goods will be remain ALL other data will be deleted',
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back<dynamic>(),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            ListController.to.resetData();
            Get.back<dynamic>();
          },
          child: const Text('DELETE'),
        ),
      ],
    );
  }
}
