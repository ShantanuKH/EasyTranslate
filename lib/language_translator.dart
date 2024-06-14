import 'package:flutter/material.dart';

class LanguageTranslatingPage extends StatefulWidget {
  const LanguageTranslatingPage({super.key});

  @override
  State<LanguageTranslatingPage> createState() =>
      _LanguageTranslatingPageState();
}

class _LanguageTranslatingPageState extends State<LanguageTranslatingPage> {
  var languages = ['hindi', 'English', 'Marathi'];
  var originLanguage = "From";
  var destinationLanguage = 'To';
  var output = "";
  TextEditingController languagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text('Language: Translator'),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton.new(
                      focusColor: Color.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.blue,
                      hint: Text(''))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
