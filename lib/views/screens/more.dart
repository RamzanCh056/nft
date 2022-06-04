

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nft_app/controller/constraints.dart';
import 'package:nft_app/views/authetications/login.dart';
import 'package:nft_app/views/screens/all_history.dart';
import 'package:nft_app/views/screens/deposit_history.dart';
import 'package:nft_app/views/screens/notification.dart';
import 'package:nft_app/views/screens/refferel_link.dart';
import 'package:nft_app/views/screens/setting.dart';
import 'package:nft_app/views/screens/withdraw_history.dart';
import 'package:http/http.dart' as http;
// import 'package:settings_ui/settings_ui.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
    late double height;
  late double width;
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
            "",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 177, 19, 224),
         centerTitle: true,
        title: Text("More"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.person_add_alt_rounded,
                    size: 30.0,
                    color: Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "Referral-Invite",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  Referralink (),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color: Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
              ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.history_edu,
                    size: 30.0,
                    color:  Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "Withdraw History",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithdrawHistory(),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color:  Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
              ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.speaker_group_outlined,
                    size: 30.0,
                    color:  Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "Deposit History",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DepositHistory(),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color:  Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
              ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.find_in_page,
                    size: 30.0,
                    color:  Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "All History",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllHistory(),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color:  Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
              ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.settings,
                    size: 30.0,
                    color: Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "My Setting",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Setting(),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color:  Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
               ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.notifications,
                    size: 30.0,
                    color: Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => notification(),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color:  Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
                ListTile(
                leading: Card(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.logout,
                    size: 30.0,
                    color:  Color.fromARGB(255, 177, 19, 224),
                  ),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Card(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                          
                      Logout();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Login()));
                    
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 30.0,
                            color:  Color.fromARGB(255, 177, 19, 224),
                          ))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    
     

    ),

      
      // SafeArea(
      // child: Scaffold(
      //     appBar: AppBar(
      //   title: Text("More"),
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 177, 19, 224),
      // ),
      //        backgroundColor: HexColor("#D4F1F4"),
      // //  backgroundColor: Colors.white,
     
         
      //  body: SingleChildScrollView(
      //    child: Column(children: [
      //      SizedBox(height: 15,),
               
      //           SizedBox(
      //             height: 50,
      //             child:Card(
      //               elevation: 3,
      //               child:  Row(
      //                 children: [
      //             Icon(Icons.person_add_alt_rounded),
      //             SizedBox(width: 3,),
      //              Text('Referral-Invite',),
                   
      //             ],),),
      //           )
      //           //  GestureDetector(
      //           //    onTap: (){Get.to(Referralink());},
      //           //    child: ListTile(
      //           //        tileColor: HexColor("#D4F1F4"),
      //           //       title: Text('Referral-Invite',),
      //           //       trailing: 
      //           //       Row(
      //           //         mainAxisSize: MainAxisSize.min,
      //           //         children: [
                       
      //           //           Icon(
      //           //             LineAwesomeIcons.angle_right,
      //           //             size: 16,
      //           //           )
      //           //         ],
      //           //       ),
                   
      //           //     ),
      //           //  ),
      //           //   GestureDetector(
      //           //     onTap: (){Get.to(WithdrawHistory());},
      //           //     child: ListTile(
      //           //         tileColor: HexColor("#D4F1F4"),
      //           //       title: Text("Withdraw History"),
      //           //       trailing: Row(
      //           //         mainAxisSize: MainAxisSize.min,
      //           //         children: [
      //           //           Icon(
      //           //             LineAwesomeIcons.angle_right,
      //           //             size: 16,
      //           //           )
      //           //         ],
      //           //       ),
                     
      //           //     ),
      //           //   ),
      //           //   GestureDetector(
      //           //      onTap: (){Get.to( DepositHistory());},
      //           //     child: ListTile(
      //           //         tileColor: HexColor("#D4F1F4"),
      //           //       title: Text('Deposit History'),
      //           //       trailing: Row(
      //           //         mainAxisSize: MainAxisSize.min,
      //           //         children: [
      //           //           Icon(
      //           //             LineAwesomeIcons.angle_right,
      //           //             size: 16,
      //           //           )
      //           //         ],
      //           //       ),
                      
      //           //     ),
      //           //   ),
      //           //   GestureDetector(
      //           //       onTap: (){Get.to( AllHistory());},
      //           //     child: ListTile(
      //           //         tileColor: HexColor("#D4F1F4"),
      //           //       title: Text('All History'),
      //           //       trailing: Row(
      //           //         mainAxisSize: MainAxisSize.min,
      //           //         children: [
      //           //           Icon(
      //           //             LineAwesomeIcons.angle_right,
      //           //             size: 16,
      //           //           )
      //           //         ],
      //           //       ),
                      
      //           //     ),
      //           //   ),
               
      //           //  GestureDetector(
      //           //    onTap: (){Get.to(Setting());},
      //           //    child: ListTile(
      //           //        tileColor: HexColor("#D4F1F4"),
      //           //       title: Text('Settings'),
      //           //       trailing: Row(
      //           //         mainAxisSize: MainAxisSize.min,
      //           //         children: [
      //           //           Icon(
      //           //             LineAwesomeIcons.angle_right,
      //           //             size: 16,
      //           //           )
      //           //         ],
      //           //       ),
                     
      //           //     ),
      //           //  ),
      //           //  Card(
      //           //    color: HexColor("#D4F1F4"),
      //           //    elevation: 1,
      //           //    child:   ListTile(
      //           //      tileColor: HexColor("#D4F1F4"),
      //           //     title: Text('Logout'),
      //           //     trailing: Row(
      //           //       mainAxisSize: MainAxisSize.min,
      //           //       children: [
      //           //         Icon(
      //           //           Icons.logout,
      //           //           size: 16,
      //           //         )
      //           //       ],
      //           //     ),
                   
      //           //   ),
      //           //  )
               
              
      //    ],),
      //  ),
        
         
           
          
        
      // ),
    );
    
  }
}