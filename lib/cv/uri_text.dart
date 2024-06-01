import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class UrLText extends pw.StatelessWidget {
  final String text;
  final String url;
  UrLText({required this.text, required this.url});

  @override
  pw.Widget build(final pw.Context context) => pw.UrlLink(
    destination: url,
    child: pw.Text(text,style:const pw.TextStyle(decoration: pw.TextDecoration.underline,color: PdfColors.blue))
  );
}