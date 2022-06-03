import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nft_app/controller/constraints.dart';


import 'package:nft_app/views/authetications/signup.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:nft_app/views/navigation_bar/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


var user_details;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = "";
  var password = "";

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  loginfun(String username, String password) async {
    // var data = {'username': username, 'password': password};
var auth="HSYE683H38S";
    // var data1 = json.encode(data);
    var response = await http.post(
        Uri.parse(
          'https://mining-nfts.com/api/',
        ),
        body: {
          'username': username,
          'password': password,
          'login': '1',
          "auth":"$auth"
        },
      );
       
    // request.fields.addAll({
    //   'auth': 'HSYE683H38S',
    //   'login': '1',
    //   'username': username,
    //   'password': password
    // });

    // http.StreamedResponse response = await request.send();
    var data2 = jsonDecode(response.body.toString());
    
    if(response.statusCode==200){
      var status=int.parse(data2['status']);
       if (status== 200) {
         loginToken=data2['message'];
      print("api is hit on login");
      Get.snackbar(
        "",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.green,
        messageText: Text(
          "Login successfully",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      Get.to(MaterialYou());
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
    }
    else{
       Get.snackbar(
        "Internal Server Issue",
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
   

    // if (response == 201) {

    //   // print(await response.stream.bytesToString());

    //   print("api is hit on login");
    //   Get.snackbar(
    //     "",
    //     "",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.black,
    //     borderRadius: 20,
    //     margin: EdgeInsets.all(15),
    //     colorText: Colors.green,
    //     messageText: Text(
    //       "Login successfully",
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     duration: Duration(seconds: 4),
    //     isDismissible: true,
    //     forwardAnimationCurve: Curves.easeOutBack,
    //   );

    //   Get.to(MaterialYou());
    // } else {
    //   print(response.reasonPhrase);
    //   print("api not hit on login");
      // Get.snackbar(
      //   "Wrong",
      //   "",
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.black,
      //   borderRadius: 20,
      //   margin: EdgeInsets.all(15),
      //   colorText: Colors.red,
      //   messageText: Text(
      //     "Wrong credential",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   duration: Duration(seconds: 4),
      //   isDismissible: true,
      //   forwardAnimationCurve: Curves.easeOutBack,
      // );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Center(
              child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              // Row(
              //   children: [
              //     IconButton(
              //         onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              //     Text(
              //       'Login',
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              Container(
                height: 165,
                width: double.infinity,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "User name",
                            prefixIcon: Icon(Icons.person),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          controller: usernamecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter User Name';
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.visibility),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 120, right: 120),
                child: MaterialButton(
                    color: Color.fromARGB(255, 177, 19, 224),
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 177, 19, 224),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {});
                      }
                      loginfun(
                          usernamecontroller.text, passwordcontroller.text);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  AnimatedButton(
                    height: 45,
                    width: 185,
                    text: 'Register',
                    isReverse: true,
                    selectedBackgroundColor: Color.fromARGB(255, 177, 19, 224),
                    selectedTextColor: Colors.black,
                    transitionType: TransitionType.TOP_CENTER_ROUNDER,

                    //  borderColor: Colors.white,
                    borderRadius: 50,
                    borderWidth: 2,
                    onPress: () async {
                      await Future.delayed(Duration(seconds: 1));
                      Get.to(SignUp(),
                          duration: Duration(seconds: 1),
                          transition: Transition.zoom);
                    },
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
//////
// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:nft_app/views/authetications/signup.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';
// import 'package:get/get.dart';
// import 'package:nft_app/views/navigation_bar/navigation.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart' ;
// var responce;
// class Login extends StatefulWidget {
//   const Login({ Key? key }) : super(key: key);
  

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//          var email = "";
//   var password = "";
  

//     final _formKey = GlobalKey<FormState>();
//         TextEditingController usernamecontroller = TextEditingController();
//          TextEditingController passwordcontroller = TextEditingController();
//            @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//   usernamecontroller.dispose();
//    passwordcontroller.dispose();
//     super.dispose();
//   }
//     loginfun(String username, String password) async {
//    var request = http.MultipartRequest('POST', Uri.parse('https://mining-nfts.com/api/'));
// request.fields.addAll({
//   'auth': 'HSYE683H38S',
//   'login': '1',
//   'username': username,
//   'password': password
// });


// http.StreamedResponse response = await request.send();
//  var data2 = jsonDecode(response.toString());
//     if (data2['status'] == 200) {
//       print("api is hit on login$data2");

//       print(data2);
      
//     print("api is hit on login");
//      Get.snackbar(
//               "",
//                "", 
//                snackPosition: SnackPosition.BOTTOM,
//                backgroundColor: Colors.black,
//                borderRadius: 20,
//                margin: EdgeInsets.all(15),
//                colorText: Colors.green,
//                messageText: Text("Login successfully", style: TextStyle(color: Colors.white),),
//                duration: Duration(seconds: 4),
//                isDismissible: true,
              
//                forwardAnimationCurve: Curves.easeOutBack,
                 
//                );}
//                else{ print(response.reasonPhrase);
//    print("api not hit on login");
//    Get.snackbar(
//               "Wrong",
//                "", 
//                snackPosition: SnackPosition.BOTTOM,
//                backgroundColor: Colors.black,
//                borderRadius: 20,
//                margin: EdgeInsets.all(15),
//                colorText: Colors.red,
//                messageText: Text("Wrong credential", style: TextStyle(color: Colors.white),),
//                duration: Duration(seconds: 4),
//                isDismissible: true,
              
//                forwardAnimationCurve: Curves.easeOutBack,
                 
//                );}
             
 

// // if (response.statusCode == 200) {
// //     await response.stream.bytesToString();
   
  
// //   print(response);
  
// //     print("api is hit on login");
// //      Get.snackbar(
// //               "",
// //                "", 
// //                snackPosition: SnackPosition.BOTTOM,
// //                backgroundColor: Colors.black,
// //                borderRadius: 20,
// //                margin: EdgeInsets.all(15),
// //                colorText: Colors.green,
// //                messageText: Text("Login successfully", style: TextStyle(color: Colors.white),),
// //                duration: Duration(seconds: 4),
// //                isDismissible: true,
              
// //                forwardAnimationCurve: Curves.easeOutBack,
                 
// //                );
             
// //                Get.to(  MaterialYou());
// // }
// // else {
// //   print(response.reasonPhrase);
// //    print("api not hit on login");
// //    Get.snackbar(
// //               "Wrong",
// //                "", 
// //                snackPosition: SnackPosition.BOTTOM,
// //                backgroundColor: Colors.black,
// //                borderRadius: 20,
// //                margin: EdgeInsets.all(15),
// //                colorText: Colors.red,
// //                messageText: Text("Wrong credential", style: TextStyle(color: Colors.white),),
// //                duration: Duration(seconds: 4),
// //                isDismissible: true,
              
// //                forwardAnimationCurve: Curves.easeOutBack,
                 
// //                );
  
// // }


//    }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//        resizeToAvoidBottomInset: true,
//       body: SafeArea(
 
//           child: Container(
            
//             decoration: BoxDecoration(
               
//             ),
//             child: Center(
//                 child: ListView(
//               children: [
//                 SizedBox(height: 40,),
//                 // Row(
//                 //   children: [
//                 //     IconButton(
//                 //         onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
//                 //     Text(
//                 //       'Login',
//                 //       style: TextStyle(
//                 //           fontSize: 18,
//                 //           color: Colors.black,
//                 //           fontWeight: FontWeight.bold),
//                 //     )
//                 //   ],
//                 // ),
//                 Container(
//                    height: 165,
//                    width: double.infinity,

//                   child: Image.asset('images/logo.png',fit: BoxFit.fill,),
//                 ),
//                 SizedBox(height: 70,),
//                Form(
//                  key: _formKey,
//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 16,right: 16),
//                    child: Column(children: [
//                       Container(
                     
//                         child:
//                          TextFormField(
//                           autofocus: false,
//                           decoration: InputDecoration(
//                         hintText: "User name",
//                         prefixIcon: Icon(Icons.email),
//                         hintStyle: TextStyle(color: Colors.grey),
//                          border: OutlineInputBorder(),
//                          errorStyle:
//                                 TextStyle(color: Colors.red, fontSize: 15),
//                         filled: true,
//                         fillColor: Colors.white,
//                         enabledBorder: OutlineInputBorder(
//                        //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                           borderSide: BorderSide(color: Colors.white, width: 2),
                        
//                          ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
//                         ),
//                       ),
//                       controller: usernamecontroller,
                     
                          
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please Enter User Name';
//                             } 
                            
//                           },
//                         ),
//                       ),
                   
//                          SizedBox(height: 18,),
                               
//                               Container(
                     
//                         child:
//                          TextFormField(
//                        autofocus: false,
//                            obscureText: true,
//                           decoration: InputDecoration(
//                       hintText: "Password",
//                         prefixIcon: Icon(Icons.visibility),
//                         hintStyle: TextStyle(color: Colors.grey),
//                          border: OutlineInputBorder(),
//                          errorStyle:
//                                 TextStyle(color: Colors.red, fontSize: 15),
//                         filled: true,
//                         fillColor: Colors.white,
//                         enabledBorder: OutlineInputBorder(
//                        //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                           borderSide: BorderSide(color: Colors.white, width: 2),
                        
//                          ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           borderSide: BorderSide(color: Colors.white, width: 2),
                          
                          
//                         ),
//                       ),
                       
//                         controller: passwordcontroller,
//                          validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please Enter Password';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                    ],),
//                  ),
//                ),
              
//                SizedBox(height: 25,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 120,right: 120),
//                   child: MaterialButton(
//                       color: Color.fromARGB(255, 177, 19, 224),
//                      minWidth: double.infinity,
//                         height: 50,
//                     shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             color: Color.fromARGB(255, 177, 19, 224),
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
                    
//                     onPressed: () {
//                 //  Get.to(MaterialYou());

//                             if (_formKey.currentState!.validate()) {
//                               setState(() {
                          
//                               });
                             
                              
        
                           
                                
//                             }
//                             loginfun(usernamecontroller.text,passwordcontroller.text);
                         
                     
//                     },
                    
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
                     
                      
//                       children: [
//                       Text('Login', style: TextStyle(color: Colors.white,fontSize: 18),),
//                       SizedBox(width: 10,),
//                       Icon(Icons.arrow_forward, color: Colors.white,)
//                     ],)
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Column(children: [
//                        AnimatedButton(
//               height: 45,
//               width: 185,
//               text: 'Register',
//               isReverse: true,
//               selectedBackgroundColor: Color.fromARGB(255, 177, 19, 224),
//               selectedTextColor: Colors.black,
//               transitionType: TransitionType.TOP_CENTER_ROUNDER,
              
//               //  borderColor: Colors.white,
//                borderRadius: 50,
//                borderWidth: 2,
//               onPress: () async{ 
//                 await Future.delayed(Duration(seconds: 1));
//                   Get.to(SignUp(),
//                    duration: Duration(seconds: 1),
//                    transition: Transition.zoom 
//                   );
                  
//                 },
//             ),
//                 ],)
//               ],
//             )),
//           ),
       
//       ),
//     );
//   }
// }