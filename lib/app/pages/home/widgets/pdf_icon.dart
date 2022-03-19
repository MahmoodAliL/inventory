import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/app/routes/app_pages.dart';

class PdfIcon extends StatelessWidget {
  const PdfIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.black,
      icon: const Icon(
        Icons.picture_as_pdf_outlined,
      ),
      onPressed: () {
        Get.toNamed<dynamic>(AppRoutes.printing);
      },
    );
  }
}
