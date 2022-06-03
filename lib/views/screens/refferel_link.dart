import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nft_app/controller/constraints.dart';
import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

var ab;

class Referralink extends StatefulWidget {
  Referralink({Key? key}) : super(key: key);

  @override
  State<Referralink> createState() => _ReferralinkState();
}

class _ReferralinkState extends State<Referralink> {
  final GlobalKey<ScaffoldState> _scaffoldKe3 = GlobalKey<ScaffoldState>();
  Referrall() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        "logged": "$loginToken",
        "auth": "$auth",
        "refer": '',
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        Referral = data2['message'];
        print("api is hit on referral");
      } else {
        print(response.reasonPhrase);
        print("api not hit on referral$data2");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D4F1F4"),
      appBar: AppBar(
        title: Text("Referral Link:"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Referral',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'My Referral Link:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: Referrall(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        // enabled: false,
                        hintText: '${Referral["url"].toString()}',
                        fillColor: Colors.grey[300],
                        filled: true,
                        // suffixIcon: Icon(Icons.search),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                          //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                      // controller:controller. emailController,
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  ' Invite ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ' Marketing Idea (Team) ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'For your Downlines income to be valid, the user you invited will need to purchase at least one of our NFTs. If the name of the invited member is green, then you are earning from his daily profits depending on the level of the Downline. If the name of the user invited is red, then that account is not valid for Downlines earnings.',
                            style: TextStyle(
                                color: Colors.black54,
                                // fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'My Team',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  // border: Border.all(color: Colors.grey)),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Downline one (15% of their daily profits)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: Referrall(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: Referral['data']['level1'].length,
                            physics: NeverScrollableScrollPhysics(),

                            // // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ab = Referral['data']['level1'][index]["text"]
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // color: Color(ab.toString().length),
                                          ),
                                      child: Text(
                                        '${Referral['data']['level1'][index]["text"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Downline two (10% of their daily profits)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: Referrall(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: Referral['data']['level2'].length,
                            physics: NeverScrollableScrollPhysics(),

                            // // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ab = Referral['data']['level2'][index]["text"]
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // color: Color(ab.toString().length),
                                          ),
                                      child: Text(
                                        '${Referral['data']['level2'][index]["text"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Downline three (5% of their daily profits)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: Referrall(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: Referral['data']['level3'].length,
                            physics: NeverScrollableScrollPhysics(),

                            // // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ab = Referral['data']['level3'][index]["text"]
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // color: Color(ab.toString().length),
                                          ),
                                      child: Text(
                                        '${Referral['data']['level3'][index]["text"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Downline four (1% of their daily profits)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: Referrall(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: Referral['data']['level4'].length,
                            physics: NeverScrollableScrollPhysics(),

                            // // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ab = Referral['data']['level4'][index]
                                      ["colorCode"]
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      // height: 20,
                                      decoration: BoxDecoration(
                                        color: Color(ab.toString().length),
                                      ),
                                      child: Text(
                                        '${Referral['data']['level4'][index]["text"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Downline five (1% of their daily profits)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: Referrall(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: Referral['data']['level5'].length,
                            physics: NeverScrollableScrollPhysics(),

                            // // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ab = Referral['data']['level5'][index]["text"]
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // color: Color(ab.toString().length),
                                          ),
                                      child: Text(
                                        '${Referral['data']['level5'][index]["text"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Downline six (1% of their daily profits)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: Referrall(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: Referral['data']['level6'].length,
                            physics: NeverScrollableScrollPhysics(),

                            // // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ab = Referral['data']['level6'][index]["text"]
                                  .toString();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // color: Color(ab.toString().length),
                                          ),
                                      child: Text(
                                        '${Referral['data']['level6'][index]["text"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 6,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
