import 'package:flutter/material.dart';
import 'package:osproj_1/tweets.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => EnterLoc(), '/location': (context) => Tweets()},
    debugShowCheckedModeBanner: false,
  ));
}

class EnterLoc extends StatefulWidget {
  const EnterLoc({Key? key}) : super(key: key);

  @override
  _EnterLocState createState() => _EnterLocState();
}

class _EnterLocState extends State<EnterLoc> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.cyanAccent])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
            child: Column(
              children: [
                /*SizedBox(height: 250),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      obscureText: false,
                      controller: myController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          borderSide:
                              BorderSide(color: Colors.black54, width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 3),
                        ),
                        labelText: "Enter your username:",
                        labelStyle: TextStyle(color: Colors.black87),
                        hintText: 'Please enter user name',
                      )),
                ),
                /*SizedBox(
                          height: 30,
                        ),*/
                ElevatedButton(
                  onPressed: () {
                    String userName = myController.text;
                    Navigator.pushNamed(context, '/location',
                        arguments: {'userName': userName});
                  },
                  child: Text("Fetch Tweets"),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    elevation: 20.0,
                    shadowColor: Colors.blueAccent,
                    onSurface: Colors.grey,
                    primary: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          )),
    )));
  }
}
