import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nft_app/controller/constraints.dart';


import 'package:nft_app/views/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  dashbord() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {"logged": "$loginToken", "auth": "$auth", "dashboard": ''},
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        dashboardData = data2['message'];
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
      key: _scaffoldKey,
      drawer: Drawer(
        child: newdrawerpage(),
      ),
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
          
            Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 177, 19, 224),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "images/nftpic.jpg",
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 224, 98, 247),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Buy More NFTs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   '$loginToken',
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                              Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["balance"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Balance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                             Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["nft_value"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'NFT Value (Total:${dashboardData["total_nft"]})',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                              Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["daily"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                'Daily Profits (My NFT:${dashboardData["self_daily"]})(Team:${dashboardData["team_daily"]})',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["weekly"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Weekly Profits',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                               Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["monthly"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Monthly Profits',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                               Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["yearly"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Yearly Profits',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: dashbord(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                              Container(
                                          height: 26,width: 25,
                                          child: Image.network("http://nuoninev.com/wp-content/uploads/2021/10/Tether.png", fit: BoxFit.fill,)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${dashboardData["complete_withdraw"]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Withdrawal completed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
