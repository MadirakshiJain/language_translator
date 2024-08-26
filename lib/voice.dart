// Add this line at the beginning of your file
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class VoiceScreen extends StatefulWidget {
  final String text;
  const VoiceScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  List<String> languages = [
    'English',
    'Hindi',
    'Arabic',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese',
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
  final stt.SpeechToText _speech = stt.SpeechToText();
  
  String from = 'en';
  String to = 'hi';
  String recognizedText = '';
  String translatedText = '';
  bool isloading = false;
  bool isListening = false;

  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';

  @override
  void initState() {
    super.initState();
    recognizedText = widget.text;
  }

  void translate() async {
    setState(() {
      isloading = true;
    });
    final translation = await translator.translate(
      recognizedText,
      from: from,
      to: to,
    );
    setState(() {
      translatedText = translation.text;
      isloading = false;
    });
  }

 void startListening() {
  if (!_speech.isListening) {
    _speech.listen(
      onResult: (result) {
        setState(() {
          recognizedText = result.recognizedWords;
        });
      },
    );
    setState(() {
      isListening = true;
    });
  }
}

void stopListening() {
  if (_speech.isListening) {
    _speech.stop();
    setState(() {
      isListening = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Recognition '),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 190, 221, 243),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: selectedvalue,
                        focusColor: Colors.transparent,
                        items: languages.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                            onTap: () {
                              setState(() {
                                selectedvalue = lang;
                                from = languagescode[languages.indexOf(lang)];
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedvalue = value.toString();
                            from = languagescode[languages.indexOf(value.toString())];
                          });
                        },
                        underline: Container(),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 190, 221, 243),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.compare_arrows,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 190, 221, 243),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: DropdownButton(
                        value: selectedvalue2,
                        focusColor: Colors.transparent,
                        items: languages.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                            onTap: () {
                              setState(() {
                                selectedvalue2 = lang;
                                to = languagescode[languages.indexOf(lang)];
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedvalue2 = value.toString();
                            to = languagescode[languages.indexOf(value.toString())];
                          });
                        },
                        underline: Container(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextFormField(
                initialValue: recognizedText,
                readOnly: true,
                maxLines: null,
                minLines: null,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Recognized Text',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                onChanged: (value) async {
                  setState(() {
                    recognizedText = value;
                  });
                  final translation = await translator.translate(
                    recognizedText,
                    from: from,
                    to: to,
                  );
                  setState(() {
                    translatedText = translation.text;
                  });
                },
              ),
              SizedBox(height: 20),
             GestureDetector(
  onTap: isListening ? stopListening : startListening,
  child: Container(
    width: 45,
    height: 45,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 190, 221, 243),
      borderRadius: BorderRadius.circular(30),
    ),
    child: isListening
      ? Icon(Icons.mic, color: Colors.red) // Change the mic icon color when listening
      : Icon(Icons.mic),
  ),
),

              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isloading = true; // Set loading state to true before translation
                  });
                  translate();
                },
                child: Container(
                  width: 45,
                  height: 45,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 190, 221, 243),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: isloading
                      ? SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Icon(Icons.translate),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                  minWidth: 360,
                  minHeight: 200,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 94, 168),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Expanded(
                  child: SelectableText(
                    translatedText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
