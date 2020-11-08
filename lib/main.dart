import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Session',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreen()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                //color: Colors.red,
                border: Border.all(color: Colors.red,width: 1,style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage("https://icons-for-free.com/iconfiles/png/512/fb+logo+social+social+media+social+network+icon-1320191784115198611.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 50,),
            Text(
                "Facebook",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.blue
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
                height: 200,
                color:Colors.pink
            ),
          ),
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
                height: 210,
                color:Colors.pink.withOpacity(0.5)
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                onChanged: (val){
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 50,),
              Text(
                controller.text
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(controller.text)));
                },
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.pink,
                  child: Center(
                    child: Text("Click me",style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {

  String msg;

  SecondScreen(this.msg);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(msg),
        ),
      ),
    );
  }
}


