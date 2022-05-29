import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


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
                 GestureDetector(
                   onTap: (){
                     
                      //   _launchURLlogin();
                   //  Navigator.push(context, MaterialPageRoute(builder: (context)=>  Login(),));
                   },
                   child: ListTile(
                       leading: Icon(Icons.login, color: Colors.black, size: 27,),
                       tileColor: Colors.white,
                      title: Text('Login'.tr, style: TextStyle(color: Colors.black, fontSize: 18),),
                       //trailing: Icon(Icons.arrow_drop_down_rounded),
                   
                    ),
                 ),
                     Divider(thickness: 1,color: Colors.grey),
                        
                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    
                    Divider(thickness: 1,color: Colors.grey),
                
                   
                


                    ],
                     )
            ],),
          ),
        ),
      ),
    );
  }
}