import 'dart:io';

import 'package:cv_maker/provider/controller.dart';
import 'package:cv_maker/settings/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pdf_page.dart';
class FillPage extends StatelessWidget {
  const FillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Controller>(context);
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
              Container(margin: const EdgeInsets.only(top: 20),
      height: 60,
      width: double.infinity,
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2)),

          child:const Center(child: Text("Pick An Image",style: TextStyle(fontSize: 30),))),
              const SizedBox(height: 10,),
              provider.imagea == null ? IconButton(icon :const Icon(Icons.account_box_rounded,size: 100,),
              onPressed: (){
                provider.pickImage();
              },) : Image.file(File(provider.imagea!.path),width: 100,height: 100,),
              textField(provider,provider.username,"Your Full Name",90,1,30),
              textField(provider,provider.adress,"Your Adress",100,1,40),
              textField(provider,provider.phone,"Your Phone",100,1,30),
              textField(provider,provider.email,"Your Email",100,1,30),
              textField(provider,provider.website,"Your Website",100,1,30),
              textField(provider,provider.summery,"Summery",340,9,350),
              textField(provider,provider.education_1,"Education 1",100,1,35),
              textField(provider,provider.duration_4,"Education Duration",100,1,35),
              textField(provider,provider.educationtext_1,"Explain Your Education Here",180,4,150),
              textField(provider,provider.education_2,"Education 2",100,1,35),
              textField(provider,provider.duration_5,"Education Duration",100,1,35),
              textField(provider,provider.educationtext_2,"Explain Your Education Here",180,4,150),
              textField(provider,provider.education_3,"Education 3",100,1,35),
              textField(provider,provider.duration_6,"Education Duration",100,1,35),
              textField(provider,provider.educationtext_3,"Explain Your Education Here",180,4,150),
              textField(provider,provider.experience_1,"Experience 1 Name",100,1,35),
              textField(provider,provider.duration_1,"Experience Duration",100,1,35),
              textField(provider,provider.experiencetext_1,"Experience 1 Details",180,4,150),
              textField(provider,provider.experience_2,"Experience 2 Name",100,1,35),
              textField(provider,provider.duration_2,"Experience Duration",100,1,35),
              textField(provider,provider.experiencetext_2,"Experience 2 Details",180,4,150),
              textField(provider,provider.experience_3,"Experience 3 Name",100,1,35),
              textField(provider,provider.duration_3,"Experience Duration",100,1,35),
              textField(provider,provider.experiencetext_3,"Experience 3 Details",180,4,150),
              textField(provider,provider.additionalinformation_1,"Additional Information Name 1",100,1,35),
              textField(provider,provider.additionalinformationtext_1,"Explain Additional Information Here",180,4,150),
              textField(provider,provider.additionalinformation_2,"Additional Information Name 2",100,1,35),
              textField(provider,provider.additionalinformationtext_2,"Explain Additional Information Here",180,4,150),
              textField(provider,provider.additionalinformation_3,"Additional Information Name 3",100,1,35),
              textField(provider,provider.additionalinformationtext_3,"Explain Additional Information Here",180,4,150),
              InkWell(onTap: (){
            /*  if(
              provider.username.text.isEmpty||
              provider.adress.text.isEmpty||
              provider.phone.text.isEmpty||
              provider.email.text.isEmpty||
              provider.website.text.isEmpty||
              provider.summery.text.isEmpty||
              provider.experience_1.text.isEmpty||
              provider.experience_2.text.isEmpty||
              provider.experience_3.text.isEmpty||
              provider.experiencetext_1.text.isEmpty||
              provider.experiencetext_2.text.isEmpty||
              provider.experiencetext_3.text.isEmpty||
              provider.education_1.text.isEmpty||
              provider.education_2.text.isEmpty||
              provider.education_3.text.isEmpty||
              provider.educationtext_1.text.isEmpty||
              provider.educationtext_2.text.isEmpty||
              provider.educationtext_3.text.isEmpty||
              provider.additionalinformation_1.text.isEmpty||
              provider.additionalinformation_2.text.isEmpty||
              provider.additionalinformation_3.text.isEmpty||
              provider.additionalinformationtext_1.text.isEmpty||
              provider.additionalinformationtext_2.text.isEmpty||
              provider.additionalinformationtext_3.text.isEmpty
              ){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Fill All Fields Please',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  duration: Duration(seconds: 5), ));
                }else {*/
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PdfPageX() ));
              //  }
              },child: btn()),
            ],),
          ),
        ),
      ),
    );
  }

  Container btn() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, color])),
      child: const Center(
          child: Text(
        'Generete',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  Container textField(
    Controller provider, TextEditingController controller,
      String text, double height, int lines ,  int maxLength ) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 10),
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2)),
      child: TextField(
        
        maxLength: maxLength,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLines: lines,
        decoration: InputDecoration(
          
            contentPadding: const EdgeInsets.all(10),
            labelStyle:
                const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            hintText: text,
            border: InputBorder.none),
        controller: controller,
      ),
    );
  }
}
