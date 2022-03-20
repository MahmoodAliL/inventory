import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/core/value/dimens.dart';

import 'package:inventory/app/core/widgets/body_container.dart';
import 'package:inventory/app/pages/home/controller/list_controller.dart';
import 'package:inventory/app/pages/home/widgets/inventory_list.dart';
import 'package:inventory/app/pages/home/widgets/pdf_icon.dart';
import 'package:inventory/app/routes/app_pages.dart';
import 'package:inventory/data/provider/app_database.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inventory',
          style: Get.textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [PdfIcon()],
      ),
      body: SafeArea(
        child: BodyContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimens.defaultPadding),
              TextField(
                onChanged: ListController.to.onSearchTextChanged,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search..',
                ),
              ),
              const SizedBox(height: AppDimens.defaultPadding * 2),
              const Expanded(child: InventoryList()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          Get.toNamed<dynamic>(AppRoutes.form);
        },
        //label: const Text('Add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
