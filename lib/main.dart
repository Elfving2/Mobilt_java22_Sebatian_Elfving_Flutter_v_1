import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about.dart';

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
            child: myScaffold(),
      )
    );
  }
}

class myScaffold extends StatefulWidget {

  @override
  State<myScaffold> createState() => _myScaffoldState();
}

class _myScaffoldState extends State<myScaffold> {
  Color myColor = const Color(0XFF880061);
  double textSize =  10.0;
  int pressedButton = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title : Text("My App"),
        centerTitle: true,
      ),
        body : Column (
            children : [
              Text("HELLO"),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                  onPressed: () {
                  setState(() {
                    pressedButton++;
                    if (textSize < 26) {
                      textSize++; // Increment if less than 26
                    } else if (textSize > 25) {
                      textSize = 10;
                    }
                  }
                    );
                  }, child: Text("PRESS"),
              ),
              Text(
                "You have pressed button ${pressedButton} times",
                style:
                TextStyle(fontStyle: FontStyle.italic,
                fontSize: textSize,
                )
              ),

              Form(
                child: TextFormField(
                  key: Key('myTextFormFieldKey'), // Set a key if needed
                  decoration: InputDecoration(
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                    icon: Icon(Icons.person),
                  ),
                  // Other properties like validator, controller, etc. can be added here
                ),
              ),

              Center(
                child : Image.network(
                  "https://t3.ftcdn.net/jpg/05/58/09/76/360_F_558097675_pAMyqqZrlYTxz24ojSgPu4xkJXQJTHXq.jpg",
                  width: 400,
                  height: 400,
              ),
            )
          ],

        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
              if (index == 0) {
              } else if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hej())
                );
              }
            });
          },
          backgroundColor: myColor,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.abc,
                    color: Colors.pinkAccent,
                ),
                label : "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.abc,
                    color: Colors.white,
                ),
                label : "About",
            ),


          ],

    //currentIndex: _selectedIndex,
    //selectedItemColor: Colors.amber[800],
    //onTap: _onItemTapped,
    )


    );
  }
}
