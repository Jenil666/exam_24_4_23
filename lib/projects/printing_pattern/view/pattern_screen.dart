import 'package:flutter/material.dart';

class PatternScreen extends StatefulWidget {
  const PatternScreen({Key? key}) : super(key: key);

  @override
  State<PatternScreen> createState() => _PatternScreenState();
}

class _PatternScreenState extends State<PatternScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pattern"),
        ),
        body: ListView.builder(itemBuilder: (context, index) {

        },),
      ),
    );
  }
}
