import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_translator/homepage.dart';
import 'package:language_translator/text_scanner.dart';
import 'package:language_translator/voice.dart';
import 'package:translator/translator.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {

  List<String> languages = [
    'English',
    'Hindi',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian',
  ];
  List<String> languagescode = [
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it',
  ];

  final translator = GoogleTranslator();
  final formkey = GlobalKey<FormState>();
  bool isloading = false;

   TextEditingController controller =
      TextEditingController(text: '');

  String from = 'en';
  String to = 'hi';
  String data = '';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';

  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("      Text  Tranlator",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25,color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 3, 94, 168),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 94, 168),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("Assets/splashscreen.png",),
                    radius: 30,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Hello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
           
          
              Container(
                  margin: EdgeInsets.only(top: 10,left: 5,right: 5),
               decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromARGB(255, 190, 221, 243)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                child: ListTile(
                title: Text('Home',style: TextStyle(color:Color.fromARGB(255, 3, 94, 168),fontSize: 20 ),),
                onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                }, ),
              ),
                Container(
                margin: EdgeInsets.only(top: 10,left: 5,right: 5),
               decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromARGB(255, 190, 221, 243)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
              child: ListTile(
                title: Text('Camera',style: TextStyle(color:Color.fromARGB(255, 3, 94, 168),fontSize: 20 )),
                onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>TextScanner()),
                            );
                }, ),
            ),
              Container(
                margin: EdgeInsets.only(top: 10,left: 5,right: 5),
               decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromARGB(255, 190, 221, 243)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
              child: ListTile(
                title: Text('Image',style: TextStyle(color:Color.fromARGB(255, 3, 94, 168),fontSize: 20 )),
                onTap: () {
                  //  Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => AdminLogin()),
                  //           );
                }, ),
            ),
              Container(
                margin: EdgeInsets.only(top: 10,left: 5,right: 5),
               decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromARGB(255, 190, 221, 243)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
              child: ListTile(
                title: Text('Voice',style: TextStyle(color:Color.fromARGB(255, 3, 94, 168),fontSize: 20 )),
                onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VoiceScreen(text: "Thoughts leeds to feelings , feelings leads to actions and actions leads to results",)),
                            );
                }, ),
            ),

          ],
        ),
      ),
      
      body:
       Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                       color:   Color.fromARGB(255, 190, 221, 243),
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: DropdownButton(
                                        value: selectedvalue,
                                        focusColor: Colors.transparent,
                                        items: languages.map((lang) {
                                          return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                    onTap: () {
                      if (lang == languages[0]) {
                        from = languagescode[0];
                      } else if (lang == languages[1]) {
                        from = languagescode[1];
                      } else if (lang == languages[2]) {
                        from = languagescode[2];
                      } else if (lang == languages[3]) {
                        from = languagescode[3];
                      } else if (lang == languages[4]) {
                        from = languagescode[4];
                      } else if (lang == languages[5]) {
                        from = languagescode[5];
                      } else if (lang == languages[6]) {
                        from = languagescode[6];
                      } else if (lang == languages[7]) {
                        from = languagescode[7];
                      } else if (lang == languages[8]) {
                        from = languagescode[8];
                      } 
                      setState(() {
                        // print(lang);
                        // print(from);
                      });
                    },
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          selectedvalue = value!;
                                        },
                                         underline: Container(),
                                      )),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                       color:   Color.fromARGB(255, 190, 221, 243),
                    borderRadius: BorderRadius.circular(30)
                    ),
                    child: Icon(Icons.compare_arrows,size: 30,),
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                       color:   Color.fromARGB(255, 190, 221, 243),
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: 
                    DropdownButton(
                  value: selectedvalue2,
                  focusColor: Colors.transparent,
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: () {
                        if (lang == languages[0]) {
                          to = languagescode[0];
                        } else if (lang == languages[1]) {
                          to = languagescode[1];
                        } else if (lang == languages[2]) {
                          to = languagescode[2];
                        } else if (lang == languages[3]) {
                          to = languagescode[3];
                        } else if (lang == languages[4]) {
                          to = languagescode[4];
                        } else if (lang == languages[5]) {
                          to = languagescode[5];
                        } else if (lang == languages[6]) {
                          to = languagescode[6];
                        } else if (lang == languages[7]) {
                          to = languagescode[7];
                        } else if (lang == languages[8]) {
                          to = languagescode[8];
                        } 
                        setState(() {
                          print(lang);
                          print(from);
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedvalue2 = value!;
                  },
                   underline: Container(),
                )),
                  ),
                ],
              ),
           
             
                  SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                     minWidth: 200,
                    minHeight: 200,
    
                 ),
               decoration: BoxDecoration(
                       color:   Color.fromARGB(255, 3, 94, 168),
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child: Form(
              key: formkey,
              child: 
              Expanded(
                child: TextFormField(
                  controller: controller,
                  maxLines: null,
                  minLines: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.white)),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
                    
                    ),
                     SizedBox(height: 20,),
                      GestureDetector(
                onTap:(){
                  setState(() {
                      isloading = true; // Set loading state to true before translation
                   });
                   translate(); 
                } ,
                child: Container(
                      width: 45,
                      height: 45,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                         color:   Color.fromARGB(255, 190, 221, 243),
                      borderRadius: BorderRadius.circular(30)
                      ),
                      child:isloading?const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(color: Colors.black,),
              ):  Image.asset("Assets/translate (1).png",fit: BoxFit.fill,)
                    ),
              ),
        SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                     minWidth: 360,
                    minHeight: 200,
    
                 ),
               decoration: BoxDecoration(
                       color:   Color.fromARGB(255, 3, 94, 168),
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child:Expanded(
                      child: SelectableText(
                        data,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    ),
                    
          const SizedBox(
            height: 30,
          )
            ],
          ),
        ),
      ),
   
    );
  }
}