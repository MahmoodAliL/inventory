import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';
import 'package:inventory/app/pages/form/widgets/confirm_delete_dialog.dart';

final actionBar = [
  GetBuilder<FormController>(
    builder: (c) {
      if (c.isEditing) {
        return IconButton(
          onPressed: () {
            Get.dialog<dynamic>(const ConfirmDeleteDialog());
          },
          icon: const Icon(Icons.delete_outline_outlined),
        );
      }
      return Container();
    },
  ),
];
