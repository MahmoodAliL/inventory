import 'package:inventory/app/core/value/dimens.dart';
import 'package:inventory/domain/core/inventory_item.dart';
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

Table buildTable({required List<InventoryPrintingItem> list}) {
  return Table(
    border: TableBorder.all(),
    children: [
      buildTableHeader(),
      ...list.map(buildTableRows).toList(),
    ],
  );
}

TableRow buildTableHeader() {
  return TableRow(
    children: [
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
      buildTableText(item.count.toString()),
      buildTableText(item.name),
      buildTableText(PdfPageBuilder.serialNumber.toString()),
    ],
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
