import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslatingPage extends StatefulWidget {
  const LanguageTranslatingPage({super.key});

  @override
  State<LanguageTranslatingPage> createState() =>
      _LanguageTranslatingPageState();
}

class _LanguageTranslatingPageState extends State<LanguageTranslatingPage> {
  var languages = ['Hindi', 'English', 'Marathi'];
  var originLanguage = "From";
  var destinationLanguage = 'To';
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = "You are translating to the same language";
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == 'English') {
      return 'en';
    } else if (language == 'Hindi') {
      return 'hi';
    } else if (language == 'Marathi') {
      return 'mr';
    } else {
      return '--';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('Language Translator', 
         style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.blue,
                    hint: Text(
                      originLanguage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.blue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        originLanguage = newValue!;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.blue,
                    hint: Text(
                      destinationLanguage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.blue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Please Enter Your Text',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                     backgroundColor:Color(0xff2b3c5a),
                  ),
                  onPressed: () {
                    translate(
                      getLanguageCode(originLanguage),
                      getLanguageCode(destinationLanguage),
                      languageController.text.toString(),
                    );
                  },
                  child: const Text('Translate'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '\n$output',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
