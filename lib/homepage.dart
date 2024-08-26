import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_translator/text.dart';
import 'package:language_translator/text_scanner.dart';
import 'package:language_translator/voice.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: 
      Text("Lingify",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic),)),
       backgroundColor:  Color.fromARGB(255, 3, 94, 168),
       shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),),
       
      backgroundColor: const Color.fromARGB(255, 216, 235, 249),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              
              SizedBox(height: 20,),
              Text("  What would you like to ",
              style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                      fontSize: 25,fontWeight:FontWeight.w500,
                      ),),
                      Text("  Translate Today ?",
              style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                      fontSize: 25,fontWeight:FontWeight.w500,
                      ),),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 3, 94, 168),
                    borderRadius: BorderRadius.circular(18)
                  ),
                  // width: MediaQuery.sizeOf(context).width,
                width: 350,
                height: 380,
                child: Column(
                  children: [
                    SizedBox(height: 20,),              
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                         onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TextScreen()), // Replace YourNewPage with the name of your new page
                  );
                },
                        child: Container(
                          width: 120,
                          height: 120,
                           decoration: BoxDecoration(
                            
                            color: Color.fromARGB(255, 209, 236, 255),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          children: [
                        SizedBox(height: 15,),
                        Text("T",style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                        fontSize: 50,fontWeight: FontWeight.bold,
                        ),),
                        Text("Text",style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                        fontSize: 20,fontWeight:FontWeight.w500,
                        ),),
                                          ],
                                        ),
                        ),
                      ),
                       GestureDetector(
                        onTap: () {
                 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => VoiceScreen(text: "Thoughts leeds to feelings , feelings leads to actions and actions leads to results"),
  ),
);
                },
                         child: Container(
                           width: 120,
                            height: 120,
                          // width: 140,
                          // height: 135,
                           decoration: BoxDecoration(
                            color:   Color.fromARGB(255, 209, 236, 255),
                                             borderRadius: BorderRadius.circular(10)
                                           ),
                                           child: Column(
                                             children: [
                                               SizedBox(height: 25,),
                         Icon(Icons.mic,size: 50,color:Color.fromARGB(255, 3, 94, 168) ,),
                         SizedBox(height: 12,),
                                               Text("Voice",style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                                               fontSize: 20,fontWeight:FontWeight.w500,
                                               ),),
                                             ],
                                           ),
                                               ),
                       )
                    ],
                   ),
                   SizedBox(height: 40,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                         width: 120,
                          height: 120,
                         decoration: BoxDecoration(
                          color: Color.fromARGB(255, 209, 236, 255),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                     SizedBox(height: 25,),
                       Icon(Icons.image,size: 50,color:Color.fromARGB(255, 3, 94, 168) ,),
                       SizedBox(height: 12,),
                      Text("Image",style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                      fontSize: 20,fontWeight:FontWeight.w500,
                      ),),
                    ],
                  ),
                      ),
                       GestureDetector(
                         onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TextScanner()), // Replace YourNewPage with the name of your new page
                  );
                },
                         child: Container(
                           width: 120,
                          height: 120,
                           decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 236, 255),
                                             borderRadius: BorderRadius.circular(10)
                                           ),
                                           child: Column(
                                             children: [
                                              SizedBox(height: 25,),
                         Icon(Icons.camera_alt,size: 50,color:Color.fromARGB(255, 3, 94, 168) ,),
                         SizedBox(height: 12,),
                                               Text("Camera",style: TextStyle(color: Color.fromARGB(255, 3, 94, 168),
                                               fontSize: 20,fontWeight:FontWeight.w500,
                                               ),),
                                             ],
                                           ),
                                               ),
                       )
                    ],
                   )
                 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}