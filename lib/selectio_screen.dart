import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select Project"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, "api");
              }, child: Text("Api"),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, "createAccount");
              }, child: Text("To Do List"),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'Pattern');
              }, child: Text("Pattern"),),
            ],
          ),
        ),
      ),
    );
  }
}
