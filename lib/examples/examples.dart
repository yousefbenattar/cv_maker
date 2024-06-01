import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'flutter_text.dart';
Future<pw.PageTheme> _myPageTheme (PdfPageFormat format) async {
  //final logoImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  return  pw.PageTheme(
    margin:const pw.EdgeInsets.symmetric(horizontal: 1*PdfPageFormat.cm,vertical: 0.5*PdfPageFormat.cm),
    textDirection: pw.TextDirection.ltr,
    orientation: pw.PageOrientation.portrait,
    buildBackground: (final content)=> pw.FullPage(
      ignoreMargins: true,
      //child: pw.Watermark(angle: 20,child: pw.Opacity(opacity: 0.5,child: pw.Image(
      //  alignment: pw.Alignment.center,
     //   logoImage,fit: pw.BoxFit.fill
     // ))) 
      )
  );
}

Future<Uint8List> generetePdf_2 (final PdfPageFormat format ) async {
  final doc = pw.Document(title: "Flutter School");
  //final logoImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  //final footerImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  final image = pw.MemoryImage((await rootBundle.load('assets/profiles/1.jpg',)).buffer.asUint8List());
  //final font = await rootBundle.load("assets/OpenSansRegular.ttf");
  //final ttf = pw.Font.ttf(font);
  final pageTheme = await _myPageTheme(format);
  doc.addPage(
    pw.MultiPage(
      pageTheme:pageTheme,
        //header: (final context)=>pw.Image(alignment: pw.Alignment.topLeft,logoImage,fit: pw.BoxFit.contain,width: 100),
        //footer: (final context) =>pw.Image(footerImage,fit: pw.BoxFit.scaleDown),
        build: (final context)=>[
          pw.Container(
            
            padding: const pw.EdgeInsets.only(left: 0,bottom: 20),
            child: pw.Row(
              //crossAxisAlignment: pw.CrossAxisAlignment.start,
              //mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Image(image,width: 100,height: 100,),
                pw.SizedBox(width: 50),
                pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
                pw.Text('User Name',style: pw.TextStyle(
                  fontSize: 25,fontWeight: pw.FontWeight.bold
                )),
                pw.Row(children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                  pw.Text("Adress",style: pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Phone",style: pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Email",style: pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold)),
                  pw.Text("WebSite",style: pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold)),
                ]),
                pw.SizedBox(width: 20),
                pw.Column(children: [
                  pw.Text("flutter tutorial"),
                  pw.Text("flutter tutorial"),
                  pw.Text("flutter tutorial"),
                  pw.Text("flutter tutorial"),
                  pw.Text("flutter tutorial"),
                ]),
                ])
                ]),
                pw.SizedBox(width: 70),
           
            ])
          ),
          pw.Text('Summery',style:pw.TextStyle(
            color: PdfColors.green,
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: paragraph,
            margin: const pw.EdgeInsets.only(top: 10),
            style:const pw.TextStyle(fontSize: 10)),

          pw.SizedBox(height: 10),
         pw.Text('Work Experience',style:pw.TextStyle(color: PdfColors.green,fontSize: 15,fontWeight: pw.FontWeight.bold,)),
         pw.Divider(color: PdfColors.black,),
          pw.SizedBox(height: 10),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text('Experience 1',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text('2022 - present',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experienceText,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
         pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text('Experience 2',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text('2022 - present',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experienceText,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text('Experience 3',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text('2022 - present',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experienceText,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.SizedBox(height: 10),
           pw.Text('Education',style:pw.TextStyle(
            fontSize: 15,color: PdfColors.green,
            fontWeight: pw.FontWeight.bold,
          )),pw.Divider(color: PdfColors.black,),
          pw.SizedBox(height: 10),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text('Experience 1',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text('2022 - present',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experienceText,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
         pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text('Experience 2',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text('2022 - present',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experienceText,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text('Experience 3',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text('2022 - present',style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experienceText,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.SizedBox(height: 10),
           pw.Text('Additiona Information',style:pw.TextStyle(
            fontSize: 15,color: PdfColors.green,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Divider(color: PdfColors.black,),
          pw.Column(children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
               pw.Text('Additiona Information',style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Expanded(child:  pw.Paragraph(
            text:  experienceText,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text('Additiona Information',style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Expanded(child:  pw.Paragraph(
            text:  experienceText,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text('Additiona Information',style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
         pw.Expanded(child:  pw.Paragraph(
            text:  experienceText,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),
          ]),
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text('Additiona Information',style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Expanded(child:  pw.Paragraph(
            text:  experienceText,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),
        ]
    )
  );
  return doc.save();
}