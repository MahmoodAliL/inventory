import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/core/utils/value_transformer.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/domain/core/inventory_item.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({
    Key? key,
    required this.onItemClick,
    required this.onAddIconPressed,
    required this.item,
  }) : super(key: key);
  final VoidCallback onItemClick;
  final VoidCallback onAddIconPressed;
  final InventoryItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.defaultPadding),
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: AppDimens.defaultBorderRadius,
        ),
        onTap: onItemClick,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.defaultPadding * 2,
            vertical: AppDimens.defaultPadding * 1.2,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: AppDimens.defaultBorderRadius,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '${item.price.toStringDefaultFormat()}\$',
                      style: Get.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
              _Count(count: item.count),
              const SizedBox(width: AppDimens.defaultPadding * 2),
              AddButton(onPress: onAddIconPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: AppDimens.defaultBorderRadius,
        ),
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Count extends StatelessWidget {
  const _Count({
    Key? key,
    required this.count,
  }) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          count.toString(),
          style: Get.textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('Count', style: Get.textTheme.caption)
      ],
    );
  }
}
