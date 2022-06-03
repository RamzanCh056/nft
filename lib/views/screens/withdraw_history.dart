import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nft_app/controller/constraints.dart';

import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WithdrawHistory extends StatefulWidget {
  WithdrawHistory({Key? key}) : super(key: key);

  @override
  State<WithdrawHistory> createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  WithdrawHistory() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        "logged": "$loginToken",
        "auth": "$auth",
        "history": '',
        "withdraw_history": ''
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        withdrawhistory = data2['message'];
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
        backgroundColor: HexColor("#D4F1F4"),
        appBar: AppBar(
          title: Text("Withdraw History"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 177, 19, 224),
        ),
        body: ListView(children: [
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          'Recieve',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          'Processing',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          'Status',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: WithdrawHistory(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          itemCount: withdrawhistory.length,
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.horizontal,

                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        '${withdrawhistory[index]["number"]}',
                                      )),
                                      Expanded(
                                          child: Text(
                                              '${withdrawhistory[index]["amount"]}')),
                                      Expanded(
                                          child: Text(
                                              '${withdrawhistory[index]["receive"]}')),
                                      Expanded(
                                          child: Text(
                                              '${withdrawhistory[index]["fee"]}')),
                                      Expanded(
                                          child: Text(
                                              '${withdrawhistory[index]["status"]}')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
