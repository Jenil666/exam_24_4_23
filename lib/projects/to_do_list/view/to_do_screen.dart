import 'package:exam_24_4_23/projects/to_do_list/provider/to_do_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {

  ToDOListProvider? T,F;
  @override
  Widget build(BuildContext context) {
    T = Provider.of<ToDOListProvider>(context,listen: true);
    F = Provider.of<ToDOListProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.all(10),
                  children: [
                    TextField(
                      controller: T!.txttitle,
                      decoration: InputDecoration(
                        hintText: "Enter Title",
                      ),
                    ),
                    TextField(
                      controller: T!.txttask,
                      decoration: InputDecoration(
                        hintText: "Enter Task",
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: () {
                      String title = T!.txttitle.text;
                      String task = T!.txttask.text;
                      T!.todotask.add(task);
                      T!.todotitle.add(title);
                      Navigator.pop(context);
                      F!.refresh();
                    }, child: Text("Save"))
                  ],
                );
              },);
            }, icon: Icon(Icons.add))
          ],
          title: Text("To Do Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("  Tasks",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
              Container(
                width: double.infinity,
                height: 500,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("   ${T!.todotitle[index]}"),
                            Text("   ${T!.todotask[index]}",style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 60,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(T!.doneCheck == true) {
                                    T!.done.add(T!.todotask[index]);
                                    F!.refresh();
                                  }
                                  F!.doneCheck = false;
                                },
                                child: Container(
                                  height: 80,
                                  width: 25,
                                  child: Icon(Icons.done),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(context: context, builder: (context) {
                                    return SimpleDialog(
                                      children: [
                                        Container(
                                          margin:EdgeInsets.all(10) ,
                                          child: TextField(
                                            controller: T!.txtupdatedtitle,
                                            decoration: InputDecoration(
                                              hintText: "Update Title"
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:EdgeInsets.all(10) ,
                                          child: TextField(
                                            controller: T!.txtupdatedtask,
                                            decoration: InputDecoration(
                                              hintText: "Update Task"
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ElevatedButton(onPressed: () {
                                          String title = T!.txtupdatedtitle.text;
                                          String task = T!.txtupdatedtask.text;
                                          T!.todotitle[index] = title;
                                          T!.todotask[index] = task;
                                          Navigator.pop(context);
                                          F!.refresh();
                                        }, child: Text("Save Changes"))
                                      ],
                                    );
                                  },);
                                },
                                child: Container(
                                  height: 80,
                                  width: 25,
                                  child: Icon(Icons.edit),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  T!.todotitle.removeAt(index);
                                  T!.todotask.removeAt(index);
                                  F!.refresh();
                                },
                                child: Container(
                                  height: 80,
                                  width: 25,
                                  child: Icon(Icons.delete),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },itemCount: T!.todotask.length,),
              ),
              Text("  done",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
              Container(
                height: 400,width: double.infinity,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text("${T!.done[index]}",style: TextStyle(fontSize: 25),),

                  );
                },itemCount: T!.done.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
