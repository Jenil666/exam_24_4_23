import 'package:exam_24_4_23/projects/to_do_list/provider/to_do_list_provider.dart';
import 'package:exam_24_4_23/utils/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  ToDOListProvider? T,F;
  @override
  Widget build(BuildContext context) {
    T = Provider.of<ToDOListProvider>(context,listen: true);
    F = Provider.of<ToDOListProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: T!.txtId,
                decoration: InputDecoration(
                  hintText: "Enter Id to Register",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: T!.txtPassword,
                decoration: InputDecoration(
                  hintText: "Enter Id to Register",
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              String id = T!.txtId.text;
              String password = T!.txtPassword.text;
              Shr shr = Shr();
              shr.setData(id, password, true);
              Navigator.pushNamed(context, "Login");
              T!.txtId.clear();
              T!.txtPassword.clear();
            }, child: Text("Create Account")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have Account?"),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, "Login");
                }, child: Text("Login",style: TextStyle(color: Colors.blue),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
