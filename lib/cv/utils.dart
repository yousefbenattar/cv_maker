import 'dart:io';
//import 'package:cv_maker/gen/uri_text.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
//import '../examples/flutter_text.dart';
//import 'my_category.dart';

Future<void> saveAsFile(final BuildContext context, final LayoutCallback build,
  final PdfPageFormat pdfFormat) async {
  final bytes = await build(pdfFormat);
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File("$appDocPath/document.pdf");
  debugPrint('save as file ${file.path}...');
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Saved Successfully')));
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showprintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Printed Successfully')));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Shared Successfully')));
}

/*Future<Uint8List> generetePdf_1 (final PdfPageFormat format ) async {
  final doc = pw.Document(title: "Flutter School");
  final logoImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  final footerImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  final font = await rootBundle.load("assets/OpenSansRegular.ttf");
  final ttf = pw.Font.ttf(font);
  final pageTheme = await _myPageTheme(format);
  doc.addPage(
    pw.MultiPage(
      pageTheme:pageTheme,
      header: (final context)=>pw.Image(
        alignment: pw.Alignment.topLeft,
        logoImage,
        fit: pw.BoxFit.contain,
        width: 100),
        footer: (final context) =>pw.Image(footerImage,fit: pw.BoxFit.scaleDown),
        build: (final context)=>[
          pw.Container(
            padding: const pw.EdgeInsets.only(left: 30,bottom: 20),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end,children: [
                  pw.Text('Phone : '),
                  pw.Text('Email :'),
                  pw.Text('Instgram :'),
                ]),
                pw.SizedBox(width: 70),
                pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
                pw.Text('0040 4521 6524'),
                UrLText(text: "MyFlutterShcool", url: "youssefdisvitas@gmail.com"),
                UrLText(text: "flutter tutorial", url: "@flutter_tutorial"),
                ]),
                pw.SizedBox(width: 70),
                pw.BarcodeWidget(
                  data: 'Flutter Shcool',
                  width: 40,
                  height: 40,
                  barcode: pw.Barcode.qrCode(),
                  drawText: false),
                  pw.Padding(padding: pw.EdgeInsets.zero),
            ])
          ),
          pw.Center(child: pw.Text('In The Name Of God',style:pw.TextStyle(
            font: ttf,
            fontSize: 30,
            fontWeight: pw.FontWeight.bold,
          ))),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child:  MyCategory(title: "Flutter Shcool",font: ttf)
          ),
          pw.Paragraph(
            text: paragraph,
            margin: const pw.EdgeInsets.only(top: 100),
            style: pw.TextStyle(font: ttf,lineSpacing: 8,fontSize: 16)
            ),
        ]
    )
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme (PdfPageFormat format) async {
  final logoImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  return  pw.PageTheme(
    margin:const pw.EdgeInsets.symmetric(horizontal: 1*PdfPageFormat.cm,vertical: 0.5*PdfPageFormat.cm),
    textDirection: pw.TextDirection.ltr,
    orientation: pw.PageOrientation.portrait,
    buildBackground: (final content)=> pw.FullPage(
      ignoreMargins: true,
      child: pw.Watermark(angle: 20,child: pw.Opacity(opacity: 0.5,child: pw.Image(
        alignment: pw.Alignment.center,
        logoImage,fit: pw.BoxFit.fill
      ))) 
      )
  );
}*/

