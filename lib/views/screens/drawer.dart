import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nft_app/views/screens/setting.dart';


class newdrawerpage extends StatelessWidget {
  const newdrawerpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  drawer();
  }
}

class drawer extends StatefulWidget {
  const drawer({ Key? key }) : super(key: key);
 

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
   
   
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
                   Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                                 height: 170,
                                width: 170,
                                 
                                  child: Image(image: AssetImage('images/logo.png',), fit: BoxFit.fill,),
                               ),
              ],
            ),
                    Divider(thickness: 1,color: Colors.grey),
                 ListTile(
                     tileColor: Colors.white,
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
                  ListTile(
                      tileColor: Colors.white,
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
                  ListTile(
                      tileColor: Colors.white,
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
                  ListTile(
                      tileColor: Colors.white,
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
               
                 GestureDetector(
             onTap: (){
                     Get.to(Setting());
             },
                   child: ListTile(
                       tileColor: Colors.white,
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
                  SizedBox(height: 10,),
                 Card(
                   color: Color.fromARGB(255, 177, 19, 224),
                   elevation: 1,
                   child:   ListTile(
                     //tileColor: Color.fromARGB(255, 177, 19, 224),
                    title: Text('Logout', style: TextStyle(color: Colors.white),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.logout,color: Colors.white,
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