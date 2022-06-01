

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nft_app/views/screens/all_history.dart';
import 'package:nft_app/views/screens/deposit_history.dart';
import 'package:nft_app/views/screens/refferel_link.dart';
import 'package:nft_app/views/screens/setting.dart';
import 'package:nft_app/views/screens/withdraw_history.dart';
// import 'package:settings_ui/settings_ui.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
      child: Scaffold(
          appBar: AppBar(
        title: Text("More"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 177, 19, 224),
      ),
             backgroundColor: HexColor("#D4F1F4"),
      //  backgroundColor: Colors.white,
     
         
       body: SingleChildScrollView(
         child: Column(children: [
           SizedBox(height: 15,),
               
                
                 GestureDetector(
                   onTap: (){Get.to(Referralink());},
                   child: ListTile(
                       tileColor: HexColor("#D4F1F4"),
                      title: Text('Referral-Invite',),
                      trailing: 
                      Row(
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
                    onTap: (){Get.to(WithdrawHistory());},
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
                     onTap: (){Get.to( DepositHistory());},
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
                      onTap: (){Get.to( AllHistory());},
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
                   onTap: (){Get.to(Setting());},
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
                 Card(
                   color: HexColor("#D4F1F4"),
                   elevation: 1,
                   child:   ListTile(
                     tileColor: HexColor("#D4F1F4"),
                    title: Text('Logout'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.logout,
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
                
              
         ],),
       ),
        
         
           
          
        
      ),
    ),
          );
  }
}