import 'package:exam_24_4_23/projects/api_calling/provider/api_provider.dart';
import 'package:exam_24_4_23/projects/api_calling/view/api_screen.dart';
import 'package:exam_24_4_23/projects/printing_pattern/view/pattern_screen.dart';
import 'package:exam_24_4_23/projects/to_do_list/provider/to_do_list_provider.dart';
import 'package:exam_24_4_23/projects/to_do_list/view/create_account.dart';
import 'package:exam_24_4_23/projects/to_do_list/view/login.dart';
import 'package:exam_24_4_23/projects/to_do_list/view/to_do_screen.dart';
import 'package:exam_24_4_23/selectio_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider(),),
        ChangeNotifierProvider(create: (context) => ToDOListProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: "api",
        routes: {
          "/":(context) => SelectionScreen(),
          "api":(context) => ApiScreen(),
          'Todo':(context) => ToDoScreen(),
          "createAccount":(context) => CreateAccount(),
          "Login":(context) => LoginScreen(),
          'Pattern':(context) => PatternScreen(),
        },
      ),
    ),
  );
}
