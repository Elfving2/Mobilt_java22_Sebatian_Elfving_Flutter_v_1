import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Directionality(
          textDirection: TextDirection.ltr, // Set your desired text direction here
          child: hej(),
        )
    );
  }
}

class hej extends StatefulWidget {
  @override
  State<hej> createState() => _hejState();
}

class _hejState extends State<hej> {
  int currentIndex = 0;
  String randomJokeText = "";
  Color myColor = const Color(0XFF880061);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
        title : Text("Bonnie"),
        centerTitle: true,
    ),

    body: Center(
        child : Column(
            children  : [
              TextButton(onPressed: ()
              {
                fetchData();
              },
                child : Text("Generate a random dad joke"),
              ),

              Text(randomJokeText,
              style: TextStyle())
            ]
        )
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: myColor,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => myScaffold())
              );
            }
          });
        },
    items: const <BottomNavigationBarItem> [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.abc,
          color: Colors.white,
        ),
        label : "Home",


      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.abc,
          color: Colors.pinkAccent
        ),
          label : "About",

      ),
    ],
    ));
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://icanhazdadjoke.com/slack'));

    if (response.statusCode == 200) {
      final jsonData = response.body;
      Map<String, dynamic> jsonResponse = jsonDecode(jsonData);
      List<dynamic> attachments = jsonResponse['attachments'];

      if (attachments.isNotEmpty) {
        String textValue = attachments[0]['text'];
        setState(() {
          randomJokeText = textValue;
        });
      }
    } else {
      // Request failed with an error status code
      print('Request failed with status: ${response.statusCode}' );
    }
  }


}