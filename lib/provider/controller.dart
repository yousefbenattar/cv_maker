import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class Controller extends ChangeNotifier {
  XFile? imagea;
  void pickImage () async {
     ImagePicker picker = ImagePicker();
     XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image!=null){
      imagea = _image;
    }
    notifyListeners();
  }
  
  TextEditingController username = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController summery = TextEditingController();
  TextEditingController experience_1 = TextEditingController();
  TextEditingController experience_2 = TextEditingController();
  TextEditingController experience_3 = TextEditingController();
  TextEditingController experiencetext_1 = TextEditingController();
  TextEditingController experiencetext_2 = TextEditingController();
  TextEditingController experiencetext_3 = TextEditingController();
  TextEditingController education_1 = TextEditingController();
  TextEditingController education_2 = TextEditingController();
  TextEditingController education_3 = TextEditingController();
  TextEditingController educationtext_1 = TextEditingController();
  TextEditingController educationtext_2 = TextEditingController();
  TextEditingController educationtext_3 = TextEditingController();
  TextEditingController additionalinformation_1 = TextEditingController();
  TextEditingController additionalinformation_2 = TextEditingController();
  TextEditingController additionalinformation_3 = TextEditingController();
  TextEditingController additionalinformationtext_1 = TextEditingController();
  TextEditingController additionalinformationtext_2 = TextEditingController();
  TextEditingController additionalinformationtext_3 = TextEditingController();
  TextEditingController duration_1 = TextEditingController();
  TextEditingController duration_2 = TextEditingController();
  TextEditingController duration_3 = TextEditingController();
  TextEditingController duration_4 = TextEditingController();
  TextEditingController duration_5 = TextEditingController();
  TextEditingController duration_6 = TextEditingController();

   void methode() {
    notifyListeners();
  }





Future<void> generatePdfWithPickedImage() async {
    if (imagea == null) {
      print("No image selected");
      return;
    }

    final pdf = pw.Document();
    final imageBytes = await imagea!.readAsBytes();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(
              pdfImage,
              width: 200, // Specify the width
              height: 200, // Specify the height
              fit: pw.BoxFit.cover, // Control how the image is fitted
            ),
          );
        },
      ),
    );

    final output = await getExternalStorageDirectory();
    final file = File("${output!.path}/picked_image_example.pdf");
    await file.writeAsBytes(await pdf.save());

    print("PDF Saved at ${file.path}");
  }







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

Future<Uint8List> generetePdf_1 (final PdfPageFormat format ) async {
    //final pdf = pw.Document();
    final imageBytes = await imagea!.readAsBytes();
    final pdfImage = pw.MemoryImage(imageBytes);
  final doc = pw.Document(title: "Flutter School");
  //final logoImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  //final footerImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
  //final image = pw.MemoryImage((await rootBundle.load('assets/profiles/1.jpg',)).buffer.asUint8List());

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
                pw.Image(pdfImage,width: 100,height: 100,),
                pw.SizedBox(width: 50),
                pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
                pw.Text(username.text,style: pw.TextStyle(
                  fontSize: 25,fontWeight: pw.FontWeight.bold
                )),
                pw.Row(children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                  pw.Text("Adress",style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Phone",style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Email",style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                  pw.Text("WebSite",style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                ]),
                pw.SizedBox(width: 20),
                pw.Column(children: [
                  pw.Text(adress.text),
                  pw.Text(phone.text),
                  pw.Text(email.text),
                  pw.Text(website.text),
                ]),
                ]),
                ]),
                pw.SizedBox(width: 70),
           
            ])
          ),
          pw.Text('About Me',style:pw.TextStyle(
            color: PdfColors.black,
            fontSize: 25,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: summery.text,
            margin: const pw.EdgeInsets.only(top: 10),
            style:const pw.TextStyle(fontSize: 10)),

          pw.SizedBox(height: 10),
         pw.Text('Work Experience',style:pw.TextStyle(color: PdfColors.black,fontSize: 15,fontWeight: pw.FontWeight.bold,)),
         pw.Divider(color: PdfColors.black,),
          pw.SizedBox(height: 10),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text(experience_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text(duration_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experiencetext_1.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
         pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text(experience_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text(duration_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experiencetext_2.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text(experience_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text(duration_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: experiencetext_3.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.SizedBox(height: 10),
          pw.Text('Education',style:pw.TextStyle(
            fontSize: 15,color: PdfColors.black,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Divider(color: PdfColors.black,),
          pw.SizedBox(height: 10),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text(education_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text(duration_4.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: educationtext_1.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
         pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text(education_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text(duration_5.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: educationtext_2.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.Column(children: [
             pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
     pw.Text(education_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
     pw.Text(duration_6.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
    
    ]),
     pw.Paragraph(
            text: educationtext_3.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
          ],),
          pw.SizedBox(height: 10),
           pw.Text('Additiona Information',style:pw.TextStyle(
            fontSize: 15,color: PdfColors.black,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Divider(color: PdfColors.black,),
          pw.Column(children: [
            pw.Row(
              //mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Expanded(child:  pw.Paragraph(
            text: additionalinformationtext_1.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Expanded(child:  pw.Paragraph(
            text: additionalinformationtext_2.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
         pw.Expanded(child:  pw.Paragraph(
            text: additionalinformationtext_3.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),),
            ]),]),]));return doc.save();
            
            }
            
























Future<Uint8List> generetePdf_2 (final PdfPageFormat format ) async {
//final pdf = pw.Document();
final imageBytes = await imagea!.readAsBytes();
final pdfImage = pw.MemoryImage(imageBytes);
final doc = pw.Document(title: "Flutter School");
//final logoImage = pw.MemoryImage((await rootBundle.load("assets/flutter_school.png")).buffer.asUint8List());
//final footerImage = pw.MemoryImage((await rootBundle.load("assets/a_1.png")).buffer.asUint8List());
//final image = pw.MemoryImage((await rootBundle.load('assets/profiles/1.jpg',)).buffer.asUint8List());
final pageTheme = await _myPageTheme(format);
doc.addPage(
    pw.MultiPage(
      pageTheme:pageTheme,
        //header: (final context)=>pw.Image(alignment: pw.Alignment.topLeft,logoImage,fit: pw.BoxFit.contain,width: 100),
        //footer: (final context) =>pw.Image(footerImage,fit: pw.BoxFit.scaleDown,height: 50),
        build: (final context)=>[
          pw.Container(
          //padding: const pw.EdgeInsets.only(left: 0,bottom: 20),
          child: pw.Row(
              children: [
                pw.Container(
                  padding:const pw.EdgeInsets.all(10),
                    //color: PdfColors.red,
                    height: 810,width: 200,
                  child: pw.Column(children: [
                    pw.Container(
                      margin:const pw.EdgeInsets.only(top: 10),
                      height: 120,width: 120,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color:PdfColors.black,width: 2),
                        borderRadius: pw.BorderRadius.circular(60),
                        image: pw.DecorationImage(image: pdfImage)
                      ),
                    ),
                    pw.SizedBox(height: 10,),
                    pw.Text("About Me",style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold)),
                    pw.Paragraph(
            text: summery.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            //pw.SizedBox(height: 10),
            pw.Text("Contact Me",style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold)),pw.SizedBox(height: 10),
            pw.Row(children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                  pw.Text("Adress",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Phone",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Email",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("WebSite",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                ]),
                pw.SizedBox(width: 10),
                pw.Column(children: [
                  pw.Text(adress.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(phone.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(email.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(website.text,style:const pw.TextStyle(fontSize: 10)),
                ]),
                ]),pw.SizedBox(height: 10),
           pw.Column(
          //crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Text(additionalinformation_1.text,style:pw.TextStyle(fontSize: 13,fontWeight: pw.FontWeight.bold,)),
          pw.SizedBox(height: 10),
           pw.Paragraph(
            text: additionalinformationtext_1.text,
            style:const pw.TextStyle(fontSize: 10)),
            ]),
          pw.Column(
          //crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Text(additionalinformation_1.text,style:pw.TextStyle(fontSize: 13,fontWeight: pw.FontWeight.bold,)),
          pw.SizedBox(height: 10),
           pw.Paragraph(
            text: additionalinformationtext_1.text,
            style:const pw.TextStyle(fontSize: 10)),
            ]),

         pw.Column(
  
          //crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Text(additionalinformation_1.text,style:pw.TextStyle(fontSize: 13,fontWeight: pw.FontWeight.bold,)),
          pw.SizedBox(height: 10),
           pw.Paragraph(
            text: additionalinformationtext_1.text,
            style:const pw.TextStyle(fontSize: 10)),
            ]),

                  ],)
                ),

                pw.Container(
                  
                  //color: PdfColors.green,
                  height: 810,width: 350,
                child: pw.Column(
                  children: [
                     pw.Container(
                        alignment: pw.Alignment.center,
                        width: 350,height: 100,
                        decoration:const pw.BoxDecoration(
                          color:PdfColors.black
                        ),
                        child: pw.Text(username.text,style: pw.TextStyle(color:PdfColors.white,fontSize: 20,fontWeight: pw.FontWeight.bold)),
                      ),
                     pw.Padding(
                       padding:const pw.EdgeInsets.all(10.0),
                       child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,
                           children: [
                           pw.SizedBox(height: 10),
                           pw.Text('Education',style:pw.TextStyle(
                           fontSize: 15,color: PdfColors.black,
                           fontWeight: pw.FontWeight.bold,
          )),
          pw.Divider(color: PdfColors.black,),
          pw.Text(education_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_1.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.Text(education_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_2.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.Text(education_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_3.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 10),  pw.Text('Additiona Information',style:pw.TextStyle(
          fontSize: 15,color: PdfColors.black,
          fontWeight: pw.FontWeight.bold,
          )),
          pw.Divider(color: PdfColors.black,),
          pw.Column(children: [
            pw.Column(
              //mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
          pw.Text(additionalinformation_1.text,style:pw.TextStyle(fontSize: 13,fontWeight: pw.FontWeight.bold,)),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Paragraph(
            text: additionalinformationtext_1.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: additionalinformationtext_2.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
         
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
         pw.Paragraph(
           text: additionalinformationtext_3.text,
           //margin: const pw.EdgeInsets.only(top: 5),
           style:const pw.TextStyle(fontSize: 10)),
           ],),]),
                     
                  ],
                )
),
])),
]))]
)
)
;return doc.save();}








Future<Uint8List> generetePdf_3 (final PdfPageFormat format ) async {
final doc = pw.Document(title: "Flutter School");
final imageBytes = await imagea!.readAsBytes();
final pdfImage = pw.MemoryImage(imageBytes);
final pageTheme = await _myPageTheme(format);
doc.addPage(
    pw.MultiPage(
      pageTheme:pageTheme,

        build: (final context)=>[
          pw.Container(
            height: 810,
            width: 550,
            //color: PdfColors.amber,
            child: pw.Column(children: [
              pw.Text(username.text,style: pw.TextStyle(color:PdfColors.black,fontSize: 30,fontWeight: pw.FontWeight.bold)),
              pw.Container(
              margin:const pw.EdgeInsets.only(top: 10),
              height: 120,width: 120,
              decoration: pw.BoxDecoration(
              border: pw.Border.all(color:PdfColors.black,width: 2),
              //borderRadius: pw.BorderRadius.circular(60),
              image: pw.DecorationImage(image: pdfImage)),),
              pw.SizedBox(height: 10),
              pw.Row(children: [



            pw.Container(
            //color: PdfColors.red,
            height: 634,width: 270,padding:const pw.EdgeInsets.all(10),
            child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
            pw.Text("About Me",style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold)),
            pw.Paragraph(
            text: summery.text,
            margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            //pw.SizedBox(height: 10),
            pw.Text("Contact Me",style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold)),pw.SizedBox(height: 10),
            pw.Row(children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                  pw.Text("Adress",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Phone",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Email",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("WebSite",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                ]),
                pw.SizedBox(width: 10),
                pw.Column(children: [
                  pw.Text(adress.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(phone.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(email.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(website.text,style:const pw.TextStyle(fontSize: 10)),
                ]),
                pw.Column(children: [
                  
                ],)
                ]),
                pw.SizedBox(height: 10),
                pw.Column(children: [
            pw.Column(
              //mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Paragraph(
            text: additionalinformationtext_1.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: additionalinformationtext_2.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
         
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
         pw.Paragraph(
           text: additionalinformationtext_3.text,
           //margin: const pw.EdgeInsets.only(top: 5),
           style:const pw.TextStyle(fontSize: 10)),
           ],),
           ]),
         ],),
          ),




          pw.Container(
          //color: PdfColors.blue,
          height: 634,width: 270,padding:const pw.EdgeInsets.all(10),
          child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Text(education_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_1.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.Text(education_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_2.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.Text(education_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_3.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),

            pw.Column(
              //mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Paragraph(
            text: additionalinformationtext_1.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: additionalinformationtext_2.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
            pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
         
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
         pw.Paragraph(
           text: additionalinformationtext_3.text,
           //margin: const pw.EdgeInsets.only(top: 5),
           style:const pw.TextStyle(fontSize: 10)),
           ],),
           
          
                ],)),
              ],)

],)
)])
);
return doc.save();}












Future<Uint8List> generetePdf_4 (final PdfPageFormat format ) async {
final doc = pw.Document(title: "Flutter School");
final imageBytes = await imagea!.readAsBytes();
final pdfImage = pw.MemoryImage(imageBytes);
final pageTheme = await _myPageTheme(format);
doc.addPage(
    pw.MultiPage(
      pageTheme:pageTheme,

        build: (final context)=>[
          pw.Container(
            height: 810,
            width: 550,
            //color: PdfColors.amber,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
              pw.Text(username.text,style: pw.TextStyle(color:PdfColors.black,fontSize: 30,fontWeight: pw.FontWeight.bold)),
              pw.Container(
              margin:const pw.EdgeInsets.only(top: 10),
              height: 120,width: 120,
              decoration: pw.BoxDecoration(
              border: pw.Border.all(color:PdfColors.black,width: 2),
              //borderRadius: pw.BorderRadius.circular(60),
              image: pw.DecorationImage(image: pdfImage)),),
              pw.SizedBox(height: 10),
              pw.Row(children: [
            pw.Container(
            //color: PdfColors.red,
            height: 634,width: 220,padding:const pw.EdgeInsets.all(10),
            child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
           pw.Row(children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                  pw.Text("Adress",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Phone",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Email",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  pw.Text("WebSite",style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                ]),
                pw.SizedBox(width: 10),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                  pw.Text(adress.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(phone.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(email.text,style:const pw.TextStyle(fontSize: 10 )),
                  pw.Text(website.text,style:const pw.TextStyle(fontSize: 10)),
                ]),
                ]),pw.SizedBox(height: 10),
                  pw.Column(children: [
            pw.Column(
              //mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Paragraph(
            text: additionalinformationtext_1.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: additionalinformationtext_2.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
         
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
         pw.Paragraph(
           text: additionalinformationtext_3.text,
           //margin: const pw.EdgeInsets.only(top: 5),
           style:const pw.TextStyle(fontSize: 10)),
           ],),
           ]),

            ],),
            ),




          pw.Container(
          //color: PdfColors.blue,
          height: 634,width: 320,padding:const pw.EdgeInsets.all(10),
          child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
          pw.Text(education_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_1.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_1.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.Text(education_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_2.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_2.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),
          pw.Text(education_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Text(duration_3.text,style:pw.TextStyle(fontSize: 15,fontWeight: pw.FontWeight.bold,)),
          pw.Paragraph(text: educationtext_3.text,margin: const pw.EdgeInsets.only(top: 5),style:const pw.TextStyle(fontSize: 10)),

            pw.Column(
              //mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(width: 10),
          pw.Paragraph(
            text: additionalinformationtext_1.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
               pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.Paragraph(
            text: additionalinformationtext_2.text,
            //margin: const pw.EdgeInsets.only(top: 5),
            style:const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
            pw.Text(additionalinformation_1.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
          pw.SizedBox(height: 10),
         
          pw.Text(duration_4.text,style:pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
          )),
         pw.Paragraph(
           text: additionalinformationtext_3.text,
           //margin: const pw.EdgeInsets.only(top: 5),
           style:const pw.TextStyle(fontSize: 10)),
           ],),
           
          
                ],)
          
          ],)),


              ],)

],)
)])
);
return doc.save();}






}