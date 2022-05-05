// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isValid = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(FocusNode());},//close keyboard when clicked somewhere
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Email Validator"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent),),
                  labelText: "myname@mail.com",
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.mail, color: Colors.redAccent,),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  isDense: true,
                ),
                maxLines: 1,
                cursorColor: Colors.redAccent,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _checkValidity,
              child: Text("Check Validity"),
            ),
            SizedBox(height: 20,),
            Text("Email is ${isValid? '':'not '}valid"),
          ],
        ),
      ),
    );
  }

  void _checkValidity() {
    setState(() {
      isValid = EmailValidator.validate(controller.text.trim());
    });
  }

}

