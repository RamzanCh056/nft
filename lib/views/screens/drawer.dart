import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nft_app/controller/constraints.dart';
import 'package:nft_app/views/authetications/login.dart';
import 'package:nft_app/views/screens/all_history.dart';
import 'package:nft_app/views/screens/deposit_history.dart';
import 'package:nft_app/views/screens/refferel_link.dart';
import 'package:nft_app/views/screens/setting.dart';
import 'package:nft_app/views/screens/withdraw_history.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';

class newdrawerpage extends StatelessWidget {
  const newdrawerpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return drawer();
  }
}

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);
  
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
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
        dashboardData1 = data2['level'];
        print("api is hit on dashboard");
      } else {
        print(response.reasonPhrase);
        print("api not hit on login$data2");
      }
    } else {}
  }

  Logout() async {
    var auth = "HSYE683H38S";
    var response = await http.post(
      Uri.parse(
        'https://mining-nfts.com/api/',
      ),
      body: {
        "logged": "$loginToken",
        "auth": "$auth",
        "logout": '',
      },
    );
    var data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var status = int.parse(data2['status']);
      if (status == 200) {
        logout = data2['message'];
        print("api is hit on dashboard");
        Get.snackbar(
          "",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.green,
          messageText: Text(
            "Logout Successfully",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        Get.to(Login());
      } else {
        print(response.reasonPhrase);
        print("api not hit on login$data2");
        Get.snackbar(
          "${data2['message']}",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.red,
          messageText: Text(
            "Wrong credential",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } else {}
  }
    bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D4F1F4"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    //  color: Color.fromARGB(255, 177, 19, 224),
                      height: 130,
                      width: 270,
                      child: Image(
                        image: AssetImage(
                          'images/logo.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1, color: Colors.grey),
                GestureDetector(
                  onTap: () {
                    Get.to(Referralink());
                  },
                  child: ListTile(
                    tileColor: HexColor("#D4F1F4"),
                    title: Text(
                      'Referral-Invite',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LineAwesomeIcons.angle_right,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(WithdrawHistory());
                  },
                  child: ListTile(
                    tileColor: HexColor("#D4F1F4"),
                    title: Text("Withdraw History"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LineAwesomeIcons.angle_right,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(DepositHistory());
                  },
                  child: ListTile(
                    tileColor: HexColor("#D4F1F4"),
                    title: Text('Deposit History'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LineAwesomeIcons.angle_right,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(AllHistory());
                  },
                  child: ListTile(
                    tileColor: HexColor("#D4F1F4"),
                    title: Text('All History'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LineAwesomeIcons.angle_right,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(Setting());
                  },
                  child: ListTile(
                    tileColor: HexColor("#D4F1F4"),
                    title: Text('Settings'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LineAwesomeIcons.angle_right,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: dashbord(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Container(
          height: 100,

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
                      return Card(
                        color: Color.fromARGB(255, 177, 19, 224),
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            // Logout();
                          },
                          title: Text(
                            'Level ${dashboardData1}',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon(
                              //   Icons.stag,
                              //   color: Colors.white,
                              //   size: 16,
                              // )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Color.fromARGB(255, 177, 19, 224),
                  elevation: 1,
                  child: ListTile(
                    onTap: () {
                      Logout();
                    },
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                )
                //   SizedBox(height: 20,),
                //   Padding(
                //   padding: const EdgeInsets.only(left: 130,right: 130),
                //   child: MaterialButton(
                //       color: Color.fromARGB(255, 177, 19, 224),
                //      minWidth: double.infinity,
                //         height: 50,
                //     shape: RoundedRectangleBorder(
                //           side: BorderSide(
                //             color: Color.fromARGB(255, 177, 19, 224),
                //           ),
                //           borderRadius: BorderRadius.circular(10),
                //         ),

                //     onPressed: () {

                //     },

                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,

                //       children: [
                //         Icon(Icons.logout, color: Colors.white,),
                //         SizedBox(width: 5,),
                //       Text('Logout', style: TextStyle(color: Colors.white,fontSize: 18),),

                //     ],)
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}