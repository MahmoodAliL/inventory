import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/app/pages/home/controller/dialog_controller.dart';
import 'package:inventory/domain/core/inventory_item.dart';
import 'package:inventory/domain/pages/home/repository.dart';

class IncrementCountDialog extends StatelessWidget {
  const IncrementCountDialog({Key? key, required this.inventoryItem})
      : super(key: key);
  final InventoryItem inventoryItem;

  @override
  Widget build(BuildContext context) {
    Get.put<DialogController>(DialogController(Get.find<IHomeRepository>()));

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppDimens.defaultBorderRadius,
      ),
      title: Text(inventoryItem.name),
      content: const _DialogContent(),
      actions: [
        TextButton(
          onPressed: () => Get.back<dynamic>(),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () async {
            await DialogController.to.incrementItemCount(id: inventoryItem.id);
          },
          child: const Text('ADD'),
        ),
      ],
    );
  }
}

class _DialogContent extends StatelessWidget {
  const _DialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DialogController>(
      builder: (c) {
        return TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          onChanged: c.onItemCountChanged,
          decoration: InputDecoration(
            labelText: 'Increment count',
            errorText: c.errorMessage,
          ),
        );
      },
    );
  }
}
