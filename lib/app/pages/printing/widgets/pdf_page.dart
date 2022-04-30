import 'package:inventory/app/core/utils/value_transformer.dart';
import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/domain/pages/printing/inventory_printing_item.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfPageBuilder {
  PdfPageBuilder({
    required this.pageNumber,
    required this.inventoryList,
  });
  //TODO: this var must not be here; but I don't have much time
  static int serialNumber = 0;
  final int pageNumber;
  final List<InventoryPrintingItem> inventoryList;

  static void resetSerialNumber() => serialNumber = 0;

  Page build() {
    return Page(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      build: (c) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              buildHeaderText('قائمة الجرد'),
              buildTable(list: inventoryList),
              Spacer(),
              buildPageNumber(pageNumber),
            ],
          ),
        );
      },
    );
  }

  Widget buildHeaderText(String text) {
    return Text(text, style: const TextStyle(fontSize: 32));
  }

  Widget buildPageNumber(int pageNumber) {
    return Text('-$pageNumber-');
  }
}

Column buildTable({required List<InventoryPrintingItem> list}) {
  return Column(
    children: [
      Table(
        border: TableBorder.all(),
        children: [
          buildTableHeader(),
          ...list.map(buildTableRows).toList(),
        ],
      ),
      buildTableFooter(list),
    ],
  );
}

TableRow buildTableHeader() {
  return TableRow(
    decoration: const BoxDecoration(color: PdfColors.grey300),
    children: [
      buildTableText('المجموع'),
      buildTableText('السعر'),
      buildTableText('العدد'),
       buildTableText('اسم المادة'),
      buildTableText('ت'),
    ],
  );
}

TableRow buildTableRows(InventoryPrintingItem item) {
  PdfPageBuilder.serialNumber++;

  return TableRow(
    children: [
      buildTableText(item.totalPrice.toStringDefaultFormat()),
      buildTableText(item.price.toStringDefaultFormat()),
      buildTableText(item.count.toString()),
      
      SizedBox(child: buildTableText(item.name), width: 150),
      buildTableText(PdfPageBuilder.serialNumber.toString()),
    ],
  );
}

Widget buildTableFooter(List<InventoryPrintingItem> list) {
  final totalPrice = list.fold<double>(0, (p, c) => p + c.totalPrice);
  return Container(
    decoration: BoxDecoration(border: Border.all(), color: PdfColors.grey300),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTableText(totalPrice.toStringDefaultFormat()),
        buildTableText('المجموع الكلي: '),
      ],
    ),
  );
}

Widget buildTableText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimens.defaultPadding,
    ),
    child: Text(
      text,
    ),
  );
}
