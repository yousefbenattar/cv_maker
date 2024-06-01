import 'package:cv_maker/cv/fill_page.dart';
//import 'package:cv_maker/settings/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  final List _list = [
   const SeExamples(),
    Container(
      color: Colors.green,
      width: double.infinity,
      height: double.infinity,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('CV Maker',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,),
      body: _list[i],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueAccent,
        currentIndex: i,
        onTap: (e) {
          setState(() {
            i = e;
          });
        },
    items: const [
    
    BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
         ],),
    );
  }
}

final List<String> _list = [
  "assets/cv_1/1.jpg",
  "assets/cv_1/2.jpg",
  "assets/cv_1/3.jpg",
  "assets/cv_1/4.jpg",
];

class SeExamples extends StatelessWidget {
  const SeExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          padding:const EdgeInsets.all(10),
          margin:const EdgeInsets.only(right: 5,left: 5,top: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),topRight: Radius.circular(25),
            )
          ),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,   children: [
             const Expanded(child:  Text('Create A Job Winning Resume in seconds',style: TextStyle(color: Colors.blueAccent,fontSize: 20),)),
              Image.asset("assets/img1.png",height: 100,width: 100,),
              
            ],)
          ],)
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Hero(
          tag: img,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox( 
                          width: MediaQuery.of(context).size.width,  
                            child: Image(image: AssetImage(img))
                            ),
           
               ElevatedButton(onPressed: (){
               
                    Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FillPage(),));
                
               }, child:const Text("data"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
GridView.builder(
            itemCount: _list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Detail(img: _list[i]),
                    ),
                  );
                },
                child: Hero(
                  
                  tag: _list[i],
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_list[i]),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
 */