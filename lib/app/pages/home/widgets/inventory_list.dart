import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:inventory/app/pages/home/controller/list_controller.dart';
import 'package:inventory/app/pages/home/widgets/increment_count_dialog.dart';
import 'package:inventory/app/pages/home/widgets/inventory_card.dart';
import 'package:inventory/app/routes/app_pages.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListController.to.obx(
      (list) => ListView.builder(
        itemCount: list!.length,
        itemBuilder: (build, index) {
          final item = list[index];
          return InventoryCard(
            onItemClick: () {
              Get.toNamed<dynamic>(AppRoutes.form, arguments: item);
            },
            onAddIconPressed: () {
              Get.dialog<dynamic>(IncrementCountDialog(inventoryItem: item));
            },
            item: item,
          );
        },
      ),
      onEmpty: const Center(
        child: Text('Inventory is empty'),
      ),
    );
  }
}
