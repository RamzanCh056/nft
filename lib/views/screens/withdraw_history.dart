import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nft_app/controller/constraints.dart';

import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';

class WithdrawHistory extends StatefulWidget {
  WithdrawHistory({Key? key}) : super(key: key);

  @override
  State<WithdrawHistory> createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  var searchController=TextEditingController();
  final _debouncer = Debouncer();
  var allList = [];
  var sortedLists = [];
  var searching=0;

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
        if(searching==0){
          sortedLists=withdrawhistory;
        }
      } else {
        print(response.reasonPhrase);
        print("api not hit on login$data2");
      }
    } else {}
  }
   bool _enabled = true;
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
                controller: searchController,
                onChanged: (value){
                  _debouncer.run(() {
                    setState(() {
                      searching=1;
                      sortedLists = withdrawhistory
                          .where(
                            (u) =>
                        (u['number'].toString().toLowerCase().contains(
                          value.toLowerCase(),
                        )),
                      ).toList();
                      allList = sortedLists;

                    });
                  });
                },
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
                        return Center(child: Container(
          height: 600,

		width: double.infinity,
		padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
		child: Column(
		mainAxisSize: MainAxisSize.max,
		children: <Widget>[
			Expanded(
			child: Shimmer.fromColors(
				baseColor: Colors.grey,
				highlightColor: Colors.grey,
				enabled: _enabled,
				child: ListView.builder(
				itemBuilder: (_, __) => Padding(
					padding: const EdgeInsets.only(bottom: 8.0),
					child: Row(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Container(
						width: 48.0,
						height: 48.0,
						color: Colors.white,
						),
						const Padding(
						padding: EdgeInsets.symmetric(horizontal: 8.0),
						),
						Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
							Container(
								width: double.infinity,
								height: 8.0,
								color: Colors.white,
							),
							const Padding(
								padding: EdgeInsets.symmetric(vertical: 2.0),
							),
							Container(
								width: double.infinity,
								height: 8.0,
								color: Colors.white,
							),
							const Padding(
								padding: EdgeInsets.symmetric(vertical: 2.0),
							),
							Container(
								width: 40.0,
								height: 8.0,
								color: Colors.white,
							),
							],
						),
						)
					],
					),
				),
				itemCount: 6,
				),
			),
			),
		
		],
		),
	));
                      } else {
                        return ListView.builder(
                          itemCount: sortedLists.length,
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
                                        '${sortedLists[index]["number"]}',
                                      )),
                                      Expanded(
                                          child: Text(
                                              '${sortedLists[index]["amount"]}')),
                                      Expanded(
                                          child: Text(
                                              '${sortedLists[index]["receive"]}')),
                                      Expanded(
                                          child: Text(
                                              '${sortedLists[index]["fee"]}')),
                                      Expanded(
                                          child: Text(
                                              '${sortedLists[index]["status"]}')),
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
class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
