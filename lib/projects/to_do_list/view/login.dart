import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_prefrence.dart';
import '../provider/to_do_list_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ToDOListProvider? T,F;

  @override
  Widget build(BuildContext context) {
    T = Provider.of<ToDOListProvider>(context,listen: true);
    F = Provider.of<ToDOListProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login to Account"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: T!.txtuserId,
                decoration: InputDecoration(
                  hintText: "Enter Id to Login",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: T!.txtuserPassword,
                decoration: InputDecoration(
                  hintText: "Enter Id to Login",
                ),
              ),
            ),
            ElevatedButton(onPressed: () async {
              String id = T!.txtuserId.text;
              String password = T!.txtuserPassword.text;
              Shr shr = Shr();
              Map m1 = await shr.readData();
              print("+=========================${m1["e1"]}");
              if(id == m1["e1"] && password == m1["p1"])
                {
                  Navigator.pushNamed(context, "Todo");
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invali Id and Password"),),);
                }
            }, child: Text("Get Start")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont Have Account?"),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, "createAccount");
                }, child: Text("create",style: TextStyle(color: Colors.blue),)),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
