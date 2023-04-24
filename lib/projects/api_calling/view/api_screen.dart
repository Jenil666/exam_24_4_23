import 'package:exam_24_4_23/projects/api_calling/modal/api_modal.dart';
import 'package:exam_24_4_23/projects/api_calling/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<ApiProvider>(context,listen: false).coronaApiCalling();
  // }
  ApiProvider? T, F;

  @override
  Widget build(BuildContext context) {
    T = Provider.of<ApiProvider>(context, listen: true);
    F = Provider.of<ApiProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Covid-19 Data"),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              Corona? data = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ExpansionTile(
                        title:
                            Text("${data.countriesStat![index].countryName}"),
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            height: 150,
                            width: double.infinity,
                            // color: Colors.red,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Cases:  ${data.countriesStat![index].cases}",style: TextStyle(fontSize: 15),),
                                Text("Deaths:  ${data.countriesStat![index].deaths}",style: TextStyle(fontSize: 15),),
                                Text("Recover:  ${data.countriesStat![index].totalRecovered}",style: TextStyle(fontSize: 15),),
                                Text("Active:  ${data.countriesStat![index].activeCases}",style: TextStyle(fontSize: 15),),
                                Text("Tests:  ${data.countriesStat![index].totalTests}",style: TextStyle(fontSize: 15),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(indent: 10, endIndent: 10, color: Colors.black),
                    ],
                  );
                },
                itemCount: data!.countriesStat!.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
          future: F!.coronaApiCalling(),
        ),
      ),
    );
  }
}
