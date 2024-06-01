//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cv_maker/provider/controller.dart';
import 'package:provider/provider.dart';
import 'utils.dart';

class PdfPageX extends StatefulWidget {
  const PdfPageX({super.key});

  @override
  State<PdfPageX> createState() => _PdfPageXState();
}

class _PdfPageXState extends State<PdfPageX> {
  PrintingInfo? printingInfo;

  @override
  void initState() {
    super.initState();
    _init ();

  }

  Future<void>_init () async {
   final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context);
    pw.RichText.debug;
    //final actions = <PdfPreviewAction> [if(!kIsWeb)
     //const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile)];
    return Scaffold(
      //appBar: AppBar(),
      body: PdfPreview(
        maxPageWidth: 700,
        //actions: actions,
        onPrinted: showprintedToast,
        onShared: showSharedToast,
        build: provider.generetePdf_4,
      ),
    );
  }
}