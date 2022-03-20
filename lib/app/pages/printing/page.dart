// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/app/pages/printing/controller/printing_controler.dart';
import 'package:inventory/app/pages/printing/widgets/pdf_page.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintingPage extends StatelessWidget {
  const PrintingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Printing Page'),
      ),
      body: PdfPreview(
        canChangePageFormat: false,
        build: (format) => _generatePdf(format, 'قائمة الجرد'),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final font =
        await rootBundle.load('lib/app/assets/fonts/Cairo-Medium.ttf');
    final ttf = pw.Font.ttf(font);

    final pdf = pw.Document(
      title: title,
      theme: pw.ThemeData.withFont(base: ttf),
    );

    final result = await PrintingControler.to.loadAllItems();
    PdfPageBuilder.resetSerialNumber();

    result.forEach((page, itemList) {
      pdf.addPage(
        PdfPageBuilder(pageNumber: page, inventoryList: itemList).build(),
      );
    });

    return pdf.save();
  }
}
