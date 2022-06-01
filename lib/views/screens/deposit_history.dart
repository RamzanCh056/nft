import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nft_app/controller/constraints.dart';


import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DepositHistory extends StatefulWidget {
  DepositHistory({Key? key}) : super(key: key);

  @override
  State<DepositHistory> createState() => _DepositHistoryState();
}

class _DepositHistoryState extends State<DepositHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DepositHistory() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        "logged": "$loginToken",
        "auth": "$auth",
        "history": '',
        "deposit_history": ''
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        Deposithistory = data2['message'];
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
          title: Text("Deposit History"),
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
                future: DepositHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: Deposithistory.length,
                      physics: NeverScrollableScrollPhysics(),

                      // scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Table(
                              defaultColumnWidth: FixedColumnWidth(120.0),
                              // border: TableBorder.all(
                              //     color: Colors.grey.shade300,
                              //     style: BorderStyle.solid,
                              //     width: 2),
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
                                    Text('Pay address',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Amount',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Recieve',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Processing Fee',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Status',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('${Deposithistory[index]["id"]}')
                                  ]),
                                  Column(children: [
                                    Text(
                                        '${Deposithistory[index]["pay_address"]}')
                                  ]),
                                  Column(children: [
                                    Text(
                                        '${Deposithistory[index]["price_amount"]}')
                                  ]),
                                  Column(children: [Text('-1')]),
                                  Column(children: [Text('1')]),
                                  Column(children: [
                                    Text(
                                        '${Deposithistory[index]["payment_status"]}'),
                                    SizedBox(
                                      height: 45,
                                    ),
                                  ]),
                                ]),
                              ],
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ]));
  }
}
