import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:nft_app/views/screens/constraints.dart';
import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AllHistory extends StatefulWidget {
  AllHistory({Key? key}) : super(key: key);

  @override
  State<AllHistory> createState() => _AllHistoryState();
}

class _AllHistoryState extends State<AllHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey5 = GlobalKey<ScaffoldState>();
  AllHistory() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        "logged": "$loginToken",
        "auth": "$auth",
        "history": '',
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        Allhistory = data2['message'];
        print("api is hit on dashboard");
      } else {
        print(response.reasonPhrase);
        print("api not hit on login$data2");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey5,
        drawer: Drawer(
          child: newdrawerpage(),
        ),
        appBar: AppBar(
          title: Text("All History"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 177, 19, 224),
        ),
        body: ListView(children: [
          // SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  // border: Border.all(width: 2,color: Colors.)
                  ),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.white, fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                // controller:controller. emailController,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  // border: Border.all(width: 2,color: Colors.)
                ),
                // margin: EdgeInsets.all(20),
                child: FutureBuilder(
                  future: AllHistory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: Allhistory.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              Table(
                                defaultColumnWidth: FixedColumnWidth(140.0),
                                children: [
                                  TableRow(children: [
                                    Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('ID',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Type',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Message',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Date Time',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ]),
                                  ]),
                                  TableRow(children: [
                                    Column(children: [
                                      Text('${Allhistory[index]["id"]}')
                                    ]),
                                    Column(children: [
                                      Text('${Allhistory[index]["type"]}')
                                    ]),
                                    Column(children: [
                                      Text('${Allhistory[index]["message"]}')
                                    ]),
                                    Column(children: [
                                      Text('${Allhistory[index]["date"]}'),
                                      SizedBox(
                                        height: 25,
                                      ),
                                    ]),
                                  ]),
                                ],
                              ),
                            ]),
                          );
                        },
                      );
                    }
                  },
                ),
              )),
        ]));
  }
}
